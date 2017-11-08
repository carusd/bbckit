//
//  UIViewController+BBCCurrentJudgement.h
//  BBCKitDemo
//
//  Created by carusd on 2017/6/22.
//  Copyright © 2017年 duowan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BBCCurrentJudgement)

- (BOOL)bbc_isTopAtNavigationController;
- (BOOL)bbc_isCurrentInTabBarController;
- (BOOL)bbc_isMyNavigationControllerCurrentInTabBarController;
- (BOOL)bbc_isPresented;
- (BOOL)bbc_isMyNavigationControllerPresented;

- (BOOL)bbc_isCurrentViewController; // 这个方法不应该用在tabbarcontroller或者navigationcontroller上

@end
