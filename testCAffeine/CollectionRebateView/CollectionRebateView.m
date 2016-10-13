//
//  CollectionRebateView.m
//  
//
//  Created by ys on 15/11/27.
//
//

#import "CollectionRebateView.h"

@implementation CollectionRebateView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
    }
    return self;
}

// 添加控件
- (void)addSubviews
{
    // 创建收藏按钮
    self.collectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.collectionBtn.frame = CGRectMake(0, 0, 130, 49);
    [self.collectionBtn setImage:[UIImage imageNamed:@"atb_collect"] forState:UIControlStateNormal];
    [self.collectionBtn setImage:[UIImage imageNamed:@"atb_collect_pre"] forState:UIControlStateSelected];
    [self.collectionBtn setTitle:@"点击收藏" forState:UIControlStateNormal];
    [self.collectionBtn setTitle:@"取消收藏" forState:UIControlStateSelected];
    [self.collectionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.collectionBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    self.collectionBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [self.collectionBtn setImage:[UIImage imageNamed:@"atb_shoucang"] forState:UIControlStateHighlighted];
    self.collectionBtn.adjustsImageWhenHighlighted = NO;
    [self.collectionBtn addTarget:self action:@selector(collectionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat space = 10;
    CGFloat x = [UIScreen mainScreen].bounds.size.width - 17 - space;
    // 添加跳转button
    self.jumpButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.jumpButton setBackgroundImage:[UIImage imageNamed:@"mall_details.png"] forState:UIControlStateNormal];
    [self.jumpButton addTarget:self action:@selector(jumpButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.jumpButton.frame = CGRectMake(x, (49 - 22) / 2, 17, 22);
    
    // 添加返利label
    CGFloat width = 140;
    self.rebateLabel = [[UILabel alloc] initWithFrame:CGRectMake(x - width, 0, width, 49)];
    self.rebateLabel.text = @"该商品返利36%";
    self.rebateLabel.textColor = [UIColor whiteColor];
    
    [self addSubview:self.collectionBtn];
    [self addSubview:self.jumpButton];
    [self addSubview:self.rebateLabel];
}

// 属性传值
//- (void)setCobject:(CollectionObject *)cobject
//{
//    _cobject = cobject;
//    // 收藏按钮的状态
//    self.collectionBtn.selected = cobject.collect;
//    // 返利信息
//    self.rebateLabel.text = cobject.fanNote;
//    // H5 页面（新窗口弹出）如果为空，则不显示图标
//    self.jumpButton.hidden = !cobject.fanUrl;
//    if (!self.jumpButton.hidden) {
//        [self.jumpButton addTarget:self action:@selector(jumpButtonAction) forControlEvents:UIControlEventTouchUpInside];
//    }
//}

// 返利按钮的点击事件
- (void)jumpButtonAction
{
    if (_delegate && [_delegate respondsToSelector:@selector(didClickedJumpButtonWithUrl:)]) {
//        [self.delegate didClickedJumpButtonWithUrl:_cobject.fanUrl];
    }
}

- (void)collectionBtnAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
}

@end
