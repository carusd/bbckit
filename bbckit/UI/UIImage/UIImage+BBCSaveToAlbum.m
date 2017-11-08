//
//  UIImage+BBCSave.m
//  BBCKitDemo
//
//  Created by carusd on 2016/9/28.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import "UIImage+BBCSaveToAlbum.h"
#import "UIDevice+BBCAdditions.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "UIImage+BBCDataConversation.h"

@implementation UIImage (SaveToAlbum)

+ (void)bbc_saveImage:(UIImage *)image completion:(SaveCompletion)completion {
    NSData *imageData = [UIImage bbc_animatedImageDataWithImage:image];
    return [UIImage bbc_saveImageData:imageData completion:completion];
}

+ (void)bbc_saveImageData:(NSData *)imageData completion:(SaveCompletion)completion {
    if ([UIDevice bbc_systemVersionFloatValue] >= 10.0) {
        [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
            PHAssetResourceCreationOptions *options = [[PHAssetResourceCreationOptions alloc] init];
            
            CGImageSourceRef sourceRef = CGImageSourceCreateWithData((__bridge CFDataRef)imageData, NULL);
            size_t frameCount = CGImageSourceGetCount(sourceRef);
            
            if (frameCount > 1) {// 这是gif图
                options.uniformTypeIdentifier = (__bridge NSString *)kUTTypeGIF;
            }
            
            
            PHAssetCreationRequest *request = [PHAssetCreationRequest creationRequestForAsset];
            [request addResourceWithType:PHAssetResourceTypePhoto data:imageData options:options];
            
        } completionHandler:^(BOOL success, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(error);
                }
            });
            
        }];
    }else{
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
        ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
        [library writeImageDataToSavedPhotosAlbum:imageData metadata:nil completionBlock:^(NSURL *assetURL, NSError *error) {
            if (completion) {
                completion(error);
            }
            
        }];
#pragma GCC diagnostic pop
        
    }
}

@end
