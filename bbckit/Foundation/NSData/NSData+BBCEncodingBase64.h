//
//  NSData+BBCUtil.h
//  BBCKit
//
//  Created by Liki on 16/8/12.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (BBCEncodingBase64)

/**
 *  将Data转成十六进制
 */
- (NSString *)bbc_toHexString;

@end
