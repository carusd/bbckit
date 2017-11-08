//
//  UIView+BBCLoadingIndicator.m
//  BBCKit
//
//  Created by carusd on 16/7/28.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import "UIView+BBCLoadingIndicator.h"

NSString * const BBCUIViewLoadingIndicatorDefaultTagKey = @"BBCUIViewLoadingIndicatorDefaultTagKey";

@implementation UIView (BBCLoadingIndicator)

- (void)bbc_showLoading {
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    loadingView.tag = BBCUIViewLoadingIndicatorDefaultTagKey.hash;
    loadingView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:loadingView];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:loadingView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:loadingView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    [loadingView startAnimating];
}

- (void)bbc_hideLoading {
    [[self viewWithTag:BBCUIViewLoadingIndicatorDefaultTagKey.hash] removeFromSuperview];
}

@end
