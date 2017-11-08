//
//  UIView+BBCBorder.h
//  BBCKitDemo
//
//  Created by carusd on 2017/4/7.
//  Copyright © 2017年 duowan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BBCBorder)


// 需要在哪个边设边框，就对哪个edge设大于0的数值，改值同时代表这个边的宽
- (void)bbc_setBorder:(UIEdgeInsets)edge color:(UIColor *)color;

@end
