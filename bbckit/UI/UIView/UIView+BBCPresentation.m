//
//  UIView+BBCPresentation.m
//  BBCKit
//
//  Created by carusd on 16/7/28.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import "UIView+BBCPresentation.h"

@implementation UIView (BBCPresentation)

- (void)bbc_cutWithCornerRadius:(CGFloat)radius {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
}

@end
