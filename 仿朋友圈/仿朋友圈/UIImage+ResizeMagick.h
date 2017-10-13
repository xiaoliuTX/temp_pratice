//
//  UIImage+ResizeMagick.h
//
//
//  Created by Vlad Andersen on 1/5/13.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (ResizeMagick)
@property (nonatomic, assign) CGSize imageSize;

- (UIImage *) resizedImageByMagick: (NSString *) spec;
- (UIImage *) resizedImageByWidth:  (CGFloat) width;
- (UIImage *) resizedImageByHeight: (CGFloat) height;
- (UIImage *) resizedImageWithMaximumSize: (CGSize) size;
- (UIImage *) resizedImageWithMinimumSize: (CGSize) size;
+ (UIImage *)ct_imageFromImage:(UIImage *)image inRect:(CGRect)rect;
+ (UIImage *)clipPartImageToSquare:(UIImage *)image;
@end
