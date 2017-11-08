//
//  UIButton+BBCPresetation.h
//  BBCKit
//
//  Created by carusd on 16/7/28.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BBCPresentation)

/**
 *  这两个方法都是必须在**设置按钮内容之后**调用才有效果
 *  也就是说必须先调用setTitle:forState:和setImage:forState:
 */
- (void)bbc_setUpdown; // 图片在上，文字在下
- (void)bbc_setReverse; // 图片在右，文字在左
- (void)bbc_setSpacing:(CGFloat)spacing; // 设置图片和文字间隔

@end
