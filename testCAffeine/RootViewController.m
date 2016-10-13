//
//  RootViewController.m
//  
//
//  Created by ys on 15/12/1.
//
//

#import "RootViewController.h"

#import "TestView.h"

#import "AutoLayoutViewController.h"

#import "TransformViewController.h"

@interface RootViewController ()

@property (nonatomic, weak) UIButton *slideButton;

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, weak) TestView *teView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 49, 50, 50);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"haha" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.slideButton = button;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [button addGestureRecognizer:pan];
    
    TestView *testView = [TestView initWithXib];
    testView.frame = CGRectMake(100, 400, 200, 200);
    [testView.bottomButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.teView = testView;
    [self.view addSubview:testView];
}

- (void)panAction:(UIPanGestureRecognizer *)sender
{
        CGPoint point = [sender translationInView:sender.view];
        [sender setTranslation:CGPointZero inView:sender.view];
        
        CGFloat x = self.slideButton.frame.origin.x + point.x;
        self.slideButton.frame = CGRectMake(x, self.slideButton.frame.origin.y, self.slideButton.frame.size.width, self.slideButton.frame.size.height);
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        if (self.slideButton.frame.origin.x > 200) {
            [UIView animateWithDuration:1 animations:^{
                self.slideButton.frame = CGRectMake(100 + 100, self.slideButton.frame.origin.y, self.slideButton.frame.size.width, self.slideButton.frame.size.height);
            }];
        } else {
            [UIView animateWithDuration:1 animations:^{
                self.slideButton.frame = CGRectMake(100, self.slideButton.frame.origin.y, self.slideButton.frame.size.width, self.slideButton.frame.size.height);
            }];
        }
    }
}

- (void)buttonAction:(UIButton *)sender
{
//    static int i = 0;
//    sender.transform = CGAffineTransformMakeRotation(-M_PI_4 * i);
//    i++;
    
    [self presentViewController:[TransformViewController new] animated:YES completion:nil];
}

- (void)btnAction:(UIButton *)sender
{
    [UIView animateWithDuration:10 animations:^{
        self.teView.botCost.constant = 100;
    }];
    
    // 跳转到自动布局控制器
    [self presentViewController:[AutoLayoutViewController new] animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    CGPoint point = [touches.anyObject locationInView:self.view];
    NSLog(@"%@", NSStringFromCGPoint(point));
}

@end
