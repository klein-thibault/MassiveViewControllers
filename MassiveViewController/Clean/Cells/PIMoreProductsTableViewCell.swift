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

class PIMoreProductsTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var moreProductsCollectionView: UICollectionView!

    var delegate: PIMoreProductsTableViewCellDelegate?
    var moreProductsSourceItems = [
        PIProduct(resourceId: "1", name: "KRISTIN LEATHER WEDGE - GOLD METALLIC", price: 198, image: UIImage(named: "more_product1")!),
        PIProduct(resourceId: "2", name: "MOORE OPEN FRONT CARDIGAN", price: 118, image: UIImage(named: "more_product2")!),
        PIProduct(resourceId: "3", name: "CRUSH FOLDOVER STRAW CLUTCH", price: 98, image: UIImage(named: "more_product3")!)
    ]

    func setup(delegate: PIMoreProductsTableViewCellDelegate) {
        self.delegate = delegate
        self.moreProductsCollectionView.registerNib(UINib(nibName: "PICleanMoreProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PICleanMoreProductCollectionViewCell")
        self.moreProductsCollectionView.dataSource = self
        self.moreProductsCollectionView.delegate = self
    }

    // MARK: CollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.moreProductsSourceItems.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell: PICleanMoreProductCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("PICleanMoreProductCollectionViewCell",
            forIndexPath: indexPath) as! PICleanMoreProductCollectionViewCell
        let product: PIProduct = self.moreProductsSourceItems[indexPath.row]
        cell.moreProductImageView.image = product.image
        return cell
    }

    // MARK: CollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.delegate?.moreProductsTableViewCell(self, didSelectProduct: self.moreProductsSourceItems[indexPath.row])
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(145, 200)
    }

}
