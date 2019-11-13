//
//  URL+Utils.swift
//  RevolutTestApplication
//
//  Created by Dmitry Vorozhbicki on 13/11/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import Foundation

extension URL {
    func appendParameters( params: [String:Any]) -> URL? {
        var components = URLComponents(string: self.absoluteString)
        components?.queryItems = params.map { element in URLQueryItem(name: element.key, value: element.value as? String) }
        return components?.url
    }
    
    func appendParameters( params: [String:[String]]) -> URL? {
        var components = URLComponents(string: self.absoluteString)
        var queryItems: [URLQueryItem] = []
        params.forEach({ element in
            element.value.forEach({ val in
                queryItems.append(URLQueryItem(name: element.key, value: val))
            })
        })
        components?.queryItems = queryItems
        return components?.url
    }
}
