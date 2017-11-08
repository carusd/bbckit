//
//  NSString+BBCNSDate.h
//  BBCKit
//
//  Created by CoolTea on 16/8/11.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BBCNSDate)

/**
*  @author CoolTea
*
*  @brief 格式:@"yyyy-MM-dd HH:mm:ss"的表示时间的字符串转为NSDate
*
*  @param string 只支持@"yyyy-MM-dd HH:mm:ss" 或者 @"yyyy-MM-dd"格式字符串
*
*  @return 转换后的NSDate
*
*  @since 1.0
*/
+ (NSDate*)bbc_dateFromString:(NSString*)string;

@end
