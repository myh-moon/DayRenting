//
//  MineViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MineViewController.h"
#import "AuthentyViewController.h"
#import "AuthentyDriverViewController.h"
#import "EditUserMessagesViewController.h"
#import "MyScoreListViewController.h"

#import "UIViewController+Blur.h"
#import "UIImage+Color.h"


//view
#import "MineUserScoreExchangeView.h"

//item
#import "MineUserMessageItem.h"
#import "MineUserItem.h"
#import "MineUserAuthenItem.h"
#import "MineUserScoreItem.h"
#import "SeperateItem.h"
#import "MineUserScoreMoreItem.h"

#import "UserResponse.h"
#import "UserModel.h"
#import "ScoreModel.h"

@interface MineViewController ()

@property (nonatomic,strong) NSMutableArray *scoreList;

@end

@implementation MineViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //设置导航条的字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:DPWhiteColor,NSFontAttributeName:DPFont6}];
    
    //设置导航栏颜色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x22242e)] forBarMetrics:UIBarMetricsDefault];
    
    //状态栏字体颜色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"会员中心";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftNavButton];
    [self.leftNavButton setImage:[UIImage imageNamed:@"back_white"] forState:0];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"编辑资料" forState:0];
    [self.rightNavButton setTitleColor:DPLightGrayColor14 forState:0];
    
    self.DPTableView.backgroundColor = DPWhiteColor;
    self.DPTableView.bounces = NO;
    
    self.DPManager[@"MineUserMessageItem"] = @"MineUserMessageCell";
    self.DPManager[@"MineUserItem"] = @"MineUserCell";
    self.DPManager[@"MineUserScoreItem"] = @"MineUserScoreCell";
    self.DPManager[@"MineUserAuthenItem"] = @"MineUserAuthenCell";
    self.DPManager[@"SeperateItem"] = @"SeperateCell";
    self.DPManager[@"MineUserScoreMoreItem"] = @"MineUserScoreMoreCell";

    
    [self setupMineTableViewWithUserModel:nil];
    
    [self getUserCenterMessages];
}

#pragma mark - init
- (NSMutableArray *)scoreList {
    if (!_scoreList) {
        _scoreList = [NSMutableArray array];
    }
    return _scoreList;
}

#pragma mark - method
- (void) setupMineTableViewWithUserModel:(UserModel *)model {
    
    [self.DPManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.DPManager addSection:section];
    
    DPWeakSelf;
    MineUserMessageItem *messageItem = [[MineUserMessageItem alloc] initWithUserModel:model];
    messageItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:messageItem];
    messageItem.didSelectedBtn = ^(NSInteger tag) {
        MyScoreListViewController *myScoreListVC = [[MyScoreListViewController alloc] init];
        [weakself.navigationController pushViewController:myScoreListVC animated:YES];
    };
    
    
    MineUserItem *authenTitleItem = [[MineUserItem alloc] init];
    authenTitleItem.selectionStyle = UITableViewCellSelectionStyleNone;
    authenTitleItem.backColor = DPWhiteColor;
    authenTitleItem.titleString = @"身份认证";
    authenTitleItem.cellHeight = 40;
    [section addItem:authenTitleItem];
    
    MineUserAuthenItem *authenItem = [[MineUserAuthenItem alloc] initWithUserModel:model];
    authenItem.selectionStyle= UITableViewCellSelectionStyleNone;
    [section addItem:authenItem];
    authenItem.didSelectedBtn = ^(NSInteger tag) {
        if (tag == 576) {
            //身份认证
            AuthentyViewController *authentyVC = [[AuthentyViewController alloc] init];
            [weakself.navigationController pushViewController:authentyVC animated:YES];
        }else{
            //驾照认证
            AuthentyDriverViewController *authentyDriverVC = [[AuthentyDriverViewController alloc] init];
            [weakself.navigationController pushViewController:authentyDriverVC animated:YES];
        }
    };
    
    MineUserItem *scoreTitleItem = [[MineUserItem alloc] init];
    scoreTitleItem.selectionStyle = UITableViewCellSelectionStyleNone;
    scoreTitleItem.backColor = DPBackGroundColor;
    scoreTitleItem.titleString = @"积分兑换";
    scoreTitleItem.cellHeight = 60;
    [section addItem:scoreTitleItem];
    
    for (NSInteger i = 0; i < [model.ticketlist count] ; i++) {
        
        ScoreModel *scoreModel = model.ticketlist[i];
        
        MineUserScoreItem *scoreItem = [[MineUserScoreItem alloc] initWithScoreModel:scoreModel];
        scoreItem.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:scoreItem];
        scoreItem.selectionHandler = ^(id item) {
            [weakself showScoreExchangeViewWithModel:scoreModel WithUserScore:model.socre];
        };
    }
    
    MineUserScoreMoreItem *moreItem = [[MineUserScoreMoreItem alloc] init];
    moreItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:moreItem];
}

