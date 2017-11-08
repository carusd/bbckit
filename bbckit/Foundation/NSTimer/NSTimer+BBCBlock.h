//
//  NSTimer+BBCBlock.h
//  BBCKit
//
//  Created by lerosua on 16/8/28.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (BBCBlock)

/**
 *  NSTimer计划任务，使用Block的方式，block里的self要用weak，解决循环引用问题，并且这个一般在主线程执行，不需要手工加runloop里
 *
 *  @param interval 时间间隔
 *  @param block    要执行的block, 里面引用到的self应该是weak的
 *  @param repeats  是否重复
 *
 *  @return 返回生成的Timer
 */
+ (instancetype) bbc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                              block:(void(^)())block
                                            repeats:(BOOL)repeats;

@end
