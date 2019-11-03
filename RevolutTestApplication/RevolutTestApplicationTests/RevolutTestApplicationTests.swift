//
//  RevolutTestApplicationTests.swift
//  RevolutTestApplicationTests
//
//  Created by Dmitry Vorozhbicki on 28/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import XCTest
@testable import RevolutTestApplication

class RevolutTestApplicationTests: XCTestCase {
    var entitiesManager = EntitiesManager.shared
    var countriesUnderTest: [CountryInfo] = []

    override func setUp() {
        super.setUp()
        CountryCodes.allCases.forEach {
            let country = CountryInfo(code: CountryCodes(rawValue: $0.key))
            countriesUnderTest.append(country)
        }
    }

    override func tearDown() {
        countriesUnderTest = []
    }

    func testGetCoursesApiResponse() {
        let ex = expectation(description: "Expecting a JSON data not nil")
        
        APIManager.sharedInstance.getCourses(parameters: entitiesManager.pairRequestCodes) { (result, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(result)
            ex.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
    
    func testdidSelectRowAt() {
        var lastSelectedCountry: CountryInfo? = CountryInfo(code: .AUD)
        let indexPath = IndexPath(row: 2, section: 0)
        if !countriesUnderTest[indexPath.row].isSelected {
            if lastSelectedCountry != nil {
                countriesUnderTest[indexPath.row].pair = lastSelectedCountry
                lastSelectedCountry?.pair = countriesUnderTest[indexPath.row]
            } else {
                lastSelectedCountry = countriesUnderTest[indexPath.row]
            }
            countriesUnderTest[indexPath.row].isSelected = true
        } else {
            countriesUnderTest[indexPath.row].isSelected = false
        }
        
        XCTAssert(countriesUnderTest[indexPath.row].isSelected == true)
    }
    

    func testCurrencyRateDidChange() {
        let pair = CountryInfo(code: .BGN)
        let newRate: Double = 100
        pair.result = newRate
        XCTAssert(pair.result == newRate)
    }

    func testAddNewPair() {
        let mainCode = CountryInfo(code: .BGN)
        let secondCode = CountryInfo(code: .CZK)
        mainCode.pair = secondCode
        XCTAssertNotNil(mainCode.pair)
    }
}
