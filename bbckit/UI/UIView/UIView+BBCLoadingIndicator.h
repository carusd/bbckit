//
//  UIView+BBCLoadingIndicator.h
//  BBCKit
//
//  Created by carusd on 16/7/28.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const BBCUIViewLoadingIndicatorDefaultTagKey;

@interface UIView (BBCLoadingIndicator)

/**
 *  这是在一个view上添加一个loading的提示，当一个界面不同的view有不同的数据源（接口），
 *  就需要在不同的view上显示loading
 */


- (void)bbc_showLoading;
- (void)bbc_hideLoading;

@end
