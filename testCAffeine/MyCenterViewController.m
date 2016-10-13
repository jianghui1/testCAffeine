//
//  MyCenterViewController.m
//  RebateMall
//
//  Created by apple on 15/6/7.
//  Copyright (c) 2015年 Liqu. All rights reserved.
//

#import "MyCenterViewController.h"

#define NavigationBarHight 64.0f
#define ImageHight 100.0f

@interface MyCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    float headerHight;
    UIImageView *_zoomImageView;//变焦图片做底层
    UIImageView *portrait;
}
@property (strong, nonatomic) UITableView *myTableView;
@property (strong, nonatomic) NSArray *titleArr;
@property (strong, nonatomic) NSArray *imageArr;
@property (strong, nonatomic) UIView *hintView;
@property (strong, nonatomic) UIImageView *iconImagView;
@property (strong, nonatomic) NSMutableArray *priceArray;
@property (strong, nonatomic) UILabel *uNameLabel;
//@property (nonatomic, strong) UIView *headerView;
// 站内信按钮上方的红点
@property (weak, nonatomic) IBOutlet UIImageView *redPoint;
// 站内信按钮的点击事件
- (IBAction)letterButton:(UIButton *)sender;

@end

@implementation MyCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _titleArr = @[@"我的返利",@"浏览过的宝贝",@"淘宝实时跟单",@"我的账户", @"我的收藏",@"我的奖励",@"联系客服"];
    _imageArr = @[@"account_ic_myrebate",
                  @"account_ic_record",
                  @"account_ic_tbdoc",
                  @"account_ic_account",
                  @"account_ic_collect",
                  @"account_ic_reward",
                  @"account_ic_contact"];
    
    self.view.backgroundColor = [UIColor redColor];
//    [self initTableView];
}


