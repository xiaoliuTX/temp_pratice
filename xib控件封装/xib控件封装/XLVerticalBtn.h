//
//  XLButton.h
//  xib控件封装
//  垂直排列按钮
//  Created by xiaoliuTX on 2017/9/8.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE

@interface XLVerticalBtn : UIButton
@property (nonatomic) IBInspectable NSInteger textToBotomSpace;
@property (nonatomic) IBInspectable NSInteger imageToBottomSpace;
@property (nonatomic) IBInspectable CGSize    imageSize;
@end
