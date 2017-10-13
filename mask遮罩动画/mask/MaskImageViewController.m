//
//  MaskImageViewController.m
//  mask
//
//  Created by xiaoliuTX on 2017/8/31.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import "MaskImageViewController.h"

@interface MaskImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation MaskImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //USE
    UIImage *image=[UIImage imageNamed:@"image2.png"];
    UIImage *mask=[UIImage imageNamed:@"mask6.png"];
    UIImage *newimage=[self maskImage:image withMask:mask];
    self.imageView.image=newimage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage*) maskImage:(UIImage *) image withMask:(UIImage *) mask
{
    CGImageRef imageReference = image.CGImage;
    CGImageRef maskReference = mask.CGImage;
    
    CGImageRef imageMask = CGImageMaskCreate(CGImageGetWidth(maskReference),
                                             CGImageGetHeight(maskReference),
                                             CGImageGetBitsPerComponent(maskReference),
                                             CGImageGetBitsPerPixel(maskReference),
                                             CGImageGetBytesPerRow(maskReference),
                                             CGImageGetDataProvider(maskReference),
                                             NULL, // Decode is null
                                             YES // Should interpolate
                                             );
    
    CGImageRef maskedReference = CGImageCreateWithMask(imageReference, imageMask);
    CGImageRelease(imageMask);
    
    UIImage *maskedImage = [UIImage imageWithCGImage:maskedReference];
    CGImageRelease(maskedReference);
    
    return maskedImage;
}

@end
