//
//  PCImagePreViewingController.m
//  仿朋友圈
//
//  Created by xiaoliuTX on 2017/9/4.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import "PCImagePreViewingController.h"
#import "ViewImageCollectionViewCell.h"
#import "ViewController.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define PageWidth    [UIScreen mainScreen].bounds.size.width+20

@interface PCImagePreViewingController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *imagesSizeArray;
@end

@implementation PCImagePreViewingController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.imagesArray = @[@"1",@"2",@"3",@"4",@"5"];
    
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(PageWidth, ScreenHeight);
    self.collectionView.collectionViewLayout = layout;
    
    self.collectionView.pagingEnabled = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.showIndexPath) {
        [self.collectionView scrollToItemAtIndexPath:self.showIndexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        ViewImageCollectionViewCell *cell = (ViewImageCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:self.showIndexPath];
        self.transitionView = cell.imageView;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

//
//// 处理调用setscrolloffset方法造成的偏移
//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
//    CGFloat pageWidth = scrollView.frame.size.width;
//    int currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
////    self.pageControl.currentPage = currentPage;
//}
//
//// 处理手势拖动造成scroll偏移
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    CGFloat pageWidth = scrollView.frame.size.width;
//    int currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
////    self.pageControl.currentPage = currentPage;
//    
////    ViewController *vc = (ViewController *)self.presentingViewController;
////    vc.transitionCopyView = [vc.view viewWithTag:self.pageControl.currentPage];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return self.imagesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ViewImageCollectionViewCell *cell = (ViewImageCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    __weak typeof(cell)weakCell = cell;
    cell.clipBlock = ^{
        self.transitionView = weakCell.imageView;
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    
    [cell configureWithImageNamed:self.imagesArray[indexPath.row]];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    ViewImageCollectionViewCell *cell = (ViewImageCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
//    self.transitionView = cell.imageView;
//    CGRect rect = [self.view convertRect:cell.imageView.frame fromView:cell.imageView.superview];
//    [self.imagesSizeArray addObject:[NSValue valueWithCGRect:rect]];
//    self.transitionRect = [NSValue valueWithCGRect:rect];
//    
//    ViewController *VC = (ViewController *)self.presentingViewController;
//    VC.transitionRect = [NSValue valueWithCGRect: CGRectMake(0, 100*indexPath.row, 100, 100)];
//    
//    
////    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
//    [self dismissViewControllerAnimated:YES completion:nil];
}





@end
