//
//  UIImage+Compress.m
//  BBCKit
//
//  Created by M6 on 16/8/11.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import "UIImage+BBCCompress.h"

#define kCompressAccuracy   1024 * 5 //误差值，单位字节(byte)

@implementation UIImage (BBCCompress)

/**
 *
 *  基于安卓图片压缩算法Luban，修改出的算法，算法描述如下：
 *
 *  1.判断图片比例值，是否处于以下区间内；
 *
 *  [1, 0.5625) 即图片处于 [1:1 ~ 9:16) 比例范围内
 *  [0.5625, 0.5) 即图片处于 [9:16 ~ 1:2) 比例范围内
 *  [0.5, 0) 即图片处于 [1:2 ~ 1:∞) 比例范围内
 *
 *  2.判断图片最长边是否过边界值；
 *
 *  [1, 0.5625) 边界值为：1664 * n（n=1）, 2495 * n（n=2）, 1280 * pow(2, n-1)（n≥3）
 *  [0.5625, 0.5) 边界值为：1280 * pow(2, n-1)（n≥1）
 *  [0.5, 0) 边界值为：1280 * pow(2, n-1)（n≥1）
 *
 *  3.计算压缩图片实际边长值，以第2步计算结果为准，超过某个边界值则：width / pow(2, n-1)，height/pow(2, n-1)
 *
 *  4.计算压缩图片的实际文件大小，以第2、3步结果为准，图片比例越大则文件越大。
 *
 *  size = (newW * newH) / (width * height) * m；
 *
 *  [1, 0.5625) 则 width & height 对应 1664，2495，1280 * n（n≥3），m 对应 150 * 2，300 * 2，300 * 2；
 *  [0.5625, 0.5) 则 width = 1440，height = 2560, m = 200；
 *  [0.5, 0) 则 width = 1280，height = 1280 / scale，m = 500；注：scale为比例值
 *
 *  5.判断第4步的size是否过小
 *
 *  [1, 0.5625) 则最小 size 对应 60，60，100
 *  [0.5625, 0.5) 则最小 size 都为 100
 *  [0.5, 0) 则最小 size 都为 100
 *  以上单位在iOS里为k，而安卓为b
 *
 *  6.将前面求到的值压缩图片 width, height, size 传入压缩流程，压缩图片直到满足以上数值
 *  iOS算法加入5k的误差值，因为压缩到目标大小是个尝试的过程，这里偷懒用中值查找法6次内求近似值，极端情况的20301k图片在iPhone6上耗时0.68秒。
 *
 */
+ (NSData *)bbc_compressImageForUpload:(UIImage *)sourceImage {
    
    NSData *imageFile = UIImageJPEGRepresentation(sourceImage, 1);
    double aimSize = 0;
    int width = sourceImage.size.width;
    int height = sourceImage.size.height;
    int thumbW = width % 2 == 1 ? width + 1 : width;
    int thumbH = height % 2 == 1 ? height + 1 : height;
    BOOL isUseSourceImage = NO;
    
    width = thumbW > thumbH ? thumbH : thumbW;
    height = thumbW > thumbH ? thumbW : thumbH;
    
    double scale = ((double) width / height);
    if (scale <= 1 && scale > 0.5625) {
        if (height < 1664) {
            if ([imageFile length] / 1024 < 150) {
                isUseSourceImage = YES;
            }else {
                aimSize = (width * height) / pow(1664, 2) * 150;
                aimSize = aimSize < 60 ? 60 : aimSize;
            }
        } else if (height >= 1664 && height < 4990) {
            thumbW = width / 2;
            thumbH = height / 2;
            aimSize = (thumbW * thumbH) / pow(2495, 2) * 300;
            aimSize = aimSize < 60 ? 60 : aimSize;
        } else if (height >= 4990 && height < 10240) {
            thumbW = width / 4;
            thumbH = height / 4;
            aimSize = (thumbW * thumbH) / pow(2560, 2) * 300;
            aimSize = aimSize < 100 ? 100 : aimSize;
        } else {
            int multiple = height / 1280 == 0 ? 1 : height / 1280;
            thumbW = width / multiple;
            thumbH = height / multiple;
            aimSize = (thumbW * thumbH) / pow(2560, 2) * 300;
            aimSize = aimSize < 100 ? 100 : aimSize;
        }
    } else if (scale <= 0.5625 && scale > 0.5) {
        if (height < 1280 && imageFile.length / 1024 < 200){
            isUseSourceImage = YES;
        }else {
            int multiple = height / 1280 == 0 ? 1 : height / 1280;
            thumbW = width / multiple;
            thumbH = height / multiple;
            aimSize = (thumbW * thumbH) / (1440.0 * 2560.0) * 200;
            aimSize = aimSize < 100 ? 100 : aimSize;
        }
    } else {
        int multiple = (int) ceil(height / (1280.0 / scale));
        thumbW = width / multiple;
        thumbH = height / multiple;
        aimSize = ((thumbW * thumbH) / (1280.0 * (1280 / scale))) * 500;
        aimSize = aimSize < 100 ? 100 : aimSize;
    }
    
    if (isUseSourceImage) {
        aimSize = imageFile.length;
        thumbW = sourceImage.size.width;
    }else {
        aimSize = aimSize * 1024 * 2;
    }
    
    NSData *aimImageData = [[self class] compressImageWithImage:sourceImage aimWidth:thumbW aimLength:aimSize accuracyOfLength:1024];
    
    return aimImageData;
}

