//
//  ViewImageCollectionViewCell.h
//  仿朋友圈
//
//  Created by xiaoliuTX on 2017/9/4.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewImageCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, copy) void (^clipBlock)();
- (void)configureWithImageNamed:(NSString *)name;
@end
