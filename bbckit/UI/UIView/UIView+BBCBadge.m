//
//  UIView+BBCBadge.m
//  BBCKit
//
//  Created by carusd on 16/8/5.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import "UIView+BBCBadge.h"

NSString * const BBCUIViewBadgeDefaultTagKey = @"BBCUIViewBadgeDefaultTagKey";

@implementation UIView (BBCBadge)

- (void)bbc_showBadge {
    
    [self bbc_showBadgeWithFrame:CGRectMake(0, 0, 5, 5) key:BBCUIViewBadgeDefaultTagKey];
}

- (void)bbc_showBadgeWithFrame:(CGRect)frame key:(NSString *)key {
    UIView *notification = [[UIView alloc] initWithFrame:frame];
    
    notification.backgroundColor = [UIColor redColor];
    notification.layer.cornerRadius = CGRectGetWidth(frame) / 2;
    notification.layer.masksToBounds = YES;
    
    notification.tag = key.hash;
    [self addSubview:notification];
    
    //    notification.center = CGPointMake(CGRectGetWidth(self.bounds) / 2, CGRectGetHeight(self.bounds) / 2);
}

- (void)bbc_hideBadge {
    [self bbc_hide:BBCUIViewBadgeDefaultTagKey];
}

- (void)bbc_hide:(NSString *)key {
    [[self viewWithTag:key.hash] removeFromSuperview];
}

- (BOOL)bbc_showingBadge {
    return [self bbc_showing:BBCUIViewBadgeDefaultTagKey];
}

- (BOOL)bbc_showing:(NSString *)key {
    return [self viewWithTag:key.hash] != nil;
}

- (void)bbc_setBadgePosition:(CGPoint)point {
    [self bbc_set:BBCUIViewBadgeDefaultTagKey position:point];
}

- (void)bbc_set:(NSString *)key position:(CGPoint)point {
    [self viewWithTag:key.hash].center = point;
}

- (void)bbc_setBadgeFrame:(CGRect)frame {
    [self bbc_set:BBCUIViewBadgeDefaultTagKey frame:frame];
}

- (void)bbc_set:(NSString *)key frame:(CGRect)frame {
    UIView *notification = [self viewWithTag:key.hash];
    notification.frame = frame;
    notification.layer.cornerRadius = CGRectGetWidth(frame) / 2;
    
}


@end
