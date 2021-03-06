//
//  PairTableViewCell.swift
//  CurrencyExchange
//
//  Created by Dmitry Vorozhbicki on 26/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import UIKit
import Reusable

class PairTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet private weak var firstValueKeyLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var firstValueNameLabel: UILabel!
    @IBOutlet private weak var secondValueNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension PairTableViewCell {
    func set(countryInfo: CountryInfo) {
        firstValueNameLabel.text = countryInfo.name
        if let result = countryInfo.result {
            resultLabel.text = String(result)
        }
        guard let code = countryInfo.code?.rawValue else { return }
        firstValueKeyLabel.text = "1 \(code)"
        if let secondCountryInfo = countryInfo.pair, let secondCode = secondCountryInfo.code {
            secondValueNameLabel.text = "\(secondCountryInfo.name) : \(secondCode)"
        }

    }
    
    func set(result: Double?) {
        if let result = result {
            resultLabel.text = String(result)
        }
    }
}
