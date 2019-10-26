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
    
    private var countries = EntitiesManager.shared.getCountries()
    private var lastSelectedCountry: CountryInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        countriesTableView.separatorStyle = .none
        countriesTableView.register(cellType: CountriesTableViewCell.self)
        countriesTableView.dataSource = self
        countriesTableView.delegate = self
    }
}

extension CountriesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard !countries[indexPath.row].isSelected else { return }
        if lastSelectedCountry != nil {
            countries[indexPath.row].pair = lastSelectedCountry
            lastSelectedCountry?.pair = countries[indexPath.row]
        } else {
            lastSelectedCountry = countries[indexPath.row]
        }
        countries[indexPath.row].isSelected = true
        countriesTableView.reloadRows(at: [indexPath], with: .top)
    }
}

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
