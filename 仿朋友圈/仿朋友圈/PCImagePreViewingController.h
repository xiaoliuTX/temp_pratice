//
//  PCImagePreViewingController.h
//  仿朋友圈
//
//  Created by xiaoliuTX on 2017/9/4.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCImagePreViewingController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *imagesArray;
@property (nonatomic, strong) NSValue *transitionRect;
@property (nonatomic, strong) UIImageView *transitionView;
@property (nonatomic, strong) NSIndexPath *showIndexPath;
@end
