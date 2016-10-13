//
//  CollectionRebateView.h
//  
//
//  Created by ys on 15/11/27.
//
//

#import <UIKit/UIKit.h>

@class CollectionObject;

@protocol CollectionRebateViewDelegate <NSObject>

// 返利按钮的代理事件
- (void)didClickedJumpButtonWithUrl:(NSString *)urlString;

@end

@interface CollectionRebateView : UIView

// 收藏按钮
@property (nonatomic, strong) UIButton *collectionBtn;
// 返利label
@property (nonatomic, strong) UILabel *rebateLabel;
// 跳转按钮
@property (nonatomic, strong) UIButton *jumpButton;
// 代理
@property (nonatomic, assign) id<CollectionRebateViewDelegate> delegate;

// 属性传值
@property (nonatomic, strong) CollectionObject *cobject;


@end
