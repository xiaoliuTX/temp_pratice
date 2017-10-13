//
//  CycleLoadingViewController.m
//  mask
//
//  Created by xiaoliuTX on 2017/8/30.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import "CycleLoadingViewController.h"

@interface CycleLoadingViewController ()
@property (nonatomic, strong) CAShapeLayer *indefiniteAnimatedLayer;
@property (weak, nonatomic) IBOutlet UIView *loadingView;
@end

@implementation CycleLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.loadingView.layer addSublayer:self.indefiniteAnimatedLayer];
//    self.loadingView.layer.mask = self.indefiniteAnimatedLayer;
    
//    CALayer *maskLayer = [CALayer layer];
//    maskLayer.contents = (__bridge id _Nullable)([[UIImage imageNamed:@"angle-mask"] CGImage]);
//    maskLayer.frame = _indefiniteAnimatedLayer.bounds;
//    self.loadingView.layer.mask = maskLayer;
//    
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//    animation.fromValue = (id) 0;
//    animation.toValue = @(M_PI*2);
//    animation.duration = 1;
//    animation.timingFunction = kCAMediaTimingFunctionLinear;
//    animation.removedOnCompletion = NO;
//    animation.repeatCount = INFINITY;
//    animation.fillMode = kCAFillModeForwards;
//    animation.autoreverses = NO;
//    [_indefiniteAnimatedLayer.mask addAnimation:animation forKey:@"rotate"];
}

- (CAShapeLayer*)indefiniteAnimatedLayer {
    if(!_indefiniteAnimatedLayer) {
        CGPoint arcCenter = CGPointMake(80, 80);
        // 这样设置起始角度时，fromvalue，tovalue不能设定到指定位置。SVProgressHUD的bug。fromvalue*angle
//        UIBezierPath* smoothedPath = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:40 startAngle:(CGFloat) (M_PI*3/2) endAngle:(CGFloat) (M_PI/2+M_PI*5) clockwise:YES];
        UIBezierPath *smoothedPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(80,80)
                                                            radius:40
                                                        startAngle:-M_PI_2
                                                          endAngle:M_PI_2 * 3
                                                         clockwise:YES];
        
        _indefiniteAnimatedLayer = [CAShapeLayer layer];
        _indefiniteAnimatedLayer.contentsScale = [[UIScreen mainScreen] scale];
        _indefiniteAnimatedLayer.frame = CGRectMake(0.0f, 0.0f, arcCenter.x*2, arcCenter.y*2);
        _indefiniteAnimatedLayer.fillColor = [UIColor clearColor].CGColor;
        _indefiniteAnimatedLayer.strokeColor = [UIColor redColor].CGColor;
        
        _indefiniteAnimatedLayer.lineWidth = 5;
        _indefiniteAnimatedLayer.lineCap = kCALineCapRound;
        _indefiniteAnimatedLayer.lineJoin = kCALineJoinBevel;
        _indefiniteAnimatedLayer.path = smoothedPath.CGPath;
        
        NSTimeInterval animationDuration = 1;
        CAMediaTimingFunction *linearCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        
        CALayer *maskLayer = [CALayer layer];
        maskLayer.contents = (__bridge id _Nullable)([[UIImage imageNamed:@"angle-mask"] CGImage]);
        maskLayer.frame = _indefiniteAnimatedLayer.bounds;
        _indefiniteAnimatedLayer.mask = maskLayer;
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        animation.fromValue = @(-M_PI_2);
        animation.toValue = @(M_PI_2 * 3);
        animation.duration = animationDuration;
        animation.timingFunction = linearCurve;
        animation.removedOnCompletion = NO;
        animation.repeatCount = INFINITY;
        animation.fillMode = kCAFillModeForwards;
        animation.autoreverses = NO;
//        [_indefiniteAnimatedLayer.mask addAnimation:animation forKey:@"rotate"];
        
        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
        animationGroup.duration = animationDuration;
        animationGroup.repeatCount = INFINITY;
        animationGroup.removedOnCompletion = NO;
        animationGroup.timingFunction = linearCurve;
        CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
        strokeStartAnimation.fromValue = @0.015;
        strokeStartAnimation.toValue = @0.515;
        
        CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        strokeEndAnimation.fromValue = @0.485;
        strokeEndAnimation.toValue = @0.985;
        animationGroup.animations = @[strokeStartAnimation,strokeEndAnimation];
        [_indefiniteAnimatedLayer addAnimation:animationGroup forKey:@"progress"];
        
//        strokeStartAnimation.duration = animationDuration;
//        strokeStartAnimation.repeatCount = INFINITY;
//        strokeStartAnimation.removedOnCompletion = NO;
//        strokeStartAnimation.timingFunction = linearCurve;
//        [_indefiniteAnimatedLayer addAnimation:strokeStartAnimation forKey:@"start"];
//        
//        strokeEndAnimation.duration = animationDuration;
//        strokeEndAnimation.repeatCount = INFINITY;
//        strokeEndAnimation.removedOnCompletion = NO;
//        strokeEndAnimation.timingFunction = linearCurve;
//        [_indefiniteAnimatedLayer addAnimation:strokeEndAnimation forKey:@"end"];
        
    }
    return _indefiniteAnimatedLayer;
}

@end
