//
//  BBCBottomConstraintKeyboardAdapter.h
//  BBCKit
//
//  Created by carusd on 16/8/25.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 界面开发中有时候有些视图需要始终位于界面底部，键盘出现时要跟随键盘移动，
 这个类就是为了解决这样的通用需求而写。
 在处理过程中，始终需要处理的对象，只有该视图底部与界面底部的约束。
 */
@interface BBCBottomConstraintKeyboardAdapter : NSObject

/**
 返回一个实例
 @return BBCBottomConstraintKeyboardAdapter
 */
+ (instancetype)bbc_defaultAdapter;

/**
 添加一个约束
 
 @param constraint
 
 */
- (void)bbc_registBottomConstraint:(NSLayoutConstraint *)constraint;

/**
 删除一个约束
 
 @param constraint
 
 */
- (void)bbc_removeBottomConstraint:(NSLayoutConstraint *)constraint;

@end
