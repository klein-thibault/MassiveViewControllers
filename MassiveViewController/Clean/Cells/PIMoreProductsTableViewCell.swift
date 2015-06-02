//
//  PIMoreProductsTableViewCell.swift
//  MassiveViewController
//
//  Created by Thibault Klein on 6/1/15.
//  Copyright (c) 2015 Prolific Interactive. All rights reserved.
//

import UIKit

protocol PIMoreProductsTableViewCellDelegate {

    func moreProductsTableViewCell(cell: PIMoreProductsTableViewCell, didSelectProduct product: PIProduct)

}

class PIMoreProductsTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var moreProductsCollectionView: UICollectionView!

    var delegate: PIMoreProductsTableViewCellDelegate?
    var moreProductsSourceItems = [
        PIProduct(resourceId: "1", name: "KRISTIN LEATHER WEDGE - GOLD METALLIC", price: 198, image: UIImage(named: "more_product1")!),
        PIProduct(resourceId: "2", name: "MOORE OPEN FRONT CARDIGAN", price: 118, image: UIImage(named: "more_product2")!),
        PIProduct(resourceId: "3", name: "CRUSH FOLDOVER STRAW CLUTCH", price: 98, image: UIImage(named: "more_product3")!)
    ]

    func setup(delegate: PIMoreProductsTableViewCellDelegate) {
        self.delegate = delegate
    }

    // MARK: CollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moreProductsSourceItems.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell: PIMassiveMoreProductCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("MoreProductCollectionViewCell",
            forIndexPath: indexPath) as! PIMassiveMoreProductCollectionViewCell
        let product: PIProduct = moreProductsSourceItems[indexPath.row]
        cell.productImageView.image = product.image
        return cell
    }

    // MARK: CollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.delegate?.moreProductsTableViewCell(self, didSelectProduct: self.moreProductsSourceItems[indexPath.row])
    }

}
