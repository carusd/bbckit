//
//  UIImage+Compress.h
//  BBCKit
//
//  Created by M6 on 16/8/11.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BBCCompress)

/**
 *  用于上传的图片压缩方法，必须直接使用返回的data来上传，每次NSData和UIImage的转换都可能改变image的大小。
 *
 *  @param sourceImage 被压缩的图片，不能为空
 *
 *  @return 返回用于上传的Data，一般情况下直接用于上传，转化成UIImage再转回来将改变压缩大小。
 */
+ (NSData * _Nullable)bbc_compressImageForUpload:(UIImage * _Nonnull)sourceImage;

/**
 *  图片质量压缩方法
 *
 *  @param image    原图片
 *  @param width    目标图片宽度
 *  @param length   目标大小，单位：字节（b）
 *  @param accuracy 压缩控制误差范围(+ / -)，本方法虽然给出了误差范围，但实际上很难确定一张图片是否能压缩到误差范围内，无法实现精确压缩。
 *
 *  @return 可直接转化成UIImage对象的NSData对象
 */
+ (NSData * _Nullable)compressImageWithImage:(UIImage * _Nonnull)image aimWidth:(CGFloat)width aimLength:(long long)length accuracyOfLength:(long long)accuracy;

/**
 *  图片尺寸压缩方法
 *
 *  @param image   原图片
 *  @param newSize 目标图片宽高
 *
 *  @return 压缩尺寸后的图片
 */
+ (UIImage* _Nullable)imageWithImage:(UIImage* _Nonnull)image scaledToSize:(CGSize)newSize;

@end
