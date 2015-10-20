//
//  DTRootViewController.h
//  ViewControllerDelegate
//
//  Created by Diogo Tridapalli on 10/15/15.
//  Copyright © 2015 Diogo Tridapalli. All rights reserved.
//

@import UIKit;

@protocol ViewControllerDelegate;
@protocol DTRootViewControllerDelegate;

@interface DTRootViewController : UIViewController

@property (nonatomic, weak) id<DTRootViewControllerDelegate> delegate;

@end

@protocol DTRootViewControllerDelegate <ViewControllerDelegate>

- (void)didSelectedText:(nullable NSString *)text
   onRootViewController:(nonnull DTRootViewController *)controller;

@end