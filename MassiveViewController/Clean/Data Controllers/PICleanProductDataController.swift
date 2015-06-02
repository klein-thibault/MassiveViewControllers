//
//  PICleanProductDataController.swift
//  MassiveViewController
//
//  Created by Thibault Klein on 6/1/15.
//  Copyright (c) 2015 Prolific Interactive. All rights reserved.
//

import UIKit

enum Module: Int {
    case Infos = 0, Options, More, ModuleCount
}

class PICleanProductDataController: NSObject, UITableViewDataSource, UITableViewDelegate {

    var delegate: Any?
    var product: PIProduct
    var tableView: UITableView!

    // MARK: Setup Methods
    init(delegate: Any?, product: PIProduct, tableView: UITableView!) {
        self.delegate = delegate
        self.product = product
        self.tableView = tableView
    }

    func registerNibs(tableView: UITableView!) {
        tableView.registerNib(UINib(nibName: "PICleanProductInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "PICleanProductInfoTableViewCell")
        tableView.registerNib(UINib(nibName: "PIProductOptionsTableViewCell", bundle: nil), forCellReuseIdentifier: "PIProductOptionsTableViewCell")
        tableView.registerNib(UINib(nibName: "PIMoreProductsTableViewCell", bundle: nil), forCellReuseIdentifier: "PIMoreProductsTableViewCell")
    }

    func setup() {
        self.registerNibs(self.tableView)

        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
    }

    // MARK: TableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Module.ModuleCount.rawValue
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case Module.Infos.rawValue:
            let cell = tableView.dequeueReusableCellWithIdentifier("PICleanProductInfoTableViewCell") as! PICleanProductInfoTableViewCell
            cell.setup(self.product)
            return cell
        case Module.Options.rawValue:
            let cell = tableView.dequeueReusableCellWithIdentifier("PIProductOptionsTableViewCell") as! PIProductOptionsTableViewCell
            cell.setup(self.delegate as! PIProductOptionsTableViewCellDelegate)
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("PIMoreProductsTableViewCell") as! PIMoreProductsTableViewCell
            cell.setup(self.delegate as! PIMoreProductsTableViewCellDelegate)
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

}
