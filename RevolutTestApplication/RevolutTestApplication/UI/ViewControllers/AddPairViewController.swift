//
//  ViewController.swift
//  RevolutTestApplication
//
//  Created by Dmitry Vorozhbicki on 25/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import UIKit

class AddPairViewController: BaseViewController {
    @IBOutlet private weak var addPairButton: UIButton!
    @IBOutlet private weak var addPairLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        addPairLabel.text = NSLocalizedString("addScreen.label.addPair", comment: "")
        addPairButton.setTitle(NSLocalizedString("addScreen.button.addPair", comment: ""), for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isToolbarHidden = true
    }
}

// MARK: - Actions
extension AddPairViewController {
    @IBAction func addAction(_ sender: Any) {
        if let viewController = UIStoryboard(name: "ExchangeRates", bundle: nil).instantiateViewController(identifier: "CountriesListViewController") as? CountriesListViewController {
            navigationController?.modalPresentationStyle = .overCurrentContext
            viewController.callback = { [weak self] countryInfo in
                if let viewController = UIStoryboard(name: "ExchangeRates", bundle: nil).instantiateViewController(identifier: "PairListViewController") as? PairListViewController {
                    viewController.addCountryPair(countryInfo)
                    self?.navigationController?.pushViewController(viewController, animated: true)
                }
            }
            present(viewController, animated: true, completion: nil)
        }
    }
}

