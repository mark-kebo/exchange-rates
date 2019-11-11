//
//  NetworkManager.swift
//  CurrencyExchange
//
//  Created by Dmitry Vorozhbicki on 27/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let sharedInstance = NetworkManager()
    
    var connectionChanged:((Alamofire.NetworkReachabilityManager.NetworkReachabilityStatus) -> Void)? = nil
    let reachabilityManager:NetworkReachabilityManager!
    
    init() {
        reachabilityManager = NetworkReachabilityManager(host: "www.google.com")
        startMonitoring()
    }
    
   func startMonitoring() {
        reachabilityManager?.listener = { [weak self] status in
            print("\(Date()) - connectionChanged : ",status)
            self?.connectionChanged?(status)
        }
        reachabilityManager?.startListening()
    }
    
    func isNetworkReachable() -> Bool {
        guard let reachabilityManager = reachabilityManager else {
            print("\(Date()) - NetworkReachabilityManager not available.")
            return false
        }
        return reachabilityManager.isReachable
    }
}
