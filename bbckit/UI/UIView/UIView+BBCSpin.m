//
//  UIView+BBCSpin.m
//  BBCKitDemo
//
//  Created by carusd on 2017/4/10.
//  Copyright © 2017年 duowan. All rights reserved.
//

#import "UIView+BBCSpin.h"
#import <objc/runtime.h>

@interface UIView ()

@property (nonatomic) CGFloat bbc_angle;
@property (nonatomic, strong) NSTimer *bbc_animationTimer;

@end

@implementation UIView (BBCSpin)

- (void)setBbc_angle:(CGFloat)bbc_angle {
    objc_setAssociatedObject(self, (__bridge const void *)@"bbc_angle", @(bbc_angle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)bbc_angle {
    NSNumber *angleNum = objc_getAssociatedObject(self, (__bridge const void *)(@"bbc_angle"));
    return angleNum.floatValue;
}

- (void)setBbc_animationTimer:(NSTimer *)bbc_animationTimer {
    objc_setAssociatedObject(self, (__bridge const void *)@"bbc_animationTimer", bbc_animationTimer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimer *)bbc_animationTimer {
    NSTimer *animationTimer = objc_getAssociatedObject(self, (__bridge const void *)(@"bbc_animationTimer"));
    return animationTimer;
}

- (void)spin {
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(self.bbc_angle * (M_PI / 180.0f));
    
    [UIView animateWithDuration:0.01 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.transform = endAngle;
    } completion:^(BOOL finished) {
        self.bbc_angle += 8;
    }];
}

- (void)bbc_startSpinning {
    if (self.bbc_spinning) {
        return;
    }
    self.hidden = NO;
    self.bbc_angle = 0;
    [self.bbc_animationTimer invalidate];
    
    self.bbc_animationTimer = [NSTimer timerWithTimeInterval:0.02 target:self selector:@selector(spin) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.bbc_animationTimer forMode:NSRunLoopCommonModes];
    [self.bbc_animationTimer fire];
    
}

- (void)bbc_stopSpinning {
    self.hidden = YES;
    [self.bbc_animationTimer invalidate];
}

- (BOOL)bbc_spinning {
    return self.bbc_animationTimer.valid;
}

@end
