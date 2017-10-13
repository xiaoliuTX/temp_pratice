//
//  ViewController.m
//  仿朋友圈
//
//  Created by xiaoliuTX on 2017/9/4.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import "ViewController.h"
#import "PCImagePreViewingController.h"
#import "PCMagicMoveAnimator.h"
#import "UIImage+ResizeMagick.h"
#import "CustomTableViewCell.h"
#import "ViewImageCollectionViewCell.h"

#define PageWidth    [UIScreen mainScreen].bounds.size.width+20
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) NSMutableArray *imagesSizeArray;
@property (nonatomic, strong) NSArray *imageNamesArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imagesSizeArray = [NSMutableArray array];
    
    self.imageNamesArray = @[@"1",@"2",@"3",@"4",@"5"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageNamesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.iconImageView.image = [UIImage clipPartImageToSquare:[UIImage imageNamed:self.imageNamesArray[indexPath.row]]];

    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    CGRect rect = [[UIApplication sharedApplication].keyWindow convertRect:cell.iconImageView.frame fromView:cell.iconImageView.superview];
    [self.imagesSizeArray addObject:[NSValue valueWithCGRect:rect]];
    
    self.transitionRect = [NSValue valueWithCGRect:rect];
    self.transitionView = cell.iconImageView;

    PCImagePreViewingController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"view"];
    vc.showIndexPath = indexPath;
    UIImage *image = [[UIImage imageNamed:self.imageNamesArray[indexPath.row]] resizedImageByWidth:ScreenWidth];

    if (image.size.height >= ScreenHeight) {
        vc.transitionRect = [NSValue valueWithCGRect:CGRectMake(0, 0, ScreenWidth, image.size.height)];
    } else {
        vc.transitionRect = [NSValue valueWithCGRect:CGRectMake(0, (ScreenHeight-image.size.height)/2, ScreenWidth, image.size.height)];
    }
    
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    vc.transitioningDelegate = self;
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (UIImage *)ct_imageFromImage:(UIImage *)image inRect:(CGRect)rect{
    
    //把像 素rect 转化为 点rect（如无转化则按原图像素取部分图片）
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat x= rect.origin.x*scale,y=rect.origin.y*scale,w=rect.size.width*scale,h=rect.size.height*scale;
    CGRect dianRect = CGRectMake(x, y, w, h);
    
    //截取部分图片并生成新图片
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, dianRect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    return newImage;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [PCMagicMoveAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [PCMagicMoveAnimator new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
