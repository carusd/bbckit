//
//  UIView+BBCBorder.m
//  BBCKitDemo
//
//  Created by carusd on 2017/4/7.
//  Copyright © 2017年 duowan. All rights reserved.
//

#import "UIView+BBCBorder.h"

@implementation UIView (BBCBorder)


- (void)bbc_setBorder:(UIEdgeInsets)edge color:(UIColor *)color {
    [[self viewWithTag:@"BBCBorder_Left".hash] removeFromSuperview];
    [[self viewWithTag:@"BBCBorder_Top".hash] removeFromSuperview];
    [[self viewWithTag:@"BBCBorder_Right".hash] removeFromSuperview];
    [[self viewWithTag:@"BBCBorder_Bottom".hash] removeFromSuperview];
    
    CGFloat leading = edge.left;
    if (leading > 0) {
        UIView *borderView = [[UIView alloc] init];
        borderView.tag = @"BBCBorder_Left".hash;
        borderView.translatesAutoresizingMaskIntoConstraints = NO;
        borderView.backgroundColor = color;
        [self addSubview:borderView];
        
        NSString *constraintText = [NSString stringWithFormat:@"H:|[borderView(%f)]", leading];
        NSDictionary *views = NSDictionaryOfVariableBindings(borderView);
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraintText options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[borderView]|" options:0 metrics:nil views:views]];
    }
    
    CGFloat top = edge.top;
    if (top > 0) {
        UIView *borderView = [[UIView alloc] init];
        borderView.tag = @"BBCBorder_Top".hash;
        borderView.translatesAutoresizingMaskIntoConstraints = NO;
        borderView.backgroundColor = color;
        [self addSubview:borderView];
        
        NSString *constraintText = [NSString stringWithFormat:@"V:|[borderView(%f)]", top];
        NSDictionary *views = NSDictionaryOfVariableBindings(borderView);
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraintText options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[borderView]|" options:0 metrics:nil views:views]];
    }
    
    CGFloat bottom = edge.bottom;
    if (bottom > 0) {
        UIView *borderView = [[UIView alloc] init];
        borderView.tag = @"BBCBorder_Bottom".hash;
        borderView.translatesAutoresizingMaskIntoConstraints = NO;
        borderView.backgroundColor = color;
        [self addSubview:borderView];
        
        NSString *constraintText = [NSString stringWithFormat:@"V:[borderView(%f)]|", bottom];
        NSDictionary *views = NSDictionaryOfVariableBindings(borderView);
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraintText options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[borderView]|" options:0 metrics:nil views:views]];
    }
    
    CGFloat trailing = edge.right;
    if (trailing > 0) {
        UIView *borderView = [[UIView alloc] init];
        borderView.tag = @"BBCBorder_Right".hash;
        borderView.translatesAutoresizingMaskIntoConstraints = NO;
        borderView.backgroundColor = color;
        [self addSubview:borderView];
        
        NSString *constraintText = [NSString stringWithFormat:@"H:[borderView(%f)]|", trailing];
        NSDictionary *views = NSDictionaryOfVariableBindings(borderView);
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraintText options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[borderView]|" options:0 metrics:nil views:views]];
    }
    
}


@end
