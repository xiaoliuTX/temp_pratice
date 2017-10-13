//
//  ViewController.m
//  Swift_UIBezierPath_animation
//
//  Created by xiaoliuTX on 2017/8/11.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (UIBezierPath *)bezierpath {
    //// Color Declarations
    UIColor* color1 = [UIColor colorWithRed: 0.521 green: 0.521 blue: 0.521 alpha: 1];
    
    //// Page-1
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(16.64, 166.71)];
    [bezierPath addCurveToPoint: CGPointMake(38.32, 183.81) controlPoint1: CGPointMake(22.23, 172.62) controlPoint2: CGPointMake(38.32, 183.81)];
    [bezierPath addCurveToPoint: CGPointMake(65.77, 198.77) controlPoint1: CGPointMake(38.32, 183.81) controlPoint2: CGPointMake(57.93, 196.24)];
    [bezierPath addCurveToPoint: CGPointMake(113.15, 207.08) controlPoint1: CGPointMake(68.34, 199.6) controlPoint2: CGPointMake(88.67, 208.69)];
    [bezierPath addCurveToPoint: CGPointMake(145.48, 198.77) controlPoint1: CGPointMake(119.87, 206.64) controlPoint2: CGPointMake(138.35, 200.95)];
    [bezierPath addCurveToPoint: CGPointMake(197.82, 207.08) controlPoint1: CGPointMake(180.67, 174.33) controlPoint2: CGPointMake(197.82, 207.08)];
    [bezierPath addCurveToPoint: CGPointMake(200.01, 193.31) controlPoint1: CGPointMake(198.84, 207.42) controlPoint2: CGPointMake(200.72, 204.21)];
    [bezierPath addCurveToPoint: CGPointMake(183.81, 153.37) controlPoint1: CGPointMake(198.66, 172.72) controlPoint2: CGPointMake(183.81, 153.37)];
    [bezierPath addCurveToPoint: CGPointMake(185.92, 117.81) controlPoint1: CGPointMake(183.81, 153.37) controlPoint2: CGPointMake(189.03, 135.5)];
    [bezierPath addCurveToPoint: CGPointMake(180.67, 97.58) controlPoint1: CGPointMake(184.75, 111.17) controlPoint2: CGPointMake(183.14, 103.77)];
    [bezierPath addCurveToPoint: CGPointMake(174.16, 81.76) controlPoint1: CGPointMake(178.3, 91.64) controlPoint2: CGPointMake(176.49, 86.21)];
    [bezierPath addCurveToPoint: CGPointMake(168.55, 71.91) controlPoint1: CGPointMake(172.01, 77.65) controlPoint2: CGPointMake(169.27, 74.39)];
    [bezierPath addCurveToPoint: CGPointMake(153.79, 52.87) controlPoint1: CGPointMake(167.63, 68.78) controlPoint2: CGPointMake(157.07, 56.71)];
    [bezierPath addCurveToPoint: CGPointMake(123.18, 28.51) controlPoint1: CGPointMake(140.96, 37.86) controlPoint2: CGPointMake(123.18, 28.51)];
    [bezierPath addCurveToPoint: CGPointMake(139.74, 60.31) controlPoint1: CGPointMake(123.18, 28.51) controlPoint2: CGPointMake(133.18, 45.03)];
    [bezierPath addCurveToPoint: CGPointMake(145.48, 81.76) controlPoint1: CGPointMake(143.51, 69.08) controlPoint2: CGPointMake(145.48, 77.92)];
    [bezierPath addCurveToPoint: CGPointMake(145.48, 102.67) controlPoint1: CGPointMake(145.48, 86.27) controlPoint2: CGPointMake(146.41, 94.74)];
    [bezierPath addCurveToPoint: CGPointMake(141.08, 123.12) controlPoint1: CGPointMake(144.25, 113.28) controlPoint2: CGPointMake(141.08, 123.12)];
    [bezierPath addLineToPoint: CGPointMake(109.23, 101.16)];
    [bezierPath addCurveToPoint: CGPointMake(81.31, 79.71) controlPoint1: CGPointMake(109.23, 101.16) controlPoint2: CGPointMake(89.86, 87)];
    [bezierPath addCurveToPoint: CGPointMake(42.84, 44.53) controlPoint1: CGPointMake(67.73, 68.13) controlPoint2: CGPointMake(42.84, 44.53)];
    [bezierPath addCurveToPoint: CGPointMake(79.45, 93.22) controlPoint1: CGPointMake(42.84, 44.53) controlPoint2: CGPointMake(66.55, 77.09)];
    [bezierPath addCurveToPoint: CGPointMake(99.18, 114.94) controlPoint1: CGPointMake(85.32, 100.56) controlPoint2: CGPointMake(99.18, 114.94)];
    [bezierPath addCurveToPoint: CGPointMake(70.06, 95.41) controlPoint1: CGPointMake(99.18, 114.94) controlPoint2: CGPointMake(79.04, 102.11)];
    [bezierPath addCurveToPoint: CGPointMake(19.34, 55.4) controlPoint1: CGPointMake(52.43, 82.26) controlPoint2: CGPointMake(19.34, 55.4)];
    [bezierPath addCurveToPoint: CGPointMake(75.51, 123.12) controlPoint1: CGPointMake(19.34, 55.4) controlPoint2: CGPointMake(48.63, 97.58)];
    [bezierPath addCurveToPoint: CGPointMake(113.15, 156.74) controlPoint1: CGPointMake(102.38, 148.66) controlPoint2: CGPointMake(113.15, 156.74)];
    [bezierPath addCurveToPoint: CGPointMake(94.06, 165.29) controlPoint1: CGPointMake(113.15, 156.74) controlPoint2: CGPointMake(104.82, 162.03)];
    [bezierPath addCurveToPoint: CGPointMake(75.51, 168.3) controlPoint1: CGPointMake(88.39, 167.01) controlPoint2: CGPointMake(81.27, 167.92)];
    [bezierPath addCurveToPoint: CGPointMake(65.77, 168.3) controlPoint1: CGPointMake(71.59, 168.55) controlPoint2: CGPointMake(68.67, 168.64)];
    [bezierPath addCurveToPoint: CGPointMake(33.97, 161.38) controlPoint1: CGPointMake(58.03, 167.39) controlPoint2: CGPointMake(44.06, 165.25)];
    [bezierPath addCurveToPoint: CGPointMake(0.17, 143.46) controlPoint1: CGPointMake(14.92, 154.07) controlPoint2: CGPointMake(0.17, 143.46)];
    
    return bezierPath;
}

- (IBAction)click:(id)sender {
    CAShapeLayer *layer = [CAShapeLayer layer];

    layer.path = [self bezierpath].CGPath;
    layer.anchorPoint = CGPointMake(0, 0);
    [self.containerView.layer addSublayer:layer];
    layer.strokeColor = [UIColor blackColor].CGColor;
    layer.fillColor   = [UIColor clearColor].CGColor;
    layer.lineCap   = kCALineCapRound;
    layer.lineJoin  = kCALineJoinRound;
    layer.lineWidth = 5.0;
    
    CABasicAnimation *write2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    write2.repeatCount = 5;
    write2.fromValue = @0;
    write2.toValue   = @1;
    write2.fillMode = kCAFillModeBoth;
    write2.removedOnCompletion = NO;
    write2.duration = 2;
    
    [layer addAnimation:write2 forKey:@"自定义动画"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
