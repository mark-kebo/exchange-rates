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
        networkStartMonitoring()
    }
    
    func showOfflineError() {
        let alert = UIAlertController(title: L10n.Alert.Offline.title, message: L10n.Alert.Info.Offline.message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: L10n.Alert.Button.cancel, style: .default, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func networkStartMonitoring() {
        NetworkManager.sharedInstance.connectionChanged = { status in
            switch status {
            case .notReachable, .unknown:
                self.showOfflineError()
            case .reachable( _): break
            }
        }
    }
}
