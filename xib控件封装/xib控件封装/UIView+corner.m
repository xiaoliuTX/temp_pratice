//
//  UIView+corner.m
//  xib控件封装
//
//  Created by xiaoliuTX on 2017/9/7.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import "UIView+corner.h"

@implementation UIView (corner)
@dynamic radius;

- (void)setRadius:(NSInteger)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1;
}


@end
