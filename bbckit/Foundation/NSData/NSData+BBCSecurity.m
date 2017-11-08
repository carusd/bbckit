//
//  NSData+BBCEncryption.m
//  BBCKit
//
//  Created by Liki on 16/8/12.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import "NSData+BBCSecurity.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSData (BBCSecurity)


+ (NSString * _Nullable)bbc_SHAEncryptWithSHAType:(BBCEncryptType)SHAType content:(NSString * _Nonnull)content{
    const char *cstr = [content cStringUsingEncoding:NSUTF8StringEncoding];
    
    NSData *data = [NSData dataWithBytes:cstr length:content.length];
    
    uint8_t digest[SHAType];
    
    switch (SHAType) {
        case BBCEncryptTypeSHA1:
            CC_SHA1(data.bytes, (int)data.length, digest);
            break;
        case BBCEncryptTypeSHA256:
            CC_SHA256(data.bytes, (int)data.length, digest);
            break;
        case BBCEncryptTypeSHA384:
            CC_SHA384(data.bytes, (int)data.length, digest);
            break;
        case BBCEncryptTypeSHA512:
            CC_SHA512(data.bytes, (int)data.length, digest);
            break;
        default:
            return nil;
    }
    
    NSMutableString* output = [NSMutableString stringWithCapacity:SHAType * 2];
    
    for(int i = 0; i < SHAType; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}


#pragma mark - Decrypt


@end
