//
//  UIDevice+BBCAdditions.m
//  BBCKitDemo
//
//  Created by carusd on 2016/9/28.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import "UIDevice+BBCAdditions.h"

@implementation UIDevice (BBCAdditions)

+ (CGFloat)bbc_systemVersionFloatValue {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

@end
