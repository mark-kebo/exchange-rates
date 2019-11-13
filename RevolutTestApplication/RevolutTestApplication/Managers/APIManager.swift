//
//  ApiManager.swift
//  RevolutTestApplication
//
//  Created by Dmitry Vorozhbicki on 25/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import Foundation

class APIManager {
        
    static let sharedInstance = APIManager()
    private let serialQueue: DispatchQueue
    private let session = URLSession(configuration: URLSessionConfiguration.default)
    
    fileprivate let utilityQueue = DispatchQueue.main
    
    init() {
        serialQueue = DispatchQueue(label: "queue")
    }
}

extension APIManager {
    public func getCourses(parameters: [String] = [], completion:@escaping ([String: Any]?, APIError?) -> Void) {
        guard NetworkManager.sharedInstance.isNetworkReachable() else {
            completion(nil,APIError.noInternetConnection)
            return
        }
        let parameters: [String:[String]] = ["pairs": parameters]

        serialQueue.async {
            guard let url = URL(string: "\(Constants.apiServer)")?.appendParameters(params: parameters) else { return }
            self.session.dataTask(with: url, completionHandler: { (data, _, error) -> Void in
                DispatchQueue.main.async {
                    if let error = error as? APIError {
                        DispatchQueue.main.async {
                            completion(nil,error)
                        }
                        return
                    }
                    if let data = data, let resultDictionary = try? JSONSerialization.jsonObject(with:data , options: JSONSerialization.ReadingOptions.allowFragments) as? [String:Any] {
                        print(String(decoding: data, as: UTF8.self))
                        DispatchQueue.main.async {
                            completion(resultDictionary, nil)
                        }
                        return
                    }
                }
            }).resume()
        }
    }
}
