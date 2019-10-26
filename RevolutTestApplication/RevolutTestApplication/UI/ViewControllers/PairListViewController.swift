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
    
    private var pairs: [CountryInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPairButton.setTitle(L10n.AddScreen.Button.addPair, for: .normal)
        pairsTableView.separatorStyle = .none
        pairsTableView.register(cellType: PairTableViewCell.self)
        pairsTableView.dataSource = self
        pairsTableView.delegate = self
    }
}

extension PairListViewController {
    @IBAction func addPairAction(_ sender: Any) {
        let viewController = StoryboardScene.ExchangeRates.countriesList.instantiate()
        navigationController?.modalPresentationStyle = .overCurrentContext
        viewController.callback = { [weak self] countryInfo in
            self?.addCountryPair(countryInfo)
            self?.pairsTableView.reloadData()
        }
        viewController.setSelectedPairs(pairs)
        present(viewController, animated: true, completion: nil)
    }
}

extension PairListViewController {
    func addCountryPair(_ countryInfo: CountryInfo?) {
        guard let countryInfo = countryInfo else { return }
        pairs.append(countryInfo)
    }
}

extension PairListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           self.pairs.remove(at: indexPath.row)
           tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension PairListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pairs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(for: indexPath, cellType: PairTableViewCell.self)
        cell.selectionStyle = .none
        cell.set(countryInfo: pairs[indexPath.row])
        return cell
    }
}
