//
//  NSData+BBCUtil.m
//  BBCKit
//
//  Created by Liki on 16/8/12.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import "NSData+BBCEncodingBase64.h"

@implementation NSData (BBCUtils)

- (NSString *)bbc_toHexString {
    
    NSUInteger length = self.length;
    NSMutableString *result = [NSMutableString stringWithCapacity:length * 2];
    
    const unsigned char *byte = self.bytes;
    
    for (int i = 0; i < length; i++, byte++) {
        
        [result appendFormat:@"%02X", *byte];
        
    }
    return result;
}
@end
