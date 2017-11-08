//
//  NSString+BBCStringSize.h
//  BBCKit
//
//  Created by CoolTea on 16/8/11.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
 
@interface NSString (BBCStringSize)

/**
 *
 *  @brief 给予指定的显示区域以及字体计算字符串宽高
 *
 *  @param size 指定显示区域大小
 *  @param font 计算需要用到的字体
 *
 *  @return 返回字符串在指定显示区域内的宽高
 *
 *  @since 1.0
 */
- (CGSize)bbc_sizeWithConstrainedSize:(CGSize)size font:(UIFont *)font;


/**
 *
 *  @brief 通过字符串属性计算字符串宽高
 *
 *  @param attributes 根据需要组合的字符串属性字典：参数定义：iOS6以下在<UIKit/UIStringDrawing.h>  iOS6以上在<UIKit/NSAttributedString.h>
 *
 *  @return 返回计算所得的字符串宽高
 *
 *  @since 1.0
 */
- (CGSize)bbc_sizeWithAttributes:(NSDictionary *)attributes;



@end
