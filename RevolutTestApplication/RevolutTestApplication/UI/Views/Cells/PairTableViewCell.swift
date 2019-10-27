//
//  PairTableViewCell.swift
//  RevolutTestApplication
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
    public func set(countryInfo: CountryInfo) {
        firstValueKeyLabel.text = "1 \(countryInfo.code)"
        firstValueNameLabel.text = countryInfo.name
        if let secondCountryInfo = countryInfo.pair {
            secondValueNameLabel.text = "\(secondCountryInfo.name) : \(secondCountryInfo.code)"
        }
        if let result = countryInfo.result {
            resultLabel.text = String(result)
        }
    }
}
