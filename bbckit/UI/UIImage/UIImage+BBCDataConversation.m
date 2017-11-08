//
//  UIImage+BBCDataConversation.m
//  BBCKitDemo
//
//  Created by carusd on 2016/9/28.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import "UIImage+BBCDataConversation.h"
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>

@implementation UIImage (BBCDataConversation)

+ (NSData *)bbc_animatedImageDataWithImage:(UIImage *)image {
    size_t frameCount = image.images.count;
    NSTimeInterval frameDuration = image.duration / frameCount;
    NSDictionary *frameProperties = @{
                                      (__bridge NSString *)kCGImagePropertyGIFDictionary: @{
                                              (__bridge NSString *)kCGImagePropertyGIFDelayTime: @(frameDuration)
                                              }
                                      };
    
    NSMutableData *mutableData = [NSMutableData data];
    CGImageDestinationRef destination = CGImageDestinationCreateWithData((__bridge CFMutableDataRef)mutableData, kUTTypeGIF, frameCount, NULL);
    
    NSDictionary *imageProperties = @{ (__bridge NSString *)kCGImagePropertyGIFDictionary: @{
                                               (__bridge NSString *)kCGImagePropertyGIFLoopCount: @(0)
                                               }
                                       };
    CGImageDestinationSetProperties(destination, (__bridge CFDictionaryRef)imageProperties);
    
    for (size_t idx = 0; idx < image.images.count; idx++) {
        CGImageDestinationAddImage(destination, [[image.images objectAtIndex:idx] CGImage], (__bridge CFDictionaryRef)frameProperties);
    }
    
    BOOL success = CGImageDestinationFinalize(destination);
    CFRelease(destination);
    
    if (success) {
        return [NSData dataWithData:mutableData];
    } else {
        return nil;
    }
    
    
}



@end
