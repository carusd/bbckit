//
//  UIView+BBCNib.h
//  BBC
//
//  Created by lerosua on 16/9/19.
//  Copyright © 2015年 lerosua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BBCNib)

+ (instancetype) bbc_loadFromNib;

+ (UINib *) bbc_nib;
@end
