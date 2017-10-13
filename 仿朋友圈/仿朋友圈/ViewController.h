//
//  ViewController.h
//  仿朋友圈
//
//  Created by xiaoliuTX on 2017/9/4.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViews;
@property (nonatomic, strong) NSValue *transitionRect;
@property (nonatomic, strong) UIImageView *transitionView;
@end

