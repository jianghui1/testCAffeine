//
//  AutoLayoutViewController.m
//  testCAffeine
//
//  Created by ys on 15/12/5.
//  Copyright © 2015年 ys. All rights reserved.
//

#import "AutoLayoutViewController.h"

#import "UIView+AutoLayout.h"
#import "CollectionRebateView.h"

typedef NS_ENUM(NSInteger, ExampleConstraintDemo) {
    ExampleConstraintDemoReset = 0,
    ExampleConstraintDemo1,
    ExampleConstraintDemo2,
    ExampleConstraintDemo3,
    ExampleConstraintDemo4,
    ExampleConstraintDemo5,
    ExampleConstraintDemo6,
    ExampleConstraintDemo7,
    ExampleConstraintDemoCount
};

@interface AutoLayoutViewController ()

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *yellowView;
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UILabel *orangeView;

@property (nonatomic, assign) ExampleConstraintDemo constraintDemo;

@property (nonatomic, assign) BOOL isAnimationDemo3;
@property (nonatomic, strong) NSLayoutConstraint *demo3BlueBottomInset;
@property (nonatomic, strong) NSLayoutConstraint *demo3BlueRightInset;
@property (nonatomic, strong) NSLayoutConstraint *demo3RedSizeConstraint;
@property (nonatomic, strong) NSLayoutConstraint *demo3GreenPinConstraint;

// 收藏界面
@property (nonatomic, strong) CollectionRebateView *collReView;
// 收藏界面约束
@property (nonatomic, strong) NSLayoutConstraint *layoutConstraint;

@end

@implementation AutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加控件
    [self setupViews];
}

