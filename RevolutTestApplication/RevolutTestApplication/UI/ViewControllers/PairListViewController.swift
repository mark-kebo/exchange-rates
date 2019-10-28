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
    
    private var timer: Timer?
    
    private var exchangePairs: [CountryInfo] = []
    private var coursesCodes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPairButton.setTitle(L10n.AddScreen.Button.addPair, for: .normal)
        pairsTableView.separatorStyle = .none
        pairsTableView.register(cellType: PairTableViewCell.self)
        pairsTableView.dataSource = self
        pairsTableView.delegate = self
        
        createTimer()
    }
}

// MARK: - Actions
extension PairListViewController {
    @IBAction func addPairAction(_ sender: Any) {
        let viewController = StoryboardScene.ExchangeRates.countriesList.instantiate()
        navigationController?.modalPresentationStyle = .overCurrentContext
        viewController.callback = { [weak self] countryInfo in
            self?.addCountryPair(countryInfo)
            self?.pairsTableView.reloadData()
        }
        viewController.setSelectedPairs(exchangePairs)
        present(viewController, animated: true, completion: nil)
    }
}

// MARK: - Public
extension PairListViewController {
    func addCountryPair(_ countryInfo: CountryInfo?) {
        guard let countryInfo = countryInfo, let pair = countryInfo.pair else { return }
        exchangePairs.append(countryInfo)
        coursesCodes.append("\(countryInfo.code)\(pair.code)")
        getCourses()
    }
}

// MARK: - UITableViewDelegate
extension PairListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let pair = exchangePairs[indexPath.row].pair else { return }
            coursesCodes = coursesCodes.filter {$0 != "\(exchangePairs[indexPath.row].code)\(pair.code)"}
            self.exchangePairs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if exchangePairs.isEmpty {
                (UIApplication.shared.delegate as? AppDelegate)?.setupRootViewController()
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension PairListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exchangePairs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(for: indexPath, cellType: PairTableViewCell.self)
        cell.selectionStyle = .none
        cell.set(countryInfo: exchangePairs[indexPath.row])
        return cell
    }
}

// MARK: - Request
private extension PairListViewController {
    func getCourses() {
        APIManager.sharedInstance.getCourses(parameters: coursesCodes) { [weak self] (result, error) in
            guard let self = self else { return }
            result?.forEach { course in
                autoreleasepool {
                    self.exchangePairs.forEach { exchangePair in
                        guard let pair = exchangePair.pair else { return }
                        if course.key == "\(exchangePair.code)\(pair.code)" {
                            exchangePair.result = course.value as? Double
                        }
                    }
                }
            }
            if let pairsTableView = self.pairsTableView {
                guard let visibleRowsIndexPaths = pairsTableView.indexPathsForVisibleRows else {
                    return
                }
                for indexPath in visibleRowsIndexPaths {
                    if let cell = pairsTableView.cellForRow(at: indexPath) as? PairTableViewCell {
                        cell.set(result: self.exchangePairs[indexPath.row].result)
                    }
                }
            }
        }
    }
}

// MARK: - Timer
private extension PairListViewController {
    func createTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(updateTimer),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
    
    @objc func updateTimer() {
        getCourses()
    }
}
