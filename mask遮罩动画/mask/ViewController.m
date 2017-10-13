//
//  ViewController.m
//  mask
//
//  Created by xiaoliuTX on 2017/8/30.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UISlider *progressControl;
@property (nonatomic, strong) CAShapeLayer *loadlLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (IBAction)loadAuto:(UIButton *)sender {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(80,80)
                                                            radius:40
                                                        startAngle:-M_PI_2
                                                          endAngle:M_PI_2 * 3
                                                         clockwise:YES];
        
        
        self.loadlLayer = [CAShapeLayer new];
        self.loadlLayer.path = path.CGPath;
        self.loadlLayer.strokeColor = [UIColor redColor].CGColor;
        self.loadlLayer.fillColor = [UIColor clearColor].CGColor;
        self.loadlLayer.lineWidth = 80;
        self.loadlLayer.strokeStart = 0;
        self.loadlLayer.strokeEnd = 0;
        
        self.loadingView.layer.mask = self.loadlLayer;
        
        CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        strokeEndAnimation.fromValue = @0.5;
        strokeEndAnimation.toValue = @.8;
        strokeEndAnimation.duration = 2;
        strokeEndAnimation.repeatCount = INFINITY;
        strokeEndAnimation.removedOnCompletion = NO;
        
        [self.loadlLayer addAnimation:strokeEndAnimation forKey:@"test"];
        
    });
}

- (IBAction)puase:(id)sender {
    CFTimeInterval pausedTime = [self.loadingView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.loadingView.layer.speed               = 0.0;
    self.loadingView.layer.timeOffset          = pausedTime;
}

- (IBAction)resume:(id)sender {
    CFTimeInterval pausedTime     = [self.loadingView.layer timeOffset];
    
    self.loadingView.layer.timeOffset              = 0.0;
    self.loadingView.layer.beginTime               = 0.0;
    CFTimeInterval timeSincePause = CACurrentMediaTime() - pausedTime;
    self.loadingView.layer.beginTime               = timeSincePause;
    self.loadingView.layer.speed                   = 1.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)progressChange:(UISlider *)sender {
    
    [self.loadlLayer removeAllAnimations];
    
    self.loadlLayer.strokeEnd = sender.value;
//    self.loadlLayer.timeOffset = sender.value;
}

@end
