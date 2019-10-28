//
//  CountriesListViewController.swift
//  RevolutTestApplication
//
//  Created by Dmitry Vorozhbicki on 25/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import UIKit

class CountriesListViewController: UIViewController {
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
        CountryKeys.allCases.forEach {
            let country = CountryInfo()
            country.name = $0.value
            country.code = $0.key
            countries.append(country)
        }
        countries = countries.sorted(by: { $0.code < $1.code })
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
        guard !countries[indexPath.row].isSelected else { return }
        for selectedPair in selectedPairs {
            if selectedPair.code == lastSelectedCountry?.code && selectedPair.pair?.code == countries[indexPath.row].code {
                showAddAlert()
                return
            }
        }
        if lastSelectedCountry != nil {
            countries[indexPath.row].pair = lastSelectedCountry
            lastSelectedCountry?.pair = countries[indexPath.row]
            dismiss(animated: true, completion: nil)
            callback?(lastSelectedCountry)
        } else {
            lastSelectedCountry = countries[indexPath.row]
        }
        countries[indexPath.row].isSelected = true
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
