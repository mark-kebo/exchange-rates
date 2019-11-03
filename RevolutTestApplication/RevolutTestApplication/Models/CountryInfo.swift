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
    var code: CountryCodes? = nil
    var isSelected: Bool = false
    var pair: CountryInfo? = nil
    var result: Double? = nil
    
    init() { }
    
    init(code: CountryCodes?) {
        guard let code = code else { return }
        name = CountryCodes.allCases.first(where: { $0.key == code.rawValue })?.value ?? ""
        self.code = code
    }
    
    var pairRequestCode: String? {
        guard let code = code, let pairCode = pair?.code, !pairCode.rawValue.isEmpty, !code.rawValue.isEmpty else { return nil }
        return "\(code)\(pairCode)"
    }
    
    var pairStoreCode: String? {
        guard let code = code, let pairCode = pair?.code, !pairCode.rawValue.isEmpty, !code.rawValue.isEmpty else { return nil }
        return "\(code):\(pairCode)"
    }
}
