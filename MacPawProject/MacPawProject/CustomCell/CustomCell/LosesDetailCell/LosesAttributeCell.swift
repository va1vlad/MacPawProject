//
//  LosesDetailCellTableViewCell.swift
//  MacPawProject
//
//  Created by user on 21.07.2022.
//

import UIKit

struct LosesAttributeModel {
    var placeholder: String
    var value: String
}

class LosesAttributeCell: UITableViewCell {

    @IBOutlet weak var placeHolderLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    func setup(with model: LosesAttributeModel) {
        placeHolderLabel.text = model.placeholder
        valueLabel.text = model.value
    }
}


