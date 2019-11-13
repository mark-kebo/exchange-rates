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
    let codes: [String] = ["USDGBP", "GBPUSD"]

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
        
        APIManager.sharedInstance.getCourses(parameters: codes) { (result, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(result)
            XCTAssert(self.codes.count == result?.count)
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
        let vc = PairListViewController()
        let newResult: Double = 200
        vc.viewDidLoad()
        if let pairsTableView = vc.pairsTableView {
            guard let visibleRowsIndexPaths = pairsTableView.indexPathsForVisibleRows else {
                return
            }
            for indexPath in visibleRowsIndexPaths {
                if let cell = pairsTableView.cellForRow(at: indexPath) as? PairTableViewCell {
                    cell.set(result: newResult)
                    XCTAssert(String(newResult) == cell.resultLabel.text)
                }
            }
        }
    }

    func testAddNewPair() {
        let currentCount = entitiesManager.exchangePairs.count
        let mainCode = CountryInfo(code: .BGN)
        let secondCode = CountryInfo(code: .CZK)
        mainCode.pair = secondCode
        entitiesManager.exchangePairs.append(mainCode)
        XCTAssertNotNil(mainCode.pair)
        XCTAssert(currentCount + 1 == entitiesManager.exchangePairs.count)
    }
    
    func testDeletePair() {
        let currentCount = entitiesManager.exchangePairs.count
        let mainCode = CountryInfo(code: .BGN)
        let secondCode = CountryInfo(code: .CZK)
        mainCode.pair = secondCode
        entitiesManager.exchangePairs.append(mainCode)
        XCTAssert(currentCount + 1 == entitiesManager.exchangePairs.count)
        self.entitiesManager.exchangePairs.last?.pair = nil
        self.entitiesManager.exchangePairs.remove(at: self.entitiesManager.exchangePairs.count - 1)
        XCTAssertNil(mainCode.pair)
        XCTAssert(currentCount == entitiesManager.exchangePairs.count)

    }
}
