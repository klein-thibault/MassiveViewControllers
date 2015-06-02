//
//  PICleanProductInfoTableViewCell.swift
//  MassiveViewController
//
//  Created by Thibault Klein on 6/1/15.
//  Copyright (c) 2015 Prolific Interactive. All rights reserved.
//

import UIKit

class PICleanProductInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productImageLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!

    func setup(product: PIProduct) {
        productImageView.image = product.image
        productImageLabel.text = product.name
        productPriceLabel.text = product.formattedPrice()
    }

}
