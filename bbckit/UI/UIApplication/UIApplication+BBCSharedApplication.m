//
//  UIApplication+BBCSharedApplication.m
//  bbckit
//
//  Created by carusd on 2017/11/9.
//  Copyright © 2017年 yy. All rights reserved.
//

#import "UIApplication+BBCSharedApplication.h"

@implementation UIApplication (BBCSharedApplication)

+ (instancetype)bbc_sharedApplication {
#if !(defined(__has_feature) && __has_feature(attribute_availability_app_extension))
    return [UIApplication sharedApplication];
#else
    return nil;
#endif
}

@end
