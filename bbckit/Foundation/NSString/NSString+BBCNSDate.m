//
//  NSString+BBCNSDate.m
//  BBCKit
//
//  Created by CoolTea on 16/8/11.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import "NSString+BBCNSDate.h"

@implementation NSString (BBCNSDate)

+ (NSDate*)bbc_dateFromString:(NSString*)string {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    if (string && [string isKindOfClass:[NSString class]] && [string length]==10) {
        string = [NSString stringWithFormat:@"%@ 00:00:00", string];
    }
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *destDate= [dateFormatter dateFromString:string];
    
    return destDate;
}

@end
