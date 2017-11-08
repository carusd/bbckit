//
//  NSTimer+BBCBlock.m
//  BBCKit
//
//  Created by lerosua on 16/8/28.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import "NSTimer+BBCBlock.h"

@implementation NSTimer (BBCBlock)

+ (instancetype) bbc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                              block:(void(^)())block
                                            repeats:(BOOL)repeats {
    
        return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(blockInvoke:) userInfo:[block copy] repeats:repeats];

}

+ (void)blockInvoke:(NSTimer *)timer {
     void (^block)() = timer.userInfo;
     if (block) {
             block();
        }
}
@end
