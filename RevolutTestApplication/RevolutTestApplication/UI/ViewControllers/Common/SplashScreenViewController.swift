//
//  SplashScreenViewController.swift
//  RevolutTestApplication
//
//  Created by Dmitry Vorozhbicki on 28/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import UIKit

class SplashScreenViewController: BaseViewController {
    private let defaults = UserDefaults.standard
    private let entitiesManager = EntitiesManager.shared
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupRoot()
    }
}

//MARK: - Private
fileprivate extension SplashScreenViewController {
    func setupRoot() {
        if !entitiesManager.exchangePairs.isEmpty {
            appDelegate?.setupPairListViewController()
        } else {
            appDelegate?.setupRootViewController()
        }
    }
    
    func loadData() {
        let savedCodes = defaults.stringArray(forKey: Constants.defaultsKey) ?? [String]()
        savedCodes.forEach {
            let pairCodesArray = $0.components(separatedBy: ":")
            if pairCodesArray.count == 2 {
                let countryInfo = CountryInfo(code: pairCodesArray[0])
                countryInfo.pair = CountryInfo(code: pairCodesArray[1])
                entitiesManager.exchangePairs.append(countryInfo)
            }
        }
    }
}

