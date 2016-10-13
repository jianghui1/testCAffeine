//
//  TransformViewController.m
//  testCAffeine
//
//  Created by ys on 15/12/11.
//  Copyright © 2015年 ys. All rights reserved.
//

#import "TransformViewController.h"

#define ANIM_ROTATE @"animationRotate"
#define ANIM_FALLING @"animationFalling"
#define ANIM_GROUP @"animationFallingRotate"

@interface TransformViewController ()

@property (nonatomic, strong) UIButton *cgaButton;
@property (nonatomic, strong) UIButton *caButton;

@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // cgatransform
    [self.view addSubview:self.cgaButton];
    
    // catransform
    [self.view addSubview:self.caButton];
}

- (UIButton *)cgaButton
{
    if (!_cgaButton) {
        _cgaButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_cgaButton setTitle:@"2D" forState:UIControlStateNormal];
        _cgaButton.frame = CGRectMake(50, 150, 100, 30);
        _cgaButton.backgroundColor = [UIColor redColor];
        [_cgaButton addTarget:self action:@selector(cgaButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cgaButton;
}

- (UIButton *)caButton
{
    if (!_caButton) {
        _caButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_caButton setTitle:@"3D" forState:UIControlStateNormal];
        _caButton.frame = CGRectMake(50, 300, 100, 30);
        _caButton.backgroundColor = [UIColor redColor];
        [_caButton addTarget:self action:@selector(caButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _caButton;
}
#pragma mark - button的点击事件
- (void)cgaButtonAction:(UIButton *)sender
{
    // 旋转
//    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        sender.transform = CGAffineTransformRotate(sender.transform, -M_PI_2);
//    } completion:nil];

    // 缩放
//    CGAffineTransform tr = CGAffineTransformScale(sender.transform, 2, 2);
//    [sender.layer setAnchorPoint:CGPointMake(0, 1)];
//    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        sender.transform = tr;
//    } completion:nil];

    // 位移
//    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        sender.transform = CGAffineTransformTranslate(sender.transform, 0, 100);
    //    } completion:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)caButtonAction:(UIButton *)sender
{
    // 3D旋转
//    CAAnimation *myAnimationRotate = [self animationRotate];
//    [sender.layer addAnimation:myAnimationRotate forKey:ANIM_ROTATE];
    
    // 3D下落
    CAAnimation *myAnimationFalling = [self animationFalling];
    [sender.layer addAnimation:myAnimationFalling forKey:ANIM_FALLING];
    
    // 3D缩水
//    CAAnimation *myAnimationShrink = [self animationShrink];
//    [sender.layer setAnchorPoint:CGPointMake(1, 1)];
//    [sender.layer addAnimation:myAnimationShrink forKey:ANIM_GROUP];

}

/**
  3D旋转
 */
- (CAAnimation *)animationRotate
{
    CATransform3D rotationTransform = CATransform3DMakeRotation(M_PI, 0, 1.0, 0);
    CABasicAnimation *animation;
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:rotationTransform];
    animation.duration = 1.5;
    animation.autoreverses = NO;
    animation.cumulative = YES;
    animation.repeatCount = FLT_MAX; // forever
    // 设置开始时间，能够连续播放多组动画
    animation.beginTime = .5;
    // 设置动画代理
    animation.delegate = self;
    return animation;
}
/**
  3D下落 
 */
- (CAAnimation *)animationFalling
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.duration = 5;
    animation.autoreverses = NO;
    animation.removedOnCompletion = NO;
    animation.repeatCount = FLT_MAX;
    animation.fromValue = [NSNumber numberWithInt:0];
    animation.toValue = [NSNumber numberWithInt:1024];
    // 设置动画代理
    animation.delegate = self;
    return animation;
}
/**
  3D缩水
 */
- (CAAnimation *)animationShrink
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.toValue = [NSNumber numberWithDouble:2.0];
    animation.duration = 3.0;
    animation.autoreverses = YES;
    animation.repeatCount = FLT_MAX;
    animation.removedOnCompletion = NO;
    animation.delegate = self;
    return animation;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
