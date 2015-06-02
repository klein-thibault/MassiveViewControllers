//
//  PIProduct.swift
//  MassiveViewController
//
//  Created by Thibault Klein on 5/29/15.
//  Copyright (c) 2015 Prolific Interactive. All rights reserved.
//

import UIKit

struct PIProduct {

    let resourceId: String?
    let name: String
    let price: Float
    var image: UIImage

    init(resourceId: String?, name: String, price: Float, image: UIImage) {
        self.resourceId = resourceId
        self.name = name
        self.price = price
        self.image = image
    }

    static func defaultProduct() -> PIProduct {
        return PIProduct(
            resourceId: "1",
            name: "PEARL SHIFT DRESS",
            price: 198,
            image: UIImage(named: "product_image")!)
    }

    func formattedPrice() -> String {
        return "$\(price)"
    }
}
