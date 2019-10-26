//
//  PairListViewController.swift
//  RevolutTestApplication
//
//  Created by Dmitry Vorozhbicki on 26/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import UIKit

class PairListViewController: UIViewController {
    
    @IBOutlet private weak var addPairButton: UIButton!
    @IBOutlet private weak var pairsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPairButton.setTitle(L10n.AddScreen.Button.addPair, for: .normal)
        pairsTableView.separatorStyle = .none
        pairsTableView.register(cellType: PairTableViewCell.self)
        pairsTableView.dataSource = self
        pairsTableView.delegate = self
    }
}

extension PairListViewController: UITableViewDelegate {
    
}

extension PairListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(for: indexPath, cellType: PairTableViewCell.self)
        cell.selectionStyle = .none
        return cell
    }
}
