//
//  ApiManager.swift
//  RevolutTestApplication
//
//  Created by Dmitry Vorozhbicki on 25/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import Foundation
import Alamofire

protocol APIManagerProtocol {
    func sendRequest(url: String, parameters: Parameters?, method: HTTPMethod, encoding: ParameterEncoding, completion: @escaping (Any?, APIError?) -> Void)
}

class APIManager {
        
    static let sharedInstance = APIManager()

    private let manager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        configuration.httpMaximumConnectionsPerHost = 15
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    fileprivate let utilityQueue = DispatchQueue.main
    
    init() {
    //        let retrier = Retrier()
    //        manager.retrier = retrier
    }
}

extension APIManager: APIManagerProtocol {
    func sendRequest(url: String, parameters: Parameters?, method: HTTPMethod, encoding: ParameterEncoding = URLEncoding.default, completion: @escaping (Any?, APIError?) -> Void) {
        guard NetworkManager.sharedInstance.isNetworkReachable() else {
            completion(nil,APIError.noInternetConnection)
            return
        }
        manager.request(url, method: method, parameters: parameters, encoding: encoding, headers: Alamofire.SessionManager.defaultHTTPHeaders)
            .validate()
            .responseData(queue: utilityQueue, completionHandler: { [weak self] (response) in
                if let error = response.error {
                    print(String(describing: response.error?.localizedDescription))
                    if let request = response.request {
                        self?.handle(error:error, request:request) { error in
                            guard let error = error else {
                                self?.sendRequest(url: url, parameters: parameters, method: method, encoding: encoding, completion: completion)
                                return
                            }
                            if let data = response.data, let object = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String:String] {
                                completion(nil,APIError.other(object["error"]))
                                return
                            }
                            completion(nil,APIError.other(error.localizedDescription))
                        }
                    }
                } else {
                    completion(response.result.value,nil)
                }
            })
    }
}

private extension APIManager {
    func handle(error:Error, request:URLRequest?, completion:@escaping ((Error?) ->())) {
        guard let request = request else {
            completion(error)
            print("\(Date()) - Can't Handle Error:  No request")
            return
        }
        if let error = error as? AFError {
            if let body = request.httpBody, let json = try? JSONSerialization.jsonObject(with: body) as? [String: Any] {
                print(error.localizedDescription + "Parameters: \(String(describing: json))")
            } else {
                print(error.localizedDescription)
            }
            completion(error)
        } else {
            completion(error)
        }
    }
}

extension APIManager {
    func getCourses(parameters: [String] = [], completion:@escaping ([String: Any]?, APIError?) -> Void) {
        let parameters: Parameters = ["pairs": parameters]
        sendRequest(url: Constants.apiServer, parameters: parameters, method: .get, encoding: URLEncoding(destination: .queryString, arrayEncoding: .noBrackets, boolEncoding: .literal)) { (response, error) in
            if let error = error {
                completion(nil,error)
                return
            }
            if let data = response as? Data, let resultDictionary = try? JSONSerialization.jsonObject(with:data , options: JSONSerialization.ReadingOptions.allowFragments) as? [String:Any] {
                completion(resultDictionary, nil)
                return
            }
            completion(nil,APIError.other(L10n.apiDefaultError))
        }
    }
}
