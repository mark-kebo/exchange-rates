//
//  CountriesTableViewCell.swift
//  RevolutTestApplication
//
//  Created by Dmitry Vorozhbicki on 25/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import UIKit
import Reusable

class CountriesTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet private weak var codeLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var selectedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedImageView.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CountriesTableViewCell {
    public func set(countryInfo: CountryInfo) {
        codeLabel.text = countryInfo.code
        nameLabel.text = countryInfo.name
        selectedImageView.isHidden = !countryInfo.isSelected
    }
}
