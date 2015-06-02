//
//  PIProductOptionsTableViewCell.swift
//  MassiveViewController
//
//  Created by Thibault Klein on 6/1/15.
//  Copyright (c) 2015 Prolific Interactive. All rights reserved.
//

import UIKit

protocol PIProductOptionsTableViewCellDelegate {

    func productOptionsTableViewCell(cell: PIProductOptionsTableViewCell, didSelectItemAtIndexPath indexPath: NSIndexPath)

}

class PIProductOptionsTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var productOptionsTableView: UITableView!

    var delegate: PIProductOptionsTableViewCellDelegate?
    var dataSourceItems = ["Description", "Size and Fit", "User Reviews"]

    func setup(delegate: PIProductOptionsTableViewCellDelegate) {
        self.delegate = delegate
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
        self.delegate?.productOptionsTableViewCell(self, didSelectItemAtIndexPath: indexPath)
    }

}
