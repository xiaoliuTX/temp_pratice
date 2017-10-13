//
//  CustomButton.h
//  xib控件封装
//
//  Created by xiaoliuTX on 2017/9/7.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

@import UIKit;

IB_DESIGNABLE

@interface CustomButton : UIButton
@property (nonatomic) IBInspectable NSInteger cornerRadius;
@property (nonatomic) IBInspectable UIImage *normalImage;
@property (nonatomic) IBInspectable UIImage *highlightImage;
@property (nonatomic) IBInspectable NSString *textString;
@property (nonatomic) IBInspectable NSInteger fontSize;
@property (nonatomic) IBInspectable UIColor  *fontColor;
@property (nonatomic) IBInspectable NSInteger textBotomSpace;
@property (nonatomic) IBInspectable NSInteger textToImageSpace;
@end