/**
 *  压缩图片质量方法
 *
 *  @param image    原图片
 *  @param width    目标图片宽度
 *  @param length   目标大小，单位：字节（b）
 *  @param accuracy 压缩控制误差范围(+ / -)，本方法虽然给出了误差范围，但实际上很难确定一张图片是否能压缩到误差范围内，无法实现精确压缩。
 *
 *  @return 可直接转化成UIImage对象的NSData对象
 */
+ (NSData *)compressImageWithImage:(UIImage *)image aimWidth:(CGFloat)width aimLength:(long long)length accuracyOfLength:(long long)accuracy{
    
    if (width <= 0 || length <= 0) {
        return nil;
    }
    
    UIImage * newImage = [[self class] imageWithImage:image scaledToSize:CGSizeMake(width, width * image.size.height / image.size.width)];
    
    NSData  * data = UIImageJPEGRepresentation(newImage, 1);
    NSInteger imageDataLen = [data length];
    
    if (imageDataLen <= length + accuracy) {
        return data;
    }else{
        NSData * imageData = UIImageJPEGRepresentation( newImage, 0.99);
        if (imageData.length < length + accuracy) {
            return imageData;
        }
        
        CGFloat maxQuality = 1.0;
        CGFloat minQuality = 0.1;
        int flag = 0;
        
        while (1) {
            CGFloat midQuality = (maxQuality + minQuality)/2;
            
            if (flag == 6) {
                NSLog(@"************* %ld ******** %f *************",UIImageJPEGRepresentation(newImage, minQuality).length, minQuality);
                return UIImageJPEGRepresentation(newImage, minQuality);
            }
            flag ++;
            
            NSData * imageData = UIImageJPEGRepresentation(newImage, midQuality);
            NSInteger len = imageData.length;
            
            if (len > length+accuracy) {
                NSLog(@"-----%d------%f------%ld-----",flag,midQuality,len);
                maxQuality = midQuality;
                continue;
            }else if (len < length-accuracy){
                NSLog(@"-----%d------%f------%ld-----",flag,midQuality,len);
                minQuality = midQuality;
                continue;
            }else{
                NSLog(@"-----%d------%f------%ld--end",flag,midQuality,len);
                return imageData;
                break;
            }
        }
    }
}

/**
 *  对图片尺寸进行压缩
 *
 *  @param image   原图片
 *  @param newSize 目标图片宽高
 *
 *  @return 压缩尺寸后的图片
 */
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    if (newSize.height <= 0 || newSize.width <= 0) {
        return nil;
    }
    
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