- (void)addRightNavAction {
    EditUserMessagesViewController *editUserMessagesVC = [[EditUserMessagesViewController alloc] init];
    [self.navigationController pushViewController:editUserMessagesVC animated:YES];
}

- (void) getUserCenterMessages {
    NSString *centerString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyUserCenterMessages,DPToken];
    
    DPWeakSelf;
    [self requestDataGetWithString:centerString params:nil successBlock:^(id responseObject) {
        
        UserResponse *response = [UserResponse mj_objectWithKeyValues:responseObject];
        
        if ([response.status isEqualToString:@"200"]) {
            [weakself setupMineTableViewWithUserModel:response.data];
            [weakself.DPTableView reloadData];
        }
        
    } andFailBlock:^(NSError *error) {
        
    }];
}



- (void) showScoreExchangeViewWithModel:(ScoreModel *)model WithUserScore:(NSString *)userScore{
    [self hiddenBlurView];
    
    UIView *tagView  = [self.view viewWithTag:9999];
    MineUserScoreExchangeView *scoreExchangeView = [self.view viewWithTag:9998];
    
    if (!tagView) {
        tagView = [UIView newAutoLayoutView];
        tagView.tag = 9999;
        tagView.backgroundColor = UIColorFromRGB1(0x000000, 0.5);
        
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        [window addSubview:tagView];
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        scoreExchangeView = [MineUserScoreExchangeView newAutoLayoutView];
        [tagView addSubview:scoreExchangeView];
        [scoreExchangeView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [scoreExchangeView autoSetDimension:ALDimensionHeight toSize:340];
        [scoreExchangeView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
        [scoreExchangeView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
        
        //信息显示
        NSString *w1 = [NSString stringWithFormat:@"%@元租车抵用券\n",model.money];
        NSString *w2 = [NSString stringWithFormat:@"%@积分",model.score];
        scoreExchangeView.scoreLabel.attributedText = [NSString setAttributeOfFirstString:w1 firstFont:DPFont4 firstColor:DPDarkGrayColor secondString:w2 secondFont:DPFont4 secondColor:DPOrangeColor align:1 space:DPSmallSpacing];
        scoreExchangeView.ruleLabel.text = [NSString stringWithFormat:@"使用规则：订单实付金额需满%@元",model.norm];;
        
        if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
            UIControl *tapControl1 = [UIControl newAutoLayoutView];
            [tagView addSubview:tapControl1];
            [tapControl1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
            [tapControl1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:scoreExchangeView];
            [tapControl1 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
            
            UIControl *tapControl2 = [UIControl newAutoLayoutView];
            [tagView addSubview:tapControl2];
            [tapControl2 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
            [tapControl2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:scoreExchangeView];
            [tapControl2 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    DPWeakSelf;
    [scoreExchangeView setDidSelectedBtn:^(NSInteger tag) {
        if (tag == 456) {
            [weakself hiddenBlurView];
        }else if (tag == 457){

            if ([model.score integerValue] <= [userScore integerValue]) {//积分兑换
                [weakself confirmToExchangeScoreWithModel:model];
            }else{ //积分不足
                [scoreExchangeView.exchangeButton setTitle:@"积分不足，无法兑换" forState:0];
                [scoreExchangeView.exchangeButton setTitleColor:DPLightGrayColor17 forState:0];
                scoreExchangeView.exchangeButton.backgroundColor = UIColorFromRGB(0xeef1f3);
            }
        }
    }];
}

- (void)hiddenBlurView {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIView *tagView = [window viewWithTag:9999];
    if (tagView) {
        [tagView removeFromSuperview];
    }
}

- (void) confirmToExchangeScoreWithModel:(ScoreModel *)model {
    NSString *exchangeString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyUserCenterOfScoreExchange,DPToken];
    
    NSDictionary *params = @{@"tid" : model.ID,@"type" : @"1"};
    
    DPWeakSelf;
    [self requestDataPostWithString:exchangeString params:params successBlock:^(id responseObject) {
        
        BaseModel *baseModel = [BaseModel mj_objectWithKeyValues:responseObject];
        if ([baseModel.status isEqualToString:@"200"]) {
            [weakself showScoreExchangeViewInView:weakself.view withMoney:model.money finishBlock:^(NSString *unlock) {
                
                if ([unlock isEqualToString:@"关闭"]) {
                    [weakself getUserCenterMessages];
                }else if ([unlock isEqualToString:@"现在用车"]) {
                    [weakself.navigationController popViewControllerAnimated:YES];
                }
            }];
        }else{
            [weakself showHint:baseModel.info];
        }
    } andFailBlock:^(NSError *error) {
        
    }];
}

- (void)addLeftNavAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
