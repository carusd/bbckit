//
//  UIImage+BBCPureColor.h
//  BBCKitDemo
//
//  Created by carusd on 2017/4/7.
//  Copyright © 2017年 duowan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BBCPureColor)

+ (UIImage *)bbc_imageWithColor:(UIColor *)color;
+ (UIImage *)bbc_imageWithColor:(UIColor *)color size:(CGSize)size;

@end
