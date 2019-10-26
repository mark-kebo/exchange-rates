//
//  ViewController.swift
//  RevolutTestApplication
//
//  Created by Dmitry Vorozhbicki on 25/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import UIKit

class AddPairViewController: UIViewController {
    @IBOutlet private weak var addPairButton: UIButton!
    @IBOutlet private weak var addPairLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        addPairLabel.text = L10n.AddScreen.Label.addPair
        addPairButton.setTitle(L10n.AddScreen.Button.addPair, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isToolbarHidden = true
    }
}

extension AddPairViewController {
    @IBAction func addAction(_ sender: Any) {
        let viewController = StoryboardScene.ExchangeRates.countriesList.instantiate()
        navigationController?.modalPresentationStyle = .overCurrentContext
        viewController.callback = { [weak self] countryInfo in
            let viewController = StoryboardScene.ExchangeRates.pairList.instantiate()
            viewController.addCountryPair(countryInfo)
            self?.navigationController?.pushViewController(viewController, animated: true)
        }
        present(viewController, animated: true, completion: nil)
    }
}

