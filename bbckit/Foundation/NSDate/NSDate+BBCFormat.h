//
//  NSDate+BBCFormat.h
//  BBCKit
//
//  Created by lerosua on 16/7/28.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BBCFormat)
/**
 *  检测这个Date是不是今天
 *
 *  @return 返回比较结果
 */
- (BOOL)bbc_isToday;

/**
 *  检测这个Date是不是明天
 *
 *  @return 返回比较结果
 */
- (BOOL)bbc_isYesterday;

/**
 *  检测这个Date是不是今年
 *
 *  @return 返回比较结果
 */
- (BOOL)bbc_isThisYear;

@end
