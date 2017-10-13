//
//  PCMagicMoveAnimator.m
//  动效过度
//
//  Created by xiaoliuTX on 2017/9/4.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import "PCMagicMoveAnimator.h"
#import "PCImagePreViewingController.h"
//@interface PCMagicMoveAnimator () <UIViewControllerTransitioningDelegate>


@implementation PCMagicMoveAnimator
#pragma mark UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return [transitionContext isAnimated] ? 0.3 : 0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = transitionContext.containerView;
    containerView.backgroundColor = [UIColor clearColor];
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    BOOL isPresenting = [toViewController isMemberOfClass:[PCImagePreViewingController class]];
    CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toViewController];
    
    UIImageView *fromTransitionView = [fromViewController valueForKey:@"transitionView"];
    UIImageView *toTransitionView = [toViewController valueForKey:@"transitionView"];
    CGRect fromTRansitionRect = [containerView convertRect:fromTransitionView.frame fromView:fromTransitionView.superview];
//    CGRect toTRansitionRect = [containerView convertRect:toTransitionView.frame toView:toTransitionView.superview];
    CGRect toTRansitionRect = [[toViewController valueForKey:@"transitionRect"] CGRectValue];
    
//    UIView *snapShotView = [transitionView snapshotViewAfterScreenUpdates:NO];
    UIImageView *snapShotView = [[UIImageView alloc] initWithFrame:fromTRansitionRect];
    snapShotView.image = fromTransitionView.image;

    snapShotView.frame = fromTRansitionRect;
    fromTransitionView.hidden = YES;
    
    if (isPresenting) {
        
        toView.frame = toViewFinalFrame;
        toView.alpha = 1;
        [containerView addSubview:toView];
        [containerView addSubview:snapShotView];
    } else {
        
        [containerView addSubview:snapShotView];
        toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    }
    
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:transitionDuration animations:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            snapShotView.image = toTransitionView.image;
        });
        if (isPresenting) {
            toView.alpha = 1;
            snapShotView.frame = toTRansitionRect;
        } else {

            toView.alpha = 1;
            snapShotView.frame = toTRansitionRect;
        }
        
    } completion:^(BOOL finished) {
        if (isPresenting) {
            fromTransitionView.hidden = NO;
            [snapShotView removeFromSuperview];
        } else {
            fromTransitionView.hidden = NO;
            [snapShotView removeFromSuperview];
            [fromView removeFromSuperview];
        }
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCancelled];
    }];
}

@end
