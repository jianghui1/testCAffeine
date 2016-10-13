//
//  TestView.m
//  testCAffeine
//
//  Created by ys on 15/12/3.
//  Copyright © 2015年 ys. All rights reserved.
//

#import "TestView.h"

@interface TestView ()


@end

@implementation TestView
+ (TestView *)initWithXib
{
    return [[NSBundle mainBundle] loadNibNamed:@"TestView" owner:nil options:nil].firstObject;
}

@end
