//
//  OtherViewController.swift
//  ViewControllerDelegate
//
//  Created by Diogo Tridapalli on 10/15/15.
//  Copyright © 2015 Diogo Tridapalli. All rights reserved.
//

import UIKit

protocol OtherViewControllerDelegate : ViewControllerDelegate
{
    func shouldDismissOtherViewController(controller: OtherViewController)
}

class OtherViewController: UIViewController {
    private let text: String
    private let haveNavigationCloseButton: Bool
    private let delegate: OtherViewControllerDelegate?

    init(text: NSString, navigationCloseButton: Bool, delegate: OtherViewControllerDelegate?)
    {
        self.text = text as String
        self.haveNavigationCloseButton = navigationCloseButton
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder)
    {
        self.text = "Who knows?"
        self.haveNavigationCloseButton = false
        self.delegate = nil
        super.init(coder: aDecoder)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()

        title = "OtherViewController"
        view.backgroundColor = UIColor.whiteColor()

        if haveNavigationCloseButton {
            self.navigationItem.leftBarButtonItem =
                UIBarButtonItem(title: "Cancel",
                                style: .Plain,
                               target: self,
                               action: "dismiss")
        }

        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label);
        label.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        label.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
    }

    func dismiss()
    {
        if let delegate = delegate {
            delegate.shouldDismissOtherViewController(self)
        }
    }
}
