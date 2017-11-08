//
//  UIView+BBCBadge.h
//  BBCKit
//
//  Created by carusd on 16/8/5.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const BBCUIViewBadgeDefaultTagKey;

@interface UIView (BBCBadge)

/**
 *  这是在一个view上添加红色的点，代表有提示
 *  key是红点的标识符，如果你只有一个点，建议调用无key的方法就行，如：showBadge
 */

- (void)bbc_showBadge;
- (void)bbc_showBadgeWithFrame:(CGRect)frame key:(NSString *)key;

- (void)bbc_hideBadge;
- (void)bbc_hide:(NSString *)key;

- (BOOL)bbc_showingBadge;
- (BOOL)bbc_showing:(NSString *)key;

- (void)bbc_setBadgePosition:(CGPoint)point;
- (void)bbc_set:(NSString *)key position:(CGPoint)point;

- (void)bbc_setBadgeFrame:(CGRect)frame;
- (void)bbc_set:(NSString *)key frame:(CGRect)frame;

@end
