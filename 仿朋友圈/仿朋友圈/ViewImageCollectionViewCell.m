//
//  ViewImageCollectionViewCell.m
//  仿朋友圈
//
//  Created by xiaoliuTX on 2017/9/4.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import "ViewImageCollectionViewCell.h"
#import "UIImage+ResizeMagick.h"

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
@interface ViewImageCollectionViewCell () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollContainerView;

@end

@implementation ViewImageCollectionViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor clearColor];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.scrollContainerView addSubview:self.imageView];
    self.scrollContainerView.showsHorizontalScrollIndicator = NO;
    
    self.scrollContainerView.maximumZoomScale = 2;
    self.scrollContainerView.minimumZoomScale = 1;
    self.scrollContainerView.delegate = self;
    
    UITapGestureRecognizer* singletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleOneTap:)];
    singletap.numberOfTapsRequired = 1;
    [self.scrollContainerView addGestureRecognizer:singletap];
    
    UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleDoubleTap:)];
    doubleTapGesture.numberOfTapsRequired =2;
    doubleTapGesture.numberOfTouchesRequired = 1;
    [self.scrollContainerView addGestureRecognizer:doubleTapGesture];
    
    //只有当doubleTapGesture识别失败的时候(即识别出这不是双击操作)，singleTapGesture才能开始识别
    [singletap requireGestureRecognizerToFail:doubleTapGesture];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2);
{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    self.imageView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                            scrollView.contentSize.height * 0.5 + offsetY);
}

- (void)configureWithImageNamed:(NSString *)name {
    UIImage *image = [[UIImage imageNamed:name] resizedImageByWidth:ScreenWidth];
    if (image.size.height > ScreenHeight) {
        _imageView.frame = CGRectMake(0, 0, ScreenWidth, image.size.height);
        _scrollContainerView.contentSize = _imageView.bounds.size;
    } else {
        _imageView.bounds = CGRectMake(0, 0, ScreenWidth, image.size.height);
        _imageView.center = CGPointMake(ScreenWidth/2, ScreenHeight/2);
        _scrollContainerView.contentSize = CGSizeMake(ScreenWidth, ScreenHeight);
    }
    
    _imageView.image = image;

}

- (void)handleOneTap:(UITapGestureRecognizer *)recognizer {
    self.clipBlock();
}

- (void)handleDoubleTap:(UITapGestureRecognizer *)recognizer {
    CGRect zoomRect;
    if (self.scrollContainerView.zoomScale != 1.0) {
        zoomRect = [self zoomRectForScale:1 withCenter:[recognizer locationInView:recognizer.view]];
    } else {
        zoomRect = [self zoomRectForScale:2 withCenter:[recognizer locationInView:recognizer.view]];
    }
    
    NSLog(@"zoomRect:%@",NSStringFromCGRect(zoomRect));
    [ self.scrollContainerView zoomToRect:zoomRect animated:YES];//重新定义其cgrect的x和y值
}

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    CGRect zoomRect;
    
    zoomRect.size.height = [self.scrollContainerView frame].size.height / scale;
    zoomRect.size.width  = [self.scrollContainerView  frame].size.width  / scale;
    
    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
    
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
    
    return zoomRect;
}


@end
