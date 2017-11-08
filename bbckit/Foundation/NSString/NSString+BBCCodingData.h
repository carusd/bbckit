//
//  NSString+BBCCodingData.h
//  BBCKitDemo
//
//  Created by carusd on 2017/4/7.
//  Copyright © 2017年 duowan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BBCCodingData)

+ (NSString *)bbc_SHA1StringWithData:(NSData *)data;

@end
