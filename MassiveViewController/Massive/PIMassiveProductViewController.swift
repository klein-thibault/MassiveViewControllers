//
//  PIMassiveProductViewController.swift
//  MassiveViewController
//
//  Created by Thibault Klein on 5/29/15.
//  Copyright (c) 2015 Prolific Interactive. All rights reserved.
//

import UIKit

class PIMassiveProductViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

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
    var moreProductsSourceItems = [
        PIProduct(resourceId: "1", name: "KRISTIN LEATHER WEDGE - GOLD METALLIC", price: 198, image: UIImage(named: "more_product1")!),
        PIProduct(resourceId: "2", name: "MOORE OPEN FRONT CARDIGAN", price: 118, image: UIImage(named: "more_product2")!),
        PIProduct(resourceId: "3", name: "CRUSH FOLDOVER STRAW CLUTCH", price: 98, image: UIImage(named: "more_product3")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        loadProduct()
        setupView(product!)
    }

    func loadProduct() {
        // Here you should do an API call
        product = product != nil ? product : PIProduct.defaultProduct()
    }

    func setupView(product: PIProduct) {
        productNameLabel.text = product.name
        productImageView.image = product.image
        productPriceLabel.text = product.formattedPrice()
    }


    // MARK: TableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceItems.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("ProductOptionCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = dataSourceItems[indexPath.row]
        return cell
    }

    // MARK: TableViewDelegate
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

    // MARK: CollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moreProductsSourceItems.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell: PIMassiveMoreProductCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("MoreProductCollectionViewCell",
            forIndexPath: indexPath) as! PIMassiveMoreProductCollectionViewCell
        let product: PIProduct = self.moreProductsSourceItems[indexPath.row]
        cell.productImageView.image = product.image
        return cell
    }

    // MARK: CollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var massiveProductViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PIMassiveProductViewController") as! PIMassiveProductViewController
        massiveProductViewController.product = moreProductsSourceItems[indexPath.row]
        self.navigationController?.pushViewController(massiveProductViewController, animated: true)
    }

}