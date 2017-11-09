//
//  UIApplication+BBCCompatibleOpenURL.m
//  BBCKitDemo
//
//  Created by carusd on 2017/4/7.
//  Copyright © 2017年 duowan. All rights reserved.
//

#import "UIApplication+BBCCompatibleOpenURL.h"
#import "UIApplication+BBCSharedApplication.h"

@implementation UIApplication (BBCCompatibleOpenURL)

- (void)bbc_openURL:(NSURL *)url options:(NSDictionary *)options completionHandler:(void(^)(BOOL))handler {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10) {
        [[UIApplication bbc_sharedApplication] openURL:url options:options completionHandler:handler];
    } else {
        BOOL result = [[UIApplication bbc_sharedApplication] openURL:url];
        if (handler) {
            handler(result);
        }
    }
}


@end
