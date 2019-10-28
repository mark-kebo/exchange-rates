//
//  CountryInfo.swift
//  RevolutTestApplication
//
//  Created by Dmitry Vorozhbicki on 25/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import Foundation

class CountryInfo {
    var name: String = ""
    var code: String = ""
    var isSelected: Bool = false
    var pair: CountryInfo? = nil
    var result: Double? = nil
    
    init() { }
    
    init(code: String) {
        name = CountryCodes.allCases.first(where: { $0.key == code })?.value ?? ""
        self.code = code
    }
    
    var pairRequestCode: String? {
        guard let pair = pair, !code.isEmpty else { return nil }
        return "\(code)\(pair.code)"
    }
    
    var pairStoreCode: String? {
        guard let pair = pair, !code.isEmpty else { return nil }
        return "\(code):\(pair.code)"
    }
}
