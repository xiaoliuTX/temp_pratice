//
//  CustomButton.m
//  xib控件封装
//
//  Created by xiaoliuTX on 2017/9/7.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import "CustomButton.h"
@interface CustomButton ()
@property (nonatomic, strong) UILabel *stringLabel;
@property (nonatomic, strong) UIImageView *iconView;
@end

@implementation CustomButton

- (instancetype)initWithFrame:(CGRect)frame {
    // Interface builder中debug view时会调用
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    // storyboard中使用，程序运行时会调用
    if (self = [super initWithCoder:aDecoder]) {
        [self setUI];
    }
    
    return self;
}

- (void)setUI {
    _stringLabel = [UILabel new];
    _stringLabel.textAlignment = NSTextAlignmentCenter;
    _stringLabel.textColor = [UIColor blackColor];
    _stringLabel.font = [UIFont systemFontOfSize:14];
    _stringLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_stringLabel];
    
    _iconView = [UIImageView new];
    _iconView.contentMode = UIViewContentModeScaleAspectFit;
    _iconView.backgroundColor = [UIColor clearColor];
    [self addSubview:_iconView];
}

- (void)setNormalImage:(UIImage *)normalImage {
    _normalImage = normalImage;
    
    self.iconView.image = normalImage;
    self.iconView.contentMode = UIViewContentModeScaleAspectFit;
    self.iconView.bounds = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    self.iconView.center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)-self.textBotomSpace-self.textToImageSpace-CGRectGetHeight(self.stringLabel.bounds)-CGRectGetHeight(self.iconView.bounds)/2);
}

- (void)setHighlightImage:(UIImage *)highlightImage {
    _highlightImage = highlightImage;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.stringLabel.center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds) - _textBotomSpace -CGRectGetHeight(self.stringLabel.bounds)/2);
    self.iconView.center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)-self.textBotomSpace-self.textToImageSpace-CGRectGetHeight(self.stringLabel.bounds)-CGRectGetHeight(self.iconView.bounds)/2);
}

- (void)setTextBotomSpace:(NSInteger)textBotomSpace {
    _textBotomSpace = textBotomSpace;
    self.stringLabel.center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)-textBotomSpace -CGRectGetHeight(self.stringLabel.bounds)/2);
}

- (void)setTextToImageSpace:(NSInteger)textToImageSpace {
    _textToImageSpace = textToImageSpace;
    self.iconView.center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)-self.textBotomSpace-self.textToImageSpace-CGRectGetHeight(self.stringLabel.bounds)-CGRectGetHeight(self.iconView.bounds)/2);
}

- (void)setTextString:(NSString *)textString {
    _textString = textString;
    self.stringLabel.text = textString;
    CGRect stringRect;
    if([textString respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        stringRect = [textString boundingRectWithSize:CGSizeMake(self.bounds.size.width, 80)
                                          options:(NSStringDrawingOptions)(NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin)
                                       attributes:@{NSFontAttributeName: self.stringLabel.font}
                                          context:NULL];
    }
    self.stringLabel.bounds = CGRectMake(0, 0, stringRect.size.width, stringRect.size.height);
    self.stringLabel.center = CGPointMake(CGRectGetWidth(self.bounds)/2, 0);
}

- (void)setFontColor:(UIColor *)fontColor {
    _fontColor = fontColor;
    self.stringLabel.textColor = fontColor;
}

- (void)setFontSize:(NSInteger)fontSize {
    _fontSize = fontSize;
    self.stringLabel.font = [UIFont systemFontOfSize:fontSize];
    CGRect stringRect;
    if([_textString respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        stringRect = [_textString boundingRectWithSize:CGSizeMake(self.bounds.size.width, 80)
                                              options:(NSStringDrawingOptions)(NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin)
                                           attributes:@{NSFontAttributeName: self.stringLabel.font}
                                              context:NULL];
    }
    self.stringLabel.bounds = CGRectMake(0, 0, stringRect.size.width, stringRect.size.height);
    self.stringLabel.center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)- _textBotomSpace -CGRectGetHeight(self.stringLabel.bounds)/2);
}

- (void)setCornerRadius:(NSInteger)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = 1;
}

//- (void)setHighlighted:(BOOL)highlighted {
//    if (highlighted) {
//        self.imageView.image = _highlightImage;
//    } else {
//        self.imageView.image = _normalImage;
//    }
//}


@end
