//
//  UIButton+BBCPresentation.m
//  BBCKit
//
//  Created by carusd on 16/7/28.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import "UIButton+BBCPresentation.h"

@implementation UIButton (BBCPresetation)

- (void)bbc_setUpdown {
    CGFloat spacing = - 2;
    
    CGSize imageSize = self.imageView.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(
                                            0.0, - imageSize.width, - (imageSize.height + spacing + 4), 0.0);
    
    CGSize titleSize = self.titleLabel.frame.size;
    self.imageEdgeInsets = UIEdgeInsetsMake(
                                            - (titleSize.height + spacing), 0.0, 0.0, - titleSize.width);
}

- (void)bbc_setReverse {
    self.transform = CGAffineTransformMakeScale(-1.0, 1.0);
    self.titleLabel.transform = CGAffineTransformMakeScale(-1.0, 1.0);
    self.imageView.transform = CGAffineTransformMakeScale(-1.0, 1.0);
}

- (void)bbc_setSpacing:(CGFloat)spacing {
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
}



@end
