//
//  NSString+BBCCodingData.m
//  BBCKitDemo
//
//  Created by carusd on 2017/4/7.
//  Copyright © 2017年 duowan. All rights reserved.
//

#import "NSString+BBCCodingData.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (BBCCodingData)

+ (NSString *)bbc_SHA1StringWithData:(NSData *)data
{
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    
    NSMutableString *strSHA1 = [NSMutableString string];
    
    for (int i = 0 ; i < CC_SHA1_DIGEST_LENGTH ; i ++) {
        
        [strSHA1 appendFormat:@"%02x" , digest[i]];
    }
    
    return strSHA1;
}

@end
