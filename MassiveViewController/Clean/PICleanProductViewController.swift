//
//  PICleanProductViewController.swift
//  MassiveViewController
//
//  Created by Thibault Klein on 5/29/15.
//  Copyright (c) 2015 Prolific Interactive. All rights reserved.
//

import UIKit

class PICleanProductViewController: UIViewController, PIProductOptionsTableViewCellDelegate, PIMoreProductsTableViewCellDelegate {

    @IBOutlet weak var productTableView: UITableView!

    var product: PIProduct?
    var dataController: PICleanProductDataController?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.product = PIProduct.defaultProduct()
        self.dataController = PICleanProductDataController(delegate: self, product: self.product!, tableView: self.productTableView)
        self.dataController!.setup()
    }

    // MARK: PIProductOptionsTableViewCellDelegate
    func productOptionsTableViewCell(cell: PIProductOptionsTableViewCell, didSelectItemAtIndexPath indexPath: NSIndexPath) {
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

    // MARK: PIMoreProductsTableViewCellDelegate
    func moreProductsTableViewCell(cell: PIMoreProductsTableViewCell, didSelectProduct product: PIProduct) {
        var massiveProductViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PIMassiveProductViewController") as! PIMassiveProductViewController
        massiveProductViewController.product = product
        self.navigationController?.pushViewController(massiveProductViewController, animated: true)
    }

}