//-(void)initTableView {
//    
////    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavBarHeight, kScreenW, kScreenH-kNavBarHeight-kBottomBarHeight) style:UITableViewStylePlain];
////    
////    self.myTableView.backgroundColor = UIColorRGB_BGColor;
////    self.myTableView.dataSource = self;
////    self.myTableView.delegate = self;
////    self.myTableView.bounces=NO;
////    [self.view addSubview:self.myTableView];
////    self.myTableView.tableFooterView = [[UIView alloc]init];
//    
//    // 添加头视图
////    [self addTableHeaderView];
//}
//
//// 添加头视图
//- (void)addTableHeaderView
//{
////    self.myTableView.tableHeaderView = ({
//        // 对支付宝状态的提醒 视图
////        _hintView = [[UIView alloc]initWithFrame:CGRectMake(0, 150, kScreenW, 40)];
////        _hintView.backgroundColor = RGBColorAlpha(253, 248, 161, 1);
////        if ([[Toolkit getUserInfoObjectForKey:User_Alipay] isEqualToString:@""]) {
////            headerHight = 235;
////            _hintView.hidden = NO;
////        }else{
////            headerHight = 195;
////            _hintView.hidden = YES;
////        }
////        self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,kScreenW, headerHight)];
////        [self.headerView setBackgroundColor:[UIColor whiteColor]];
////        [self adView:self.headerView];
////        [self personInfoView:self.headerView];
////        
////        self.headerView;
////    });
//}
//// 控制对支付宝状态的提醒 视图
//-(void)initTableHeaderView {
//    //支付宝提示
////    [self.myTableView.tableHeaderView removeFromSuperview];
////    self.myTableView.tableHeaderView = ({
////        // 对支付宝状态的提醒 视图
////        _hintView = [[UIView alloc]initWithFrame:CGRectMake(0, 150, kScreenW, 40)];
////        _hintView.backgroundColor = RGBColorAlpha(253, 248, 161, 1);
////        if ([[Toolkit getUserInfoObjectForKey:User_Alipay] isEqualToString:@""]) {
////            headerHight = 200;
////            if (_hintView.hidden) {
////                return;
////            }
////            _hintView.hidden = NO;
////        }else{
////            headerHight = 160;
////            if (!_hintView.hidden) {
////                return;
////            }
////            _hintView.hidden = YES;
////        }
////    // 修改头视图frame
////    self.headerView.frame = CGRectMake(0, 0, kScreenW, headerHight);
////        UIView *_headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,kScreenW, headerHight)];
////        [_headerView setBackgroundColor:[UIColor whiteColor]];
////        [self adView:_headerView];
////        [self personInfoView:_headerView];
////        _headerView;
////    });
//}
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat y = scrollView.contentOffset.y+NavigationBarHight;//根据实际选择加不加上NavigationBarHight（44、64 或者没有导航条）
//    if (y < -ImageHight) {
//        CGRect frame = _zoomImageView.frame;
//        frame.origin.y = y;
//        frame.size.height =  -y;//contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
//        _zoomImageView.frame = frame;
//    }
//    
//}
//
//#pragma mark  表头的账号
//-(void)adView:(UIView *)view {
//    // 添加表头视图
////    UIView* acceBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 135)];
////    [acceBgView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"account_bg"]]];
////    
////    [view addSubview:acceBgView];
////    
////    portrait=[[UIImageView alloc]initWithFrame:CGRectMake((kScreenW-65)/2, 0, 65, 65 )];
////    portrait.layer.cornerRadius = portrait.frame.size.width/2;
////    portrait.clipsToBounds = YES;
////    [portrait.layer setMasksToBounds:YES];
////    [portrait.layer setBorderWidth:2];
////    portrait.layer.borderColor = [UIColor whiteColor].CGColor;
////    NSString *userLogo = [Toolkit getUserInfoObjectForKey:User_Picture];
////    if(userLogo != nil) {
////        [portrait sd_setImageWithURL:[NSURL URLWithString:userLogo] placeholderImage:[UIImage imageNamed:@"account_img"]];
////    }else{
////        portrait.image=[UIImage imageNamed:@"account_img"];
////    }
////    [acceBgView addSubview:portrait];
////    
////
////    UIButton *portraitBtn=[UIButton buttonWithType:UIButtonTypeCustom];
////    portraitBtn.frame=CGRectMake((kScreenW-65)/2, 0, 65, 65 );
////    portraitBtn.layer.cornerRadius = portraitBtn.frame.size.width/2;
////    portraitBtn.clipsToBounds = YES;
////    [portraitBtn.layer setMasksToBounds:YES];
////    [portraitBtn.layer setBorderWidth:2];
////    portraitBtn.layer.borderColor = [UIColor whiteColor].CGColor;
////    [portraitBtn addTarget:self action:@selector(moveTOCustomerInfo) forControlEvents:UIControlEventTouchUpInside];
////    [acceBgView addSubview:portraitBtn];
////
////    
////    _iconImagView  = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenW/2+20, 40, 20, 20)];
////    _iconImagView.image = [UIImage imageNamed:[NSString stringWithFormat:@"account_ic_vip%d",[[Toolkit getUserInfoObjectForKey:User_Level] intValue]]];
////    [acceBgView addSubview:_iconImagView];
////    
////    _uNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 70,kScreenW, 21)];
////    _uNameLabel.textAlignment = NSTextAlignmentCenter;
////    _uNameLabel.textColor = [UIColor whiteColor];
////    _uNameLabel.font = ArialFont(14);
////    _uNameLabel.text = [Toolkit getUserInfoObjectForKey:User_Nick];
////    [acceBgView addSubview:_uNameLabel];
////    
////    // 添加签到赚钱按钮
////    CGFloat height = 30;
//////    CGFloat width = CGRectGetHeight(_uNameLabel.frame);
////    CGFloat width = 100;
////    CGFloat x = (kScreenW - width) / 2;
////    CGFloat y = CGRectGetMaxY(_uNameLabel.frame) + 5;
////    UIButton *signButton = [Toolkit createButtonWithFrame:CGRectMake(x, y, width, height) andBorderWidth:1 andCornerRadius:5 andBorderColor:[UIColor whiteColor] andBackGroundColor:[UIColor redColor] andTitleLabelColor:[UIColor whiteColor] andTitle:@"签到赚钱"];
////    [signButton addTarget:self action:@selector(signAction) forControlEvents:UIControlEventTouchUpInside];
////    [acceBgView addSubview:signButton];
//}
//- (void)signAction
//{
//    // 跳转到签到赚钱
////    SignRebateViewController *signVC = [[SignRebateViewController alloc] init];
////    [self.navigationController pushViewController:signVC animated:YES];
//}
//
//-(void)moveTOCustomerInfo {
////    CustomerInfoViewController *customerVC = [[CustomerInfoViewController alloc]initWithNibName:@"CustomerInfoViewController" bundle:nil];
////    [self.navigationController pushViewController:customerVC animated:YES];
//}
//
//-(void)personInfoView:(UIView *)view {
//    
////    //infoView  账号下面的三块区域
////    UIView *infoView = [[UIView alloc]initWithFrame:CGRectMake(0, 145, kScreenW, 40)];
////    infoView.backgroundColor = [UIColor whiteColor];
////    [view addSubview:infoView];
////    
////    NSArray *tArr = @[@"可提现 (元)",@"已返利 (集分宝)",@"趣币 (个)"];
////    for (int i = 0; i < tArr.count; i++) {
////        UILabel *tLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenW/3*i, 0, kScreenW/3, 21)];
////        tLabel.textAlignment = NSTextAlignmentCenter;
////        tLabel.textColor = [UIColor lightGrayColor];
////        tLabel.font = ArialFont(10);
////        tLabel.text = tArr[i];
////        [infoView addSubview:tLabel];
////        
////        UILabel *iLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenW/3*i, 17, kScreenW/3, 21)];
////        iLabel.textAlignment = NSTextAlignmentCenter;
////        if (i == 0) {
////            iLabel.textColor = [UIColor redColor];
//////            iLabel.text = [NSString stringWithFormat:@"%.2f",[_priceArray[i] floatValue]/100];
////            
////        }else{
////            iLabel.textColor = [UIColor grayColor];
//////            iLabel.text = [NSString stringWithFormat:@"%d",[_priceArray[i] intValue]];
////        }
////        iLabel.font = ArialFont(14);
////        [infoView addSubview:iLabel];
////        
////        // 遮盖button用于实现跳转
////        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
////        btn.frame = CGRectMake(kScreenW/3*i, 0, kScreenW/3, 40);
////        btn.tag = 201507090+i;
////        [btn addTarget:self action:@selector(didPushClick:) forControlEvents:UIControlEventTouchUpInside];
////        [infoView addSubview:btn];
////        
////        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(kScreenW/3*(i+1), 5, 1, 30)];
////        lineView.backgroundColor = [UIColor lightGrayColor];
////        lineView.alpha = 0.2;
////        [infoView addSubview:lineView];
////    }
//    
////#pragma mark -判断支付宝填写状态及跳转
////    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 40)];
////    label.textAlignment = NSTextAlignmentCenter;
////    label.font = ArialFont(14);
////    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"您的支付宝未填写,您的返利将无法顺利到帐"];
////    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0,14)];
////    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(14,6)];
////    label.attributedText = str;
////    [_hintView addSubview:label];
////    
////    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
////    btn.frame = CGRectMake(0, 0, kScreenW, 40);
////    [btn addTarget:self action:@selector(didPayInfo:) forControlEvents:UIControlEventTouchUpInside];
////    [_hintView addSubview:btn];
////    //黄色下面的小灰条
////    [view addSubview:_hintView];
////    UIView *bottomView  = [[UIView alloc]initWithFrame:CGRectMake(0, headerHight-10, kScreenW, 10)];
////    bottomView.backgroundColor = RGBColorAlpha(236, 236, 236, 1);
////    [view addSubview:bottomView];
//}
//
//-(void)didPayInfo:(id)sender {
//    //TODO：填写支付宝信息
//    AlipayViewController *alipayVC = [[AlipayViewController alloc]initWithNibName:@"AlipayViewController" bundle:nil];
//    [self.navigationController pushViewController:alipayVC animated:YES];
//}
//
//-(void)didPushClick:(UIButton *)sender {
//    switch (sender.tag) {
//        case 201507090:
//        {
//            //我的账户
//            MyAccountViewController *myAccountVC = [[MyAccountViewController alloc]initWithNibName:@"MyAccountViewController" bundle:nil];
//            [self.navigationController pushViewController:myAccountVC animated:YES];
//        }
//            break;
//        case 201507091:
//        {
//            //我的返利
//            MyRebateViewController *myRebateVC = [[MyRebateViewController alloc]initWithNibName:@"MyRebateViewController" bundle:nil];
//            [self.navigationController pushViewController:myRebateVC animated:YES];
//        }
//            break;
//        case 201507092:
//        {
//            //趣币明细
//            QuCoinViewController *quCoinVC = [[QuCoinViewController alloc]initWithNibName:@"QuCoinViewController" bundle:nil];
//            [self.navigationController pushViewController:quCoinVC animated:YES];
//        }
//            break;
//        default:
//            break;
//    }
//}
//#pragma mark -UITableViewDelegate
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
////   return _titleArr.count;
//    return 10;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *identy = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
//    if (nil == cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identy];
//    }
////    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
////    cell.accessoryType   = UITableViewCellAccessoryDisclosureIndicator;
////    cell.imageView.image = [UIImage imageNamed:_imageArr[indexPath.row]];
////    cell.textLabel.text  = _titleArr[indexPath.row];
////    cell.textLabel.font  = ArialFont(14);
//    return cell;
//}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    switch (indexPath.row) {
//        case 0:
//        {
//            //我的返利
//            MyRebateViewController *myRebateVC = [[MyRebateViewController alloc]initWithNibName:@"MyRebateViewController" bundle:nil];
//            [self.navigationController pushViewController:myRebateVC animated:YES];
//        }
//            break;
//        case 1:
//        {
//            //浏览记录
//            CookiesViewController *cookesVC = [[CookiesViewController alloc]initWithNibName:@"CookiesViewController" bundle:nil];
//            [self.navigationController pushViewController:cookesVC animated:YES];
//        }
//            break;
//        case 2:
//        {
//            //淘宝实时跟单
//            TaobaoOrderViewController *tbOrderVC = [[TaobaoOrderViewController alloc]initWithNibName:@"TaobaoOrderViewController" bundle:nil];
//            [self.navigationController pushViewController:tbOrderVC animated:YES];
//        }
//            break;
//        case 3:
//        {
//            //我的账户
//            MyAccountViewController *myAccountVC = [[MyAccountViewController alloc]initWithNibName:@"MyAccountViewController" bundle:nil];
//            [self.navigationController pushViewController:myAccountVC animated:YES];
//        }
//            break;
//        case 4:
//        {
//            // 我的收藏
//            MyCollectionViewController *myCollectionVC = [[MyCollectionViewController alloc] initWithNibName:@"MyCollectionViewController" bundle:nil];
//            [self.navigationController pushViewController:myCollectionVC animated:YES];
//        }
//            break;
//        case 5:
//        {
//            //我的奖励
//            RewardsViewController *rewardsVC = [[RewardsViewController alloc]initWithNibName:@"RewardsViewController" bundle:nil];
//            [self.navigationController pushViewController:rewardsVC animated:YES];
//        }
//            break;
//        case 6:
//        {
//            //客服
//            ServiceViewController *serviceVC = [[ServiceViewController alloc]initWithNibName:@"ServiceViewController" bundle:nil];
//            [self.navigationController pushViewController:serviceVC animated:YES];
//        }
//            break;
//        default:
//            break;
//    }
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//}
//
//- (IBAction)didSettingClick:(id)sender {
//    SettingViewController *setVC = [[SettingViewController alloc]initWithNibName:@"SettingViewController" bundle:nil];
//    [self.navigationController pushViewController:setVC animated:YES];
//}
//
////- (void)viewWillAppear:(BOOL)animated {
////    [super viewWillAppear:animated];
////    [[NSNotificationCenter defaultCenter] postNotificationName:@"LQ_TabBarHidden" object:nil userInfo:@{@"TabBarHidden":@"YES"}];
////    //用户信息
//////    [self getDataServiveForUinfoAuthToken:[Toolkit getUserkey]];
////}
////
////- (void)viewWillDisappear:(BOOL)animated {
////    [super viewWillDisappear:YES];
////    [[NSNotificationCenter defaultCenter] postNotificationName:@"LQ_TabBarHidden" object:nil userInfo:@{@"TabBarHidden":@"NO"}];
////}
//#pragma mark - 用户信息 -
//-(void)getDataServiveForUinfoAuthToken:(NSString *)token
//{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    NSString *http_path = [NSString stringWithFormat:@"%@%@authToken=%@",http_Services,Get_Uinfo_URL,token];
//    
//    [manager GET:http_path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        //TODO:请求成功
//        if ([[responseObject valueForKey:@"Code"] integerValue] == 200) {
//            [self getdataUinfo:responseObject];
//            [self getDataUninfoServiveObjectDataSuccess];
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        //TODO:请求失败
//        [GMDCircleLoader hideFromView:self.view animated:YES];
//    }];
//}
//
//-(void)getDataUninfoServiveObjectDataSuccess {
//    self.priceArray = [[NSMutableArray alloc]init];
//    if ([[Toolkit getUserkey] isEqualToString:@""]) {
//        //未登录
//        [self.priceArray addObjectsFromArray:@[@"",@"",@""]];
//        
//    }else {
//        
////    [self.priceArray addObject:[Toolkit getUserInfoObjectForKey:User_balance]];
////    [self.priceArray addObject:[Toolkit getUserInfoObjectForKey:User_totalfan]];
////    [self.priceArray addObject:[Toolkit getUserInfoObjectForKey:User_qubi]];
//    }
//    
//    [self initTableHeaderView];
//}
//
//-(void)getdataUinfo:(id)responseObject {
//    id data = [responseObject valueForKey:@"Data"];
//    if(data != nil) {
//        //是否自动提现
////        [Toolkit saveUserInfoObject:[data valueForKey:@"autoWithDraw"] forKey:User_AutoWithDraw];
////         NSString* userLogo = [data valueForKey:@"userlogo"];
////        [Toolkit saveUserInfoObject:userLogo forKey:User_Picture];
////    }
////    //等级
////    if ([[[responseObject valueForKey:@"Data"] valueForKey:@"level"] isEqual:[NSNull null]]) {
////        [Toolkit saveUserInfoObject:@"0" forKey:User_Level];
////    }else{
////        [Toolkit saveUserInfoObject:[[[responseObject valueForKey:@"Data"] valueForKey:@"level"] stringValue] forKey:User_Level];
////    }
////    //支付宝
////    if ([[[responseObject valueForKey:@"Data"] valueForKey:@"alipay"] isEqual:[NSNull null]]) {
////        [Toolkit saveUserInfoObject:@"" forKey:User_Alipay];
////    }else{
////        [Toolkit saveUserInfoObject:[[responseObject valueForKey:@"Data"] valueForKey:@"alipay"] forKey:User_Alipay];
////    }
////    //手机号
////    if ([[[responseObject valueForKey:@"Data"] valueForKey:@"mobile"] isEqual:[NSNull null]]) {
////        [Toolkit saveUserInfoObject:@"" forKey:User_Mobile];
////    }else{
////        [Toolkit saveUserInfoObject:[[responseObject valueForKey:@"Data"] valueForKey:@"mobile"] forKey:User_Mobile];
////    }
////    //返利总金融
////    if ([[[responseObject valueForKey:@"Data"] valueForKey:@"totalfan"] isEqual:[NSNull null]]) {
////        [Toolkit saveUserInfoObject:@"" forKey:User_totalfan];
////    }else{
////        [Toolkit saveUserInfoObject:[[[responseObject valueForKey:@"Data"] valueForKey:@"totalfan"] stringValue] forKey:User_totalfan];
////    }
////    //返利总次数
////    if ([[[responseObject valueForKey:@"Data"] valueForKey:@"fancount"] isEqual:[NSNull null]]) {
////        [Toolkit saveUserInfoObject:@"0" forKey:User_Fancount];
////    }else{
////        [Toolkit saveUserInfoObject:[[[responseObject valueForKey:@"Data"] valueForKey:@"fancount"] stringValue] forKey:User_Fancount];
////    }
////    //总趣币数
////    if ([[[responseObject valueForKey:@"Data"] valueForKey:@"qubi"] isEqual:[NSNull null]]) {
////        [Toolkit saveUserInfoObject:@"0" forKey:User_qubi];
////    }else{
////        [Toolkit saveUserInfoObject:[[[responseObject valueForKey:@"Data"] valueForKey:@"qubi"] stringValue] forKey:User_qubi];
////    }
////    //账号余额（集分宝）
////    if ([[[responseObject valueForKey:@"Data"] valueForKey:@"balance"] isEqual:[NSNull null]]) {
////        [Toolkit saveUserInfoObject:@"0" forKey:User_balance];
////    }else{
////        [Toolkit saveUserInfoObject:[[[responseObject valueForKey:@"Data"] valueForKey:@"balance"] stringValue] forKey:User_balance];
////    }
////    //任务总奖励
////    if ([[[responseObject valueForKey:@"Data"] valueForKey:@"jobrewardqubi"] isEqual:[NSNull null]]) {
////        [Toolkit saveUserInfoObject:@"0" forKey:User_Totalqubi];
////    }else{
////        [Toolkit saveUserInfoObject:[[[responseObject valueForKey:@"Data"] valueForKey:@"jobrewardqubi"] stringValue] forKey:User_Totalqubi];
//    }
//}

- (IBAction)letterButton:(UIButton *)sender
{
    // 跳转到另一个界面
}
@end
