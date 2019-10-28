//
//  EntitiesManager.swift
//  RevolutTestApplication
//
//  Created by Dmitry Vorozhbicki on 26/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import Foundation

class EntitiesManager {
    
    static let shared = EntitiesManager()
    
    var exchangePairs: [CountryInfo] = []
    
    var pairRequestCodes: [String] {
        var codes: [String] = []
        exchangePairs.forEach {
            if let code = $0.pairRequestCode {
                codes.append(code)
            }
        }
        return codes
    }
    
    var pairStoreCodes: [String] {
        var codes: [String] = []
        exchangePairs.forEach {
            if let code = $0.pairStoreCode {
                codes.append(code)
            }
        }
        return codes
    }

    private init() { }
}
