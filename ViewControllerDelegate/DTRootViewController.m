//
//  DTRootViewController.m
//  ViewControllerDelegate
//
//  Created by Diogo Tridapalli on 10/15/15.
//  Copyright © 2015 Diogo Tridapalli. All rights reserved.
//

#import "DTRootViewController.h"
#import "DTRootView.h"

@interface DTRootViewController () <DTRootViewDelegate>

@end

@implementation DTRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Root View Controller";

    UIView *contentView = self.view;
    DTRootView *view = [[DTRootView alloc] initWithFrame:contentView.frame];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight |
                            UIViewAutoresizingFlexibleWidth;
    [contentView addSubview:view];
    view.delegate = self;
}

- (void)didSelectedText:(NSString *)text onView:(DTRootView *)view
{
    if (self.delegate) {
        [self.delegate didSelectedText:text onRootViewController:self];
    }
}

@end
