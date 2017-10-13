//
//  CustomView.m
//  xib控件封装
//
//  Created by xiaoliuTX on 2017/9/20.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIView *view = [self loadViews];
        view.frame = self.bounds;
        [self addSubview:view];
    }
    
    return self;
}

- (UIView *)loadViews {
    return [[[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:self options:nil] lastObject];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        UIView *view = [self loadViews];
        view.frame = self.bounds;
        [self addSubview:view];
    }
    
    return self;
}

@end
