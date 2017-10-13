//
//  MultiCornerImageView.m
//  xib控件封装
//
//  Created by xiaoliuTX on 2017/9/8.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import "MultiCornerImageView.h"

@interface MultiCornerImageView()
@property (nonatomic, assign) UIRectCorner rectCorner;
@property (nonatomic, strong) CAShapeLayer *borderLayer;
@end

@implementation MultiCornerImageView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.borderLayer = [[CAShapeLayer alloc] init];
        [self.layer addSublayer:self.borderLayer];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.borderLayer = [[CAShapeLayer alloc] init];
        [self.layer addSublayer:self.borderLayer];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSLog(@"awake from nib");
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self renderCorner];
}

- (void)setCornerRadius:(NSInteger)cornerRadius {
    _cornerRadius = cornerRadius;
    
    [self renderCorner];
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    
    [self renderCorner];
}

- (void)setBordertWidth:(NSInteger)bordertWidth {
    _bordertWidth = bordertWidth;
    
    [self renderCorner];
}

- (void)setCornerWeight:(NSInteger)cornerWeight {
    _cornerWeight = cornerWeight;
    
    UIRectCorner cornerRect;
    switch (_cornerWeight) {
        case 1:
            cornerRect = UIRectCornerTopLeft;
            break;
        case 2:
            cornerRect = UIRectCornerTopRight;
            break;
        case 4:
            cornerRect = UIRectCornerBottomLeft;
            break;
        case 8:
            cornerRect = UIRectCornerBottomRight;
            break;
        case 3:
            cornerRect = UIRectCornerTopRight | UIRectCornerTopLeft;
            break;
        case 5:
            cornerRect = UIRectCornerTopLeft | UIRectCornerBottomLeft;
            break;
        case 9:
            cornerRect = UIRectCornerTopLeft | UIRectCornerBottomRight;
            break;
        case 6:
            cornerRect = UIRectCornerTopRight | UIRectCornerBottomLeft;
            break;
        case 12:
            cornerRect = UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
        case 7:
            cornerRect = UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft;
            break;
        case 11:
            cornerRect = UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomRight;
            break;
        case 13:
            cornerRect = UIRectCornerTopLeft | UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
        case 14:
            cornerRect = UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
        case 15:
            cornerRect = UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
        default:
            cornerRect = UIRectCornerAllCorners;
            break;
    }
    
    self.rectCorner = cornerRect;
    
    [self renderCorner];
}

- (void)renderCorner {
    // 重绘图片
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    CGContextRef currnetContext = UIGraphicsGetCurrentContext();
    UIBezierPath *roundPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:self.rectCorner cornerRadii:CGSizeMake(_cornerRadius, _cornerRadius)];
    CGContextAddPath(currnetContext, roundPath.CGPath);
    CGContextClip(currnetContext);
    [self.layer renderInContext:currnetContext];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.image = image;
    
    // 描边
    self.borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:self.rectCorner cornerRadii:CGSizeMake(_cornerRadius, _cornerRadius)].CGPath;
    self.borderLayer.strokeColor = _borderColor.CGColor;
    self.borderLayer.fillColor = [UIColor clearColor].CGColor;
    self.borderLayer.lineWidth = _bordertWidth;
    self.borderLayer.lineJoin = @"round";
    self.borderLayer.lineCap = @"round";
    
//    self.layer.borderColor = [UIColor clearColor].CGColor;
}



@end
