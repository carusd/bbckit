//
//  NSString+BBCStringSize.m
//  BBCKit
//
//  Created by CoolTea on 16/8/11.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import "NSString+BBCStringSize.h"

@implementation NSString (BBCStringSize)


- (CGSize)bbc_sizeWithConstrainedSize:(CGSize)size font:(UIFont *)font {
    
    CGSize result;
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    if (![self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)])
    {
        result = [self sizeWithFont:font constrainedToSize:size];
    }
    else
#endif
    {
        CGSize tmp = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
        result = CGSizeMake(ceil(tmp.width), ceil(tmp.height));
    }
    
    return result;
}


- (CGSize)bbc_sizeWithAttributes:(NSDictionary *)attributes {
    
    CGSize size;
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    if (![self respondsToSelector:@selector(sizeWithAttributes:)])
    {
        UIFont *font = attributes[NSFontAttributeName];
        if (!font) {
            font = attributes[UITextAttributeFont];
        }
        size = [self sizeWithFont:font];
    }
    else
#endif
    {
        size = [self sizeWithAttributes:attributes];
        size = CGSizeMake(ceil(size.width), ceil(size.height));
    }
    
    return size;
}

@end
