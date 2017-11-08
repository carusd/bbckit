//
//  NSData+BBCEncryption.h
//  BBCKit
//
//  Created by Liki on 16/8/12.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,BBCEncryptType) {
    BBCEncryptTypeSHA1 = 20,    // 对应 CC_SHA1_DIGEST_LENGTH
    BBCEncryptTypeSHA256 = 32,  // 对应 CC_SHA256_DIGEST_LENGTH
    BBCEncryptTypeSHA384 = 48,  // 对应 CC_SHA384_DIGEST_LENGTH
    BBCEncryptTypeSHA512 = 64   // 对应 CC_SHA512_DIGEST_LENGTH
};

@interface NSData (BBCSecurity)

#pragma mark -  Encrypt
#pragma mark -- SHA
/**
 *  采用SHA类型加密数据,并返回加密后的密文
 *  @param type 加密类型,支持SHA1、SHA256、SHA384、SHA512
 *  @return 加密后的数据;如果加密类型不匹配时，返回nil.
 */
+ (NSString * _Nullable)bbc_SHAEncryptWithSHAType:(BBCEncryptType)SHAType content:(NSString * _Nonnull)content;

#pragma mark - Decrypt




@end
