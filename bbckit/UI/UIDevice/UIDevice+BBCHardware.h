//
//  UIDevice+BBCHardware.h
//  BBCKitDemo
//
//  Created by Liki on 16/9/8.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (BBCHardware)
/**
 *  获取总的磁盘空间
 */
- (NSNumber *)bbc_totalDiskSpace;

/**
 *  获取可用的磁盘空间
 */
- (NSNumber *)bbc_availablyDiskSpace;

/**
 *  获取Cpu的核数
 */
- (NSUInteger)bbc_cpuCount;

/**
 *  获取内存总大小
 */
- (NSUInteger)bbc_totalMemory;

/**
 *  获取已使用的内存大小
 */
- (NSUInteger)bbc_usedMemory;


@end


