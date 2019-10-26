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
    
    private var countries: [CountryInfo] = []

    private init() {
        CountryKeys.allCases.forEach {
            let country = CountryInfo()
            country.name = $0.value
            country.code = $0.key
            country.isSelected = false
            country.pair = nil
            countries.append(country)
        }
    }
    
    func getCountries() -> [CountryInfo] {
        return countries
    }
    
}
