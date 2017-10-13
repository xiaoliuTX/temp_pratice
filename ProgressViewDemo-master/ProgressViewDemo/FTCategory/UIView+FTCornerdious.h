//
//  UIView+FTCornerdious.h
//  Freight
//
//  Created by zhongzhi on 2017/7/3.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FTCornerdious)
-(void)setFTCornerdious:(CGFloat)cornerdious;
-(void)setFTLeftCornerdious:(CGFloat)cornerdious;
-(void)setFTRightCornerdious:(CGFloat)cornerdious;
-(void)setFTBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

-(void)setFtCornerdious:(CGFloat)cornerdious  Corners:(UIRectCorner)corners ;  //设置圆角，设置某个位置的圆角

@end
