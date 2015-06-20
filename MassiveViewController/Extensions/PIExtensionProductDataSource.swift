//
//  PIExtensionProductDataSource.swift
//  MassiveViewController
//
//  Created by Thibault Klein on 6/20/15.
//  Copyright (c) 2015 Prolific Interactive. All rights reserved.
//

import Foundation
import UIKit

extension PIExtensionProductViewController : UITableViewDataSource, UITableViewDelegate, PIProductOptionsTableViewCellDelegate, PIMoreProductsTableViewCellDelegate {

    func registerNibs(tableView: UITableView!) {
        tableView.registerNib(UINib(nibName: "PICleanProductInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "PICleanProductInfoTableViewCell")
        tableView.registerNib(UINib(nibName: "PIProductOptionsTableViewCell", bundle: nil), forCellReuseIdentifier: "PIProductOptionsTableViewCell")
        tableView.registerNib(UINib(nibName: "PIMoreProductsTableViewCell", bundle: nil), forCellReuseIdentifier: "PIMoreProductsTableViewCell")
    }

    // MARK: TableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Module.ModuleCount.rawValue
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case Module.Infos.rawValue:
            let cell = tableView.dequeueReusableCellWithIdentifier("PICleanProductInfoTableViewCell") as! PICleanProductInfoTableViewCell
            cell.setup(self.product!)
            return cell
        case Module.Options.rawValue:
            let cell = tableView.dequeueReusableCellWithIdentifier("PIProductOptionsTableViewCell") as! PIProductOptionsTableViewCell
            cell.setup(self as PIProductOptionsTableViewCellDelegate)
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("PIMoreProductsTableViewCell") as! PIMoreProductsTableViewCell
            cell.setup(self as PIMoreProductsTableViewCellDelegate)
            return cell
        }
    }

    // MARK: TableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case Module.Infos.rawValue:
            return 380
        case Module.Options.rawValue:
            return 132
        case Module.More.rawValue:
            return 200
        default:
            return 0
        }
    }

    // MARK: PIProductOptionsTableViewCellDelegate
    func productOptionsTableViewCell(cell: PIProductOptionsTableViewCell, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var navigator: PICleanProductViewNavigator = PICleanProductViewNavigator(navigationController: self.navigationController!)
        navigator.navigateToOption(indexPath.row)
    }

    // MARK: PIMoreProductsTableViewCellDelegate
    func moreProductsTableViewCell(cell: PIMoreProductsTableViewCell, didSelectProduct product: PIProduct) {
        var massiveProductViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PIMassiveProductViewController") as! PIMassiveProductViewController
        massiveProductViewController.product = product
        self.navigationController?.pushViewController(massiveProductViewController, animated: true)
    }

}