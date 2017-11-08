//
//  UIImage+BBCSave.h
//  BBCKitDemo
//
//  Created by carusd on 2016/9/28.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SaveCompletion)(NSError *);

@interface UIImage (SaveToAlbum)

/**
 *  保存UIImage到相册
 *
 *  @param image 需要被保存的图片
 *
 *  @param completion 保存结果回调，如果成功参数error为nil，否则有值
 */

+ (void)bbc_saveImage:(UIImage *)image completion:(SaveCompletion)completion;

/**
 *  保存图片二进制数据到相册
 *
 *  @param imageData 需要被保存的图片二进制数据
 *
 *  @param completion 保存结果回调，如果成功参数error为nil，否则有值
 */

+ (void)bbc_saveImageData:(NSData *)imageData completion:(SaveCompletion)completion;

@end
