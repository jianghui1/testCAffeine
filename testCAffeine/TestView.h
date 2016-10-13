//
//  TestView.h
//  testCAffeine
//
//  Created by ys on 15/12/3.
//  Copyright © 2015年 ys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestView : UIView

@property (weak, nonatomic) IBOutlet UIButton *bottomButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *botCost;

+ (TestView *)initWithXib;

@end
