//
//  CountriesListViewController.swift
//  CurrencyExchange
//
//  Created by Dmitry Vorozhbicki on 25/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import UIKit

class CountriesListViewController: BaseViewController {
    @IBOutlet weak var countriesTableView: UITableView!
    
    private var countries: [CountryInfo] = []
    private var selectedPairs: [CountryInfo] = []
    private var lastSelectedCountry: CountryInfo?
    
    var callback: ((_ countryInfo: CountryInfo?) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareData()
        countriesTableView.separatorStyle = .none
        countriesTableView.register(cellType: CountriesTableViewCell.self)
        countriesTableView.dataSource = self
        countriesTableView.delegate = self
    }
    
    private func prepareData() {
        CountryCodes.allCases.forEach {
            let country = CountryInfo(code: CountryCodes(rawValue: $0.key))
            countries.append(country)
        }
        countries = countries.sorted(by: {
            guard let firstCode = $0.code?.rawValue, let secondCode = $1.code?.rawValue else { return false }
            return firstCode < secondCode
        })
    }
}

// MARK: - Alert
private extension CountriesListViewController {
    func showAddAlert() {
        let alert = UIAlertController(title: L10n.Alert.currencyPairAlreadyExists, message: nil, preferredStyle: .alert)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: - Public
extension CountriesListViewController {
    func setSelectedPairs(_ selectedPairs: [CountryInfo]) {
        self.selectedPairs = selectedPairs
    }
}

// MARK: - UITableViewDelegate
extension CountriesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for selectedPair in selectedPairs {
            if selectedPair.code == lastSelectedCountry?.code && selectedPair.pair?.code == countries[indexPath.row].code {
                showAddAlert()
                return
            }
        }
        if !countries[indexPath.row].isSelected {
            if lastSelectedCountry != nil {
                countries[indexPath.row].pair = lastSelectedCountry
                lastSelectedCountry?.pair = countries[indexPath.row]
                dismiss(animated: true, completion: nil)
                callback?(lastSelectedCountry)
            } else {
                lastSelectedCountry = countries[indexPath.row]
            }
            countries[indexPath.row].isSelected = true
        } else {
            countries[indexPath.row].isSelected = false
            lastSelectedCountry = nil
        }
        countriesTableView.reloadRows(at: [indexPath], with: .top)
    }
}

// MARK: - UITableViewDataSource
extension CountriesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(for: indexPath, cellType: CountriesTableViewCell.self)
        cell.selectionStyle = .none
        cell.set(countryInfo: countries[indexPath.row])
        return cell
    }
    
    
}
