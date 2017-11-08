//
//  BBCBottomConstraintKeyboardAdapter.m
//  BBCKit
//
//  Created by carusd on 16/8/25.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import "BBCBottomConstraintKeyboardAdapter.h"

@interface BBCBottomConstraintKeyboardAdapter ()

@property (nonatomic, strong) NSMutableArray *constraints;

@end

@implementation BBCBottomConstraintKeyboardAdapter

+ (instancetype)bbc_defaultAdapter {
    static BBCBottomConstraintKeyboardAdapter *adapter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        adapter = [[BBCBottomConstraintKeyboardAdapter alloc] init];
    });
    
    return adapter;
}

- (id)init {
    self = [super init];
    if (self) {
        self.constraints = [NSMutableArray array];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardFrameDidChanged:) name:UIKeyboardDidChangeFrameNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    }
    
    return self;
}

- (void)bbc_registBottomConstraint:(NSLayoutConstraint *)constraint {
    [self.constraints addObject:constraint];
}

- (void)bbc_removeBottomConstraint:(NSLayoutConstraint *)constraint {
    [self.constraints removeObject:constraint];
}


#pragma mark keyboard notification
- (void)onKeyboardWillShow:(NSNotification *)noti {
    NSValue *valueForRect = noti.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rect = [valueForRect CGRectValue];
    
    for (NSLayoutConstraint *constraint in self.constraints) {
        constraint.constant = CGRectGetHeight(rect);
    }
    
}

- (void)onKeyboardFrameDidChanged:(NSNotification *)noti {
    NSValue *valueForRect = noti.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rect = [valueForRect CGRectValue];
    
    for (NSLayoutConstraint *constraint in self.constraints) {
        constraint.constant = CGRectGetHeight([UIScreen mainScreen].bounds) - CGRectGetMinY(rect);
    }
}

- (void)onKeyboardWillHide:(NSNotification *)notif {
    for (NSLayoutConstraint *constraint in self.constraints) {
        constraint.constant = 0;
    }
}

- (void)onKeyboardDidHide:(NSNotification *)notif {
    
    for (NSLayoutConstraint *constraint in self.constraints) {
        constraint.constant = 0;
    }
}
@end
