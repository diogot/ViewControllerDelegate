//
//  DTRootView.h
//  ViewControllerDelegate
//
//  Created by Diogo Tridapalli on 10/15/15.
//  Copyright © 2015 Diogo Tridapalli. All rights reserved.
//

@import UIKit;

@protocol DTRootViewDelegate;

@interface DTRootView : UIView

@property (nonatomic, weak) id<DTRootViewDelegate> delegate;

@end

@protocol DTRootViewDelegate <NSObject>

- (void)didSelectedText:(NSString *)text onView:(DTRootView *)view;

@end
