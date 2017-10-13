//
//  MultiCornerImageView.h
//  xib控件封装
//
//  Created by xiaoliuTX on 2017/9/8.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface MultiCornerImageView : UIImageView
@property (nonatomic) IBInspectable NSInteger cornerRadius;
@property (nonatomic) IBInspectable NSInteger bordertWidth;
@property (nonatomic) IBInspectable UIColor  *borderColor;
@property (nonatomic) IBInspectable NSInteger cornerWeight;//左上，右上，左下，右下权重一次为1，2，4，8。cornerWeight为他们的组合值
@end