// 添加控件
- (void)setupViews
{
    [self.view addSubview:self.containerView];
    [self.view addSubview:self.blueView];
    [self.view addSubview:self.redView];
    [self.view addSubview:self.yellowView];
    [self.view addSubview:self.greenView];
    [self.view addSubview:self.orangeView];
    
    // 添加收藏界面
    [self.view addSubview:self.collReView];
    [self addConstraintToCollReView];
    
    self.constraintDemo = ExampleConstraintDemoReset;
//    [self nextDemo];
    
//    [self setupDemo1];
//    [self setupDemo2];
//    [self setupDemo3];
//    [self setupDemo4];
//    [self setupDemo5];
//    [self setupDemo6];
//    [self setupDemo7];
    
    // 给每个view单独添加约束
//    [self addConstraintToEveryView];

    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextDemo)]];
}

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [UIView newAutoLayoutView];
        _containerView.backgroundColor = [UIColor blackColor];
    }
    return _containerView;
}
- (UIView *)blueView
{
    if (!_blueView) {
        _blueView = [UIView newAutoLayoutView];
        _blueView.backgroundColor = [UIColor blueColor];
    }
    return _blueView;
}
- (UIView *)redView
{
    if (!_redView) {
        _redView = [UIView newAutoLayoutView];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}
- (UIView *)yellowView
{
    if (!_yellowView) {
        _yellowView = [UIView newAutoLayoutView];
        _yellowView.backgroundColor = [UIColor yellowColor];
    }
    return _yellowView;
}
- (UIView *)greenView
{
    if (!_greenView) {
        _greenView = [UIView newAutoLayoutView];
        _greenView.backgroundColor = [UIColor greenColor];
    }
    return _greenView;
}
- (UILabel *)orangeView
{
    if (!_orangeView) {
        _orangeView = [UILabel newAutoLayoutView];
        _orangeView.backgroundColor = [UIColor orangeColor];
    }
    return _orangeView;
}

- (void)nextDemo
{
    self.constraintDemo++;
    [self.view setNeedsUpdateConstraints];
}

// 调用父类更新约束的方法
- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
    // 添加约束
    [self setupConstraintsForCurrentDemo];
}
// 添加约束
- (void)setupConstraintsForCurrentDemo
{
    if (self.constraintDemo >= ExampleConstraintDemoCount) {
        self.constraintDemo = ExampleConstraintDemo1;
    }
    
//    [self.view autoRemoveConstraintsAffectingViewAndSubviews];
    [self.view autoRemoveConstraintsAffectingViewAndSubviewsIncludingImplicitConstraints:YES];
    [self addConstraintToContrainerView];
    
    switch (self.constraintDemo) {
        case ExampleConstraintDemo1:
            [self setupDemo1];
            break;
        case ExampleConstraintDemo2:
            [self setupDemo2];
            break;
        case ExampleConstraintDemo3:
            [self setupDemo3];
            break;
        case ExampleConstraintDemo4:
            [self setupDemo4];
            break;
        case ExampleConstraintDemo5:
            [self setupDemo5];
            break;
        case ExampleConstraintDemo6:
            [self setupDemo6];
            break;
        case ExampleConstraintDemo7:
            [self setupDemo7];
            break;
        default:
            self.constraintDemo = ExampleConstraintDemoReset;
            break;
    }
}
- (void)setupDemo1
{
    NSArray *subViews = @[self.blueView, self.redView, self.yellowView, self.greenView, self.orangeView];
    
    [self.blueView autoSetDimension:ALDimensionWidth toSize:80.0f];
    [subViews autoMatchViewsDimension:ALDimensionWidth];
    
    [self.orangeView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [subViews autoDistributeViewsAlongAxis:ALAxisVertical withFixedSize:100.f insetSpacing:YES alignment:NSLayoutFormatAlignAllCenterX];
}
- (void)setupDemo2
{
    NSArray *subViews = @[self.blueView, self.redView, self.yellowView, self.greenView, self.orangeView];
    
    [self.blueView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionWidth ofView:self.blueView];
//    [self.blueView autoSetDimension:ALDimensionHeight toSize:50.0f];
    [subViews autoMatchViewsDimension:ALDimensionHeight];
    
    [self.orangeView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [subViews autoDistributeViewsAlongAxis:ALAxisHorizontal withFixedSize:10.0f insetSpacing:YES alignment:NSLayoutFormatAlignAllCenterY];
}
- (void)setupDemo3
{
    [self.orangeView autoSetDimensionsToSize:CGSizeZero];
    
    [UIView autoSetPriority:UILayoutPriorityDefaultHigh forConstraints:^{
        [self.blueView autoSetDimensionsToSize:CGSizeMake(60.0f, 80.0f)];
    }];
    
    [self.blueView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.blueView.superview withOffset:-80.0f relation:NSLayoutRelationGreaterThanOrEqual];
    
    self.demo3BlueBottomInset = [self.blueView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:50.0f];
    self.demo3BlueRightInset = [self.blueView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10.0f];
    
    [self.redView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.blueView];
    self.demo3RedSizeConstraint = [self.redView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.blueView];
    
    [self.redView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.blueView];
    [self.blueView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.redView withOffset:30.0f];
    
    self.demo3GreenPinConstraint = [self.greenView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.redView ];
    [self.greenView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.redView withOffset:-50.0f];
    [self.greenView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.redView];
    [self.greenView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionWidth ofView:self.blueView];
    
    [self.view layoutIfNeeded];

    if (self.isAnimationDemo3 == NO) {
        double delayInSeconds = .0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.isAnimationDemo3 = YES;
            [self animateDemo3Constraints];
        });
    }
}
- (void)animateDemo3Constraints
{
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.demo3BlueBottomInset.constant = -10.0f;
                         self.demo3BlueRightInset.constant = -50.0f;
                         self.demo3RedSizeConstraint.constant = 10.0f;
                         [self.demo3GreenPinConstraint autoRemove];
                         self.demo3GreenPinConstraint = [self.greenView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.blueView];
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         if (self.constraintDemo != ExampleConstraintDemo3) {
                             self.isAnimationDemo3 = NO;
                             return;
                         }
                     }];
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.demo3BlueBottomInset.constant = -50.0f;
                         self.demo3BlueRightInset.constant = -10.0f;
                         self.demo3RedSizeConstraint.constant = -40.0f;
                         [self.demo3GreenPinConstraint autoRemove];
                         self.demo3GreenPinConstraint = [self.greenView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.redView];
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         if (self.constraintDemo == ExampleConstraintDemo3) {
                             [self animateDemo3Constraints];
                         } else {
                             self.isAnimationDemo3 = NO;
                         }
                     }];
}
- (void)setupDemo4
{
    [self.redView autoSetDimension:ALDimensionHeight toSize:44.0f];
    [self.blueView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.redView];
    
    [self.redView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20.0f];
    [self.redView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20.0f];
    
    [self.blueView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20.0f];
    [self.blueView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20.0f];
    
    [self.blueView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.redView withOffset:10.0f];
    [self.blueView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.redView withMultiplier:3.0f];
    
    [self.orangeView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.blueView withOffset:20.0f];
    [self.orangeView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.redView];
    [self.orangeView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.blueView];
    [self.orangeView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20.0f];
}
- (void)setupDemo5
{
    [self.redView autoSetDimension:ALDimensionHeight toSize:44.0f];
    [self.blueView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.redView];
    
    [self.redView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20.0f];
    [self.redView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20.0f];
    
    [self.blueView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20.0f];
    [self.blueView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20.0f];
    
    [self.blueView autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:self.redView withOffset:10.0f];
    [self.blueView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.redView withMultiplier:3.0f];
    
    [self.orangeView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.blueView withOffset:20.0f];
    [self.orangeView autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:self.redView withOffset:20.0f];
    [self.orangeView autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:self.blueView withOffset:-10.0f];
    [self.orangeView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20.0f];
}
- (void)setupDemo6
{
    [self.blueView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10.0f];
    [self.blueView autoSetDimensionsToSize:CGSizeMake(25, 10)];
    [self.blueView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    NSArray *subviews = @[self.blueView, self.redView, self.yellowView, self.greenView, self.orangeView];
    
    [subviews autoAlignViewsToAxis:ALAxisVertical];

    UIView *previousView = nil;
    for (UIView *view in subviews) {
        if (previousView) {
            [view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:previousView withOffset:10];
            
            UILayoutPriority priority = (view == self.orangeView) ? UILayoutPriorityDefaultHigh + 1 : UILayoutPriorityRequired;
            [UIView autoSetPriority:priority forConstraints:^{
                [view autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:previousView withMultiplier:1.5f];
                [view autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:previousView withMultiplier:2.f];
            }];
        }
        previousView = view;
    }
    [self.orangeView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.containerView withOffset:-10.0f relation:NSLayoutRelationLessThanOrEqual];
}
- (void)setupDemo7
{
    [self.redView autoCenterInSuperview];
    [self.redView autoSetDimensionsToSize:CGSizeMake(100.0f, 250.0f)];
    
    [self.orangeView autoSetDimensionsToSize:CGSizeMake(50.0f, 50.0f)];
    [self.orangeView autoConstrainAttribute:ALAxisHorizontal toAttribute:ALEdgeTop ofView:self.redView];
}

// 给每个view单独添加约束
- (void)addConstraintToEveryView
{
    // 给containerView添加约束
    [self addConstraintToContrainerView];
    // 给blueView添加约束
    [self addConstraintToblueView];
    // 给redView添加约束
    [self addConstraintToredView];
    // 给yellowView添加约束
    [self addConstraintToyellowView];
    // 给greenView添加约束
    [self addConstraintTogreenView];
    // 给orangeView添加约束
    [self addConstraintToorangeView];
}

// 给containerView添加约束
- (void)addConstraintToContrainerView
{
    [self.containerView autoPinToTopLayoutGuideOfViewController:self withInset:10.0];
    [self.containerView autoPinToBottomLayoutGuideOfViewController:self withInset:10.0];
    [self.containerView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10.0f];
    [self.containerView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10.0f];
}
// 给blueView添加约束
- (void)addConstraintToblueView
{
//    [self.blueView autoSetDimension:ALDimensionHeight toSize:10];
//    [self.blueView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionWidth ofView:self.blueView];
//    [self.blueView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:100];
//    [self.blueView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:100];
    [self.blueView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    [self.blueView autoCenterInSuperview];
}
// 给redView添加约束
- (void)addConstraintToredView
{
    [self.redView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.blueView withMultiplier:2];
    [self.redView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.blueView];
    [self.redView autoConstrainAttribute:ALEdgeTop toAttribute:ALEdgeBottom ofView:self.blueView];
    [self.redView autoConstrainAttribute:ALDimensionHeight toAttribute:ALDimensionHeight ofView:self.blueView];
    
}
// 给yellowView添加约束
- (void)addConstraintToyellowView
{
    [self.yellowView autoConstrainAttribute:ALEdgeLeading toAttribute:ALEdgeLeading ofView:self.redView withOffset:20];
    [self.yellowView autoConstrainAttribute:ALEdgeTop toAttribute:ALEdgeBottom ofView:self.redView withOffset:0];
    [self.yellowView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.redView];
    [self.yellowView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.redView];
}
// 给greenView添加约束
- (void)addConstraintTogreenView
{
    [self.greenView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(100, 100, 10, 10) excludingEdge:ALEdgeTop];
    [self.greenView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
}
// 给orangeView添加约束
- (void)addConstraintToorangeView
{
    [self.orangeView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.greenView];
    [self.orangeView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.greenView withOffset:10];
    [self.orangeView autoSetDimensionsToSize:CGSizeMake(100, 100)];
}

- (CollectionRebateView *)collReView
{
    if (!_collReView) {
        _collReView = [[CollectionRebateView alloc] init];
        _collReView.backgroundColor = [UIColor blackColor];
    }
    return _collReView;
}
- (void)addConstraintToCollReView
{
    self.layoutConstraint = [_collReView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 0, 0, 0) excludingEdge:ALEdgeTop][1];
    [_collReView autoSetDimension:ALDimensionHeight toSize:50];
}
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    static BOOL isShow = NO;
//    self.layoutConstraint.constant = isShow ? 0 : 50;
//    isShow = !isShow;
//    [UIView animateWithDuration:0.7 animations:^{
//        [self.view layoutIfNeeded];
//    }];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
