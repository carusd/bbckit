//
//  UIImage+BBCDataConversation.h
//  BBCKitDemo
//
//  Created by carusd on 2016/9/28.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BBCDataConversation)

/**
 *  系统API中转换成NSData会丢失gif信息，而这个方法在保存到NSData时会保留gif信息，可用于保存相册。
 *  但是该方法也能用于普通的静态图片。
 *
 *  @param image 需要被转换的图片
 *
 *  @return 返回图片对应的二进制数据
 */

+ (NSData *)bbc_animatedImageDataWithImage:(UIImage *)image;

@end
