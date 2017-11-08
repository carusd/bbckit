//
//  UIViewController+BBCCurrentJudgement.m
//  BBCKitDemo
//
//  Created by carusd on 2017/6/22.
//  Copyright © 2017年 duowan. All rights reserved.
//

#import "UIViewController+BBCCurrentJudgement.h"

@implementation UIViewController (BBCCurrentJudgement)

- (BOOL)bbc_isTopAtNavigationController {
    if (!self.navigationController) return NO;
    return self.navigationController.topViewController == self;
}

- (BOOL)bbc_isCurrentInTabBarController {
    if (!self.tabBarController) return NO;
    return self.tabBarController.selectedViewController == self;
}

- (BOOL)bbc_isMyNavigationControllerRootViewController {
    if (!self.navigationController) return NO;
    return [[UIApplication sharedApplication] keyWindow].rootViewController == self.navigationController;
}

- (BOOL)bbc_isMyNavigationControllerCurrentInTabBarController {
    if (!self.tabBarController || !self.navigationController) return NO;
    return self.tabBarController.selectedViewController == self.navigationController;
}

- (BOOL)bbc_isPresented {
    return self.presentingViewController != nil;
}

- (BOOL)bbc_isMyNavigationControllerPresented {
    return self.navigationController.presentingViewController != nil;
}

- (BOOL)bbc_isMyNavigationControllerPresenting {
    return self.navigationController.presentedViewController != nil;
}

- (BOOL)bbc_isMyTabBarControllerPresenting {
    return self.tabBarController.presentedViewController != nil;
}

- (BOOL)bbc_isRootViewControllerPresenting {
    return [[UIApplication sharedApplication] keyWindow].rootViewController.presentedViewController != nil;
}

- (BOOL)bbc_isPresenting {
    return self.presentedViewController != nil;
}

- (BOOL)bbc_isAllPresenting {
    return [self bbc_isPresenting] || [self bbc_isMyNavigationControllerPresenting] || [self bbc_isMyTabBarControllerPresenting] || [self bbc_isRootViewControllerPresenting];
}

- (BOOL)bbc_isRootViewController {
    return [[UIApplication sharedApplication] keyWindow].rootViewController == self;
}

- (BOOL)bbc_isCurrentViewController {
    if ([self bbc_isPresented] && ![self bbc_isPresenting]) return YES;
    if ([self bbc_isMyNavigationControllerPresented] && [self bbc_isTopAtNavigationController] && ![self bbc_isMyTabBarControllerPresenting] && ![self.navigationController.topViewController bbc_isPresenting]) return YES;
    if ([self bbc_isAllPresenting]) return NO;
    if ([self bbc_isMyNavigationControllerCurrentInTabBarController] && [self bbc_isTopAtNavigationController]) return YES;
    if ([self bbc_isMyNavigationControllerRootViewController] && [self bbc_isTopAtNavigationController]) return YES;
    if ([self bbc_isRootViewController]) return YES;
    
    return NO;
}

@end
