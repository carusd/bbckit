//
//  UIApplication+BBCCompatibleOpenURL.h
//  BBCKitDemo
//
//  Created by carusd on 2017/4/7.
//  Copyright © 2017年 duowan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (BBCCompatibleOpenURL)

- (void)bbc_openURL:(NSURL *)url options:(NSDictionary *)options completionHandler:(void(^)(BOOL))handler;

@end
