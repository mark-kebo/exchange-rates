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
        addPairLabel.text = L10n.AddScreen.Label.addPair
        addPairButton.setTitle(L10n.AddScreen.Button.addPair, for: .normal)
    }

    @IBAction func addAction(_ sender: Any) {
        let viewController = StoryboardScene.ExchangeRates.countriesList.instantiate()
        present(viewController, animated: true, completion: nil)
    }
    
}

