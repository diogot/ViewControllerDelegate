//
//  NavigationController.swift
//  ViewControllerDelegate
//
//  Created by Diogo Tridapalli on 10/15/15.
//  Copyright © 2015 Diogo Tridapalli. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, DTRootViewControllerDelegate, OtherViewControllerDelegate
{
    override func awakeFromNib()
    {
        let controller = DTRootViewController()
        controller.delegate = self
        self.setViewControllers([controller], animated: false)
    }

    // MARK: DTRootViewController

    func didSelectedText(text: String?, onRootViewController controller: DTRootViewController)
    {
        if let text = text {
            self.presentOtherViewControllerWithText(text)
        } else {
            print("do nothing")
        }
    }

    // MARK: OtherViewController

    func presentOtherViewControllerWithText(text: String)
    {
        if text.localizedCaseInsensitiveContainsString("modal") {
            let controller = OtherViewController(text: text, navigationCloseButton: true, delegate: self)
            self.presentViewControllerWithNavigationController(controller, animated: true)
        } else if text.localizedCaseInsensitiveContainsString("push") {
            let controller = OtherViewController(text: text, navigationCloseButton: false, delegate: nil)
            self.pushViewController(controller, animated: true)
        }
    }

    func shouldDismissOtherViewController(controller: OtherViewController)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK:
    func presentViewControllerWithNavigationController(controller: UIViewController,
                                                         animated: Bool)
    {
        let navigation = UINavigationController(rootViewController: controller)
        self.presentViewController(navigation, animated: animated, completion: nil)
    }
}
