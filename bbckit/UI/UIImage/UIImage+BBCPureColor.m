//
//  UIImage+BBCPureColor.m
//  BBCKitDemo
//
//  Created by carusd on 2017/4/7.
//  Copyright © 2017年 duowan. All rights reserved.
//

#import "UIImage+BBCPureColor.h"

@implementation UIImage (BBCPureColor)

+ (UIImage *)bbc_imageWithColor:(UIColor *)color
{
    return [UIImage bbc_imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)bbc_imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context  = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}


@end
