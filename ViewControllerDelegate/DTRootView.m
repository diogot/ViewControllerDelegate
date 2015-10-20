//
//  DTRootView.m
//  ViewControllerDelegate
//
//  Created by Diogo Tridapalli on 10/15/15.
//  Copyright © 2015 Diogo Tridapalli. All rights reserved.
//

#import "DTRootView.h"

@implementation DTRootView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }

    return self;
}

- (void)setUp
{
    UIButton *buttonModal = [self buttonWithText:@"Modal View"];
    [buttonModal addTarget:self
                    action:@selector(didTapButton:)
          forControlEvents:UIControlEventTouchUpInside];
    UIButton *buttonPush = [self buttonWithText:@"Push View"];
    [buttonPush addTarget:self
                    action:@selector(didTapButton:)
          forControlEvents:UIControlEventTouchUpInside];

    UIStackView *stackView =
    [[UIStackView alloc] initWithArrangedSubviews:@[buttonModal, buttonPush]];
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFillEqually;

    [self addSubview:stackView];

    stackView.frame = self.frame;
    stackView.autoresizingMask = UIViewAutoresizingFlexibleHeight |
                                 UIViewAutoresizingFlexibleWidth;

    self.backgroundColor = [UIColor whiteColor];
}

- (UIButton *)buttonWithText:(NSString *)text
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:text forState:UIControlStateNormal];
    button.translatesAutoresizingMaskIntoConstraints = NO;

    return button;
}

- (void)didTapButton:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(didSelectedText:onView:)]) {
        [self.delegate didSelectedText:[button titleForState:UIControlStateNormal]
                                onView:self];
    }
}

@end
