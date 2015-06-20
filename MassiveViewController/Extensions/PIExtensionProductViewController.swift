//
//  PIExtensionProductViewController.swift
//  MassiveViewController
//
//  Created by Thibault Klein on 6/20/15.
//  Copyright (c) 2015 Prolific Interactive. All rights reserved.
//

import UIKit

class PIExtensionProductViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var product: PIProduct?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.registerNibs(self.tableView)
        self.product = PIProduct.defaultProduct()
    }
    
}