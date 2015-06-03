//
//  PICleanProductViewNavigator.swift
//  MassiveViewController
//
//  Created by Thibault Klein on 6/2/15.
//  Copyright (c) 2015 Prolific Interactive. All rights reserved.
//

import UIKit

class PICleanProductViewNavigator: NSObject {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func navigateToOption(index: Int) {
        var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        switch index {
        case 0:
            let descriptionViewController = storyboard.instantiateViewControllerWithIdentifier("PIDescriptionViewController") as! PIDescriptionViewController
            self.navigationController.pushViewController(descriptionViewController, animated: true)
        case 1:
            let sizeAndFitViewController = storyboard.instantiateViewControllerWithIdentifier("PISizeAndFitViewController") as! PISizeAndFitViewController
            self.navigationController.pushViewController(sizeAndFitViewController, animated: true)
        case 2:
            let userReviewsViewController = storyboard.instantiateViewControllerWithIdentifier("PIUserReviewsViewController") as! PIUserReviewsViewController
            self.navigationController.pushViewController(userReviewsViewController, animated: true)
        default:
            break
        }
    }
    
}
