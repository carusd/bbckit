//
//  UIViewController+BBCIsSupoort3DTouch.m
//  BBCKitDemo
//
//  Created by lerosua on 2017/4/10.
//  Copyright © 2017年 duowan. All rights reserved.
//

#import "UIViewController+BBCIsSupoort3DTouch.h"

@implementation UIViewController (BBCIsSupoort3DTouch)

- (BOOL) bbc_is3DTouchSupport {
    BOOL isForceTouchAvailable = NO;
    
    if ([self respondsToSelector:@selector(traitCollection)] && [self.traitCollection respondsToSelector:@selector(forceTouchCapability)]) {
        isForceTouchAvailable = YES;
    }
    
    return isForceTouchAvailable;
}
@end
