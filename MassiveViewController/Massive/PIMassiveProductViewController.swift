//
//  PIMassiveProductViewController.swift
//  MassiveViewController
//
//  Created by Thibault Klein on 5/29/15.
//  Copyright (c) 2015 Prolific Interactive. All rights reserved.
//

import UIKit

typealias TableViewDataSource = PIMassiveProductViewController
typealias TableViewDelegate = PIMassiveProductViewController

class PIMassiveProductViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Product Informations View
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!

    // Options
    @IBOutlet weak var optionsTableView: UITableView!

    // More Products
    @IBOutlet weak var moreProductsCollectionView: UICollectionView!

    var product: PIProduct?
    var dataSourceItems = ["Description", "Size and Fit", "User Reviews"]

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

// MARK: TableViewDataSource
extension TableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("ProductOptionCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = dataSourceItems[indexPath.row]
        return cell
    }
}

// MARK: TableViewDelegate
extension TableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let descriptionViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PIDescriptionViewController") as! PIDescriptionViewController
            self.navigationController?.pushViewController(descriptionViewController, animated: true)
        case 1:
            let sizeAndFitViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PISizeAndFitViewController") as! PISizeAndFitViewController
            self.navigationController?.pushViewController(sizeAndFitViewController, animated: true)
        case 2:
            let userReviewsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PIUserReviewsViewController") as! PIUserReviewsViewController
            self.navigationController?.pushViewController(userReviewsViewController, animated: true)
        default:
            break
        }
    }
}
