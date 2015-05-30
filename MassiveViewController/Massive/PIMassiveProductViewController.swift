//
//  PIMassiveProductViewController.swift
//  MassiveViewController
//
//  Created by Thibault Klein on 5/29/15.
//  Copyright (c) 2015 Prolific Interactive. All rights reserved.
//

import UIKit

class PIMassiveProductViewController: UIViewController {

    // Product Informations View
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!

    // Options
    @IBOutlet weak var optionsTableView: UITableView!

    // More Products
    @IBOutlet weak var moreProductsCollectionView: UICollectionView!

    var product: PIProduct?

    override func viewDidLoad() {
        super.viewDidLoad()

        loadProduct()
        setupView(product!)
    }

    func loadProduct() {
        // Here you should do an API call
        product = PIProduct.defaultProduct()
    }

    func setupView(product: PIProduct) {
        productNameLabel.text = product.name
        productImageView.image = product.image
        productPriceLabel.text = "$\(product.price)"
    }

}
