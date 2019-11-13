//
//  BaseViewController.swift
//  RevolutTestApplication
//
//  Created by Dmitry Vorozhbicki on 28/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func showOfflineError() {
        let alert = UIAlertController(title: NSLocalizedString("alert.noInternetConnection", comment: ""), message: NSLocalizedString("alert.info.offline.message", comment: ""), preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: NSLocalizedString("alert.button.cancel", comment: ""), style: .default, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showError(title: String?, message: String?) {
        let alert = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: NSLocalizedString("alert.button.cancel", comment: ""), style: .default, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
}
