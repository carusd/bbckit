//
//  UIView+BBCNib.m
//  BBC
//
//  Created by lerosua on 16/9/17.
//  Copyright © 2015年 lerosua. All rights reserved.
//

#import "UIView+BBCNib.h"

@implementation UIView (BBCNib)

+ (instancetype) bbc_loadFromNib {
    NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                      owner:self
                                                    options:nil];
    return  [nibViews firstObject];
}

+(UINib *) bbc_nib {
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}

@end
