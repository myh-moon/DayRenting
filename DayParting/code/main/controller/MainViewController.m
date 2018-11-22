//
//  MainViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/14.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainViewController.h"

#import <CommonCrypto/CommonDigest.h>

#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import <MapKit/MapKit.h>
#import <AMapNaviKit/AMapNaviKit.h>
#import <WXApi.h>
#import <WXApiObject.h>
#import "UIViewController+Blur.h"

#import "OrderGenerateViewController.h"  //下订单
#import "OrderResultViewController.h"  //预约详情
#import "CarReturnViewController.h"   //选择还车点
#import "ChooseTicketViewController.h"  //选择优惠券
#import "MyGrantViewController.h"  //授权免押
#import "MyCardViewController.h" //信用卡免押
#import "MyDepositViewController.h" //去交押金
#import "OrderResultQuestionViewController.h" //测试测试
#import "ResetPayViewController.h"  //设置余额支付密码
#import "MyOrderDetailQuestionViewController.h" //订单疑问

/*****     用户中心      *******/
#import "AuthentyViewController.h"  //身份认证
#import "LoginViewController.h" //登录
#import "MyWalletListViewController.h" //我的钱包
#import "MySettingViewController.h" //设置
#import "MyBreakViewController.h" //我的违章
#import "MineViewController.h"  //用户中心
#import "MyOrderViewController.h"  //我的订单

#import "MainUpCarView.h"  //可用车列表
#import "MainUpCarDetailView.h" //详情
#import "MainAuthentyView.h"  //认证
#import "MainOrderRemindView.h"  //有订单的提醒
#import "MianOrderRemindReturnView.h"//还车提醒
#import "MainOrderRemindPayView.h" //支付提醒

//订单详情
#import "CarStatusView.h"  //订单状态
#import "CarServiceView.h"
#import "CarMessageView.h"
#import "CarOperationView.h"  //操作
#import "CarReturnView.h"
#import "CarPaymentView.h"//付款
#import "MainOrderRemindPayPWDView.h" //密码输入框
#import "MapAreaImageView.h"
//标注
#import "CustomAnnotationView.h"
#import "MANaviRoute.h"

#import "MainUserHeaderItem.h"
#import "MainUserTypeItem.h"

//model
#import "CarListResponse.h"
#import "CarListModel.h"
#import "CarDetailModel.h"
#import "CheckModel.h"

#import "AvailableOrderResponse.h"
#import "AvailableOrderModel.h"

//annotion
#import "AnnotionResponse.h"
#import "AnnotionModel.h"

//user center
#import "UserResponse.h"
#import "UserModel.h"

//优惠券
#import "TicketModel.h"

//wechat
#import "WechatModel.h"
#import "PasswordModel.h"

@interface MainViewController ()<MAMapViewDelegate,AMapSearchDelegate,AMapNaviWalkViewDelegate>

#pragma mark - 地图基础视图
@property (nonatomic,strong) UIButton *customButton; //客服电话按钮
@property (nonatomic,strong) UIButton *positionButton; //定位按钮
@property (nonatomic,strong) UIButton *nowUseCarButton; //现在用车按钮
@property (nonatomic, strong) UIImageView *centerAnnotationView; //地图中心点pin
@property (nonatomic,strong) MapAreaImageView *mapAreaView; //地图最下方的安全区域
@property (nonatomic,strong) NSLayoutConstraint *bottomButtonConstraints;  //按钮距离屏幕底部的距离

@property (nonatomic,strong) MAMapView *mainMapView;
@property (nonatomic,strong) MAUserLocationRepresentation *mainRepresentation;  // 用户当前定位的显示

//标注
@property (nonatomic,strong) NSMutableArray *annotionArray;

@property (nonatomic,strong) MainUpCarView *mainUpCarView;  // 可用车辆列表
@property (nonatomic,strong) MainUpCarDetailView *mainUpCarDetailView;  // 可用车辆详情

@property (nonatomic,strong) MainAuthentyView *mainAuthentyView;  //认证弹出框

//有订单时的弹出框
@property (nonatomic,strong) MainOrderRemindView *mainOrderRemindWantView;  //取车
@property (nonatomic,strong) UIButton *mainOrderRemindUseView;  //取车
@property (nonatomic,strong) MianOrderRemindReturnView *mainOrderRemindReturnView;
@property (nonatomic,strong) MainOrderRemindPayView *mainOrderRemindPayView;  //付款提醒
@property (nonatomic,strong) NSTimer *orderTimer;
@property (nonatomic,strong) NSMutableArray *currentArray;  //当前最新的有效订单

@property (nonatomic,strong) NSString *changeHCAddress;  //是否更改了还车点
@property (nonatomic,strong) NSString *hckm;  //更改了还车点之后需要计算hckm
@property (nonatomic,strong) TicketModel *chooseTicketModel;  //优惠券

//订单详情
@property (nonatomic,strong) CarStatusView *carStatusView;  //订单状态信息
@property (nonatomic,strong) CarServiceView *carServiceView;
@property (nonatomic,strong) CarMessageView *carMessageView;
@property (nonatomic,strong) CarOperationView *carOperationView;
@property (nonatomic,strong) CarReturnView *carReturnView;
@property (nonatomic,strong) CarPaymentView *carPayView; //支付信息

@property (nonatomic,strong) NSMutableArray *carArray;  //车辆详情数组
@property (nonatomic,strong) NSString *balanceString; //是否使用余额支付


//路线规划测试
@property (nonatomic,strong) AMapRoute *route;
@property (nonatomic,strong) AMapSearchAPI *search;
@property (nonatomic,assign) CLLocationCoordinate2D userLocationCoordinate2D;//用户
@property (assign, nonatomic) CLLocationCoordinate2D startCoordinate; //起始
@property (assign, nonatomic) CLLocationCoordinate2D destinationCoordinate; //终点
@property (strong, nonatomic) MANaviRoute * naviRoute;  //用于显示当前路线方案.
@property (strong, nonatomic) MAPointAnnotation *startAnnotation;
@property (strong, nonatomic) MAPointAnnotation *destinationAnnotation;

@end

@implementation MainViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //标记地图中心点
    [self initCenterView];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    //去除导航栏下方的横线
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init]
                                                  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    
//    NSString *authenty = [[NSUserDefaults standardUserDefaults] objectForKey:@"authenty"];
//    if ([authenty isEqualToString:@"0"]) {//未认证
//        [self.view addSubview:self.mainAuthentyView];
//
//        //认证
//        [self.mainAuthentyView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
//        [self.mainAuthentyView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
//        [self.mainAuthentyView autoPinToTopLayoutGuideOfViewController:self withInset:DPMiddleSpacing];
//        [self.mainAuthentyView autoSetDimension:ALDimensionHeight toSize:48];
//
//    }else{//已认证
//        [self.mainAuthentyView removeFromSuperview];
//
//    }
    
    [self getAvailableOrder];
}

-(void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.mainUpCarView removeFromSuperview];
    [self.mainUpCarDetailView removeFromSuperview];
    
    [self.mainOrderRemindWantView removeFromSuperview];
    [self.mainOrderRemindUseView removeFromSuperview];
    [self.mainOrderRemindReturnView removeFromSuperview];
    [self.mainOrderRemindPayView removeFromSuperview];
    
    [self.carStatusView removeFromSuperview];
    [self.carServiceView removeFromSuperview];
    [self.carMessageView removeFromSuperview];
    [self.carReturnView removeFromSuperview];
    [self.carPayView removeFromSuperview];
    [self.carOperationView removeFromSuperview];
    
    [_orderTimer invalidate];
    _orderTimer = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftNavButton];
    [self.leftNavButton setImage:[UIImage imageNamed:@"menu"] forState:0];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setImage:[UIImage imageNamed:@"message"] forState:0];
    
    //add view
    [self.view addSubview:self.mainMapView];
    [self.view addSubview:self.customButton];
    [self.view addSubview:self.positionButton];
    [self.view addSubview:self.nowUseCarButton];
    [self.view addSubview:self.mapAreaView];
    
    [self.view setNeedsUpdateConstraints];
    
    
    if (IS_IPHONE_X) {
        self.bottomButtonConstraints = [self.customButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:38+DangerArea];
    }else{
        self.bottomButtonConstraints = [self.customButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:38];
    }
    
    //是否安装微信
    if ([WXApi isWXAppSupportApi]) {
    //监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getOrderPayResult:) name:@"ZJPay" object:nil];
    }
}

#pragma mark - init view
- (MAMapView *)mainMapView {
    if (!_mainMapView) {
        _mainMapView = [MAMapView newAutoLayoutView];
        _mainMapView.mapType = MAMapTypeNavi;
        _mainMapView.delegate = self;
        _mainMapView.showsUserLocation = YES;   //是否显示用户位置
        _mainMapView.userTrackingMode = 2;          //定位用户位置的模式
        _mainMapView.rotationDegree = 0;               //设置地图旋转角度
        _mainMapView.rotateEnabled = NO;               ///是否支持旋转
        _mainMapView.rotateCameraEnabled = NO;      //是否支持camera旋转(倾斜)
        _mainMapView.maxZoomLevel = 19;
        _mainMapView.minZoomLevel = 3;
        _mainMapView.showsScale = NO;               //是否显示比例尺,
        _mainMapView.showsCompass = NO;         //是否显示指南针
        [_mainMapView updateUserLocationRepresentation:self.mainRepresentation];
        _mainMapView.showsBuildings = NO;  //不显示3D楼块接口。
        [AMapServices sharedServices].enableHTTPS = YES;
        
        //隐藏左下角“高德地图”字样
        [_mainMapView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView * logoM = obj;
                logoM.layer.contents = (__bridge id)[UIImage imageNamed:@""].CGImage;
            }
        }];
    }
    return _mainMapView;
}

//客服电话
- (UIButton *)customButton {
    if (!_customButton) {
        _customButton = [UIButton newAutoLayoutView];
        _customButton.layer.cornerRadius = 20.5;
        _customButton.backgroundColor = DPWhiteColor;
        [_customButton setImage:[UIImage imageNamed:@"telephone"] forState:0];
        
        _customButton.layer.shadowColor = DPBlackColor.CGColor;
        _customButton.layer.shadowOpacity = 0.08;
        _customButton.layer.shadowOffset = CGSizeMake(3, 3);
        _customButton.layer.shadowRadius = 5;
        
        DPWeakSelf;
        [_customButton addAction:^(UIButton *btn) {
//            NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"是否拨打客服电话\ntelprompt://%@",@"13162521916"];
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
            
            NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"10086"];
            UIWebView * callWebview = [[UIWebView alloc] init];
            [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
            [weakself.view addSubview:callWebview];
        }];
    }
    return _customButton;
}
//定位
- (UIButton *)positionButton {
    if (!_positionButton) {
        _positionButton = [UIButton newAutoLayoutView];
        _positionButton.layer.cornerRadius = 20.5;
        _positionButton.backgroundColor = DPWhiteColor;
        [_positionButton setImage:[UIImage imageNamed:@"location"] forState:0];
        
        _positionButton.layer.shadowColor = DPBlackColor.CGColor;
        _positionButton.layer.shadowOpacity = 0.08;
        _positionButton.layer.shadowOffset = CGSizeMake(3, 3);
        _positionButton.layer.shadowRadius = 5;
        
        DPWeakSelf;
        [_positionButton addAction:^(UIButton *btn) {
            weakself.mainMapView.centerCoordinate = weakself.mainMapView.userLocation.location.coordinate;
            
        }];
    }
    return _positionButton;
}

- (UIButton *)nowUseCarButton {
    if (!_nowUseCarButton) {
        _nowUseCarButton = [UIButton newAutoLayoutView];
        [_nowUseCarButton setTitle:@"现在用车" forState:0];
        [_nowUseCarButton setTitleColor:DPBlueColor forState:0];
        _nowUseCarButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
//        DPFont7;
        _nowUseCarButton.backgroundColor = DPWhiteColor;
        _nowUseCarButton.layer.cornerRadius = 25;
        
        _nowUseCarButton.layer.shadowColor = DPBlackColor.CGColor;
        _nowUseCarButton.layer.shadowOpacity = 0.08;
        _nowUseCarButton.layer.shadowOffset = CGSizeMake(3, 3);
        _nowUseCarButton.layer.shadowRadius = 5;
        
        _nowUseCarButton.layer.borderColor = DPBackGroundColor.CGColor;
        _nowUseCarButton.layer.borderWidth = 2;
        
        DPWeakSelf;
        [_nowUseCarButton addAction:^(UIButton *btn) {
            [weakself nowToFindTheNearestPoint];
        }];
    }
    return _nowUseCarButton;
}

- (MapAreaImageView *)mapAreaView {
    if (!_mapAreaView) {
        _mapAreaView = [MapAreaImageView newAutoLayoutView];
    }
    return _mapAreaView;
}

//- (AMapSearchAPI *)search {
//    if (!_search) {
//        _search = [[AMapSearchAPI alloc] init];
//        _search.delegate = self;
//    }
//    return _search;
//}

- (MAUserLocationRepresentation *)mainRepresentation {
    if (!_mainRepresentation) {
        //用户位置显示样式控制
        _mainRepresentation = [[MAUserLocationRepresentation alloc] init];
        _mainRepresentation.showsAccuracyRing = NO; //不显示精度圈
    }
    return _mainRepresentation;
}

- (MainAuthentyView *)mainAuthentyView {
    if (!_mainAuthentyView) {
        _mainAuthentyView = [MainAuthentyView newAutoLayoutView];

        DPWeakSelf;
        _mainAuthentyView.didSelectedBtn = ^(NSInteger tag) {
            [weakself showHint:@"去认证"];
            AuthentyViewController *authentyVC = [[AuthentyViewController alloc] init];
            [weakself.navigationController pushViewController:authentyVC animated:YES];
            
        };
    }
    return _mainAuthentyView;
}

//提示框
- (MainOrderRemindView *)mainOrderRemindWantView {
    if (!_mainOrderRemindWantView) {
        _mainOrderRemindWantView = [MainOrderRemindView newAutoLayoutView];
        
        DPWeakSelf;
        [_mainOrderRemindWantView addAction:^(UIButton *btn) {
            OrderResultViewController *orderResultVC = [[OrderResultViewController alloc] init];
            orderResultVC.direction = @"2";
            orderResultVC.userCoordinate = weakself.userLocationCoordinate2D;
            [weakself.navigationController pushViewController:orderResultVC animated:YES];
        }];
    }
    return _mainOrderRemindWantView;
}

- (UIButton *)mainOrderRemindUseView {
    if (!_mainOrderRemindUseView) {
        _mainOrderRemindUseView = [UIButton newAutoLayoutView];
        _mainOrderRemindUseView.backgroundColor = DPWhiteColor;
        _mainOrderRemindUseView.layer.cornerRadius = 6;
        _mainOrderRemindUseView.layer.masksToBounds = YES;
        
        [_mainOrderRemindUseView setTitleColor:DPDarkGrayColor forState:0];
        [_mainOrderRemindUseView setTitle:@"  车辆已开锁完成，将开始计费" forState:0];
        _mainOrderRemindUseView.titleLabel.font = DPFont3;
        [_mainOrderRemindUseView setImage:[UIImage imageNamed:@"car_return"] forState:0];
        
        _mainOrderRemindUseView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _mainOrderRemindUseView.contentEdgeInsets = UIEdgeInsetsMake(0, DPMiddleSpacing, 0, 0);
    }
    return _mainOrderRemindUseView;
}

- (MianOrderRemindReturnView *)mainOrderRemindReturnView {
    if (!_mainOrderRemindReturnView) {
        _mainOrderRemindReturnView = [MianOrderRemindReturnView newAutoLayoutView];
        
        DPWeakSelf;
        _mainOrderRemindReturnView.didSelectedBtn = ^(NSInteger tag) {
            
            CarReturnViewController *carReturnVC = [[CarReturnViewController alloc] init];
            carReturnVC.direction = @"2";
            AvailableOrderModel *model = weakself.currentArray[0];
            carReturnVC.oid = model.oid;
            carReturnVC.userCoordinate = weakself.userLocationCoordinate2D;
            [weakself.navigationController pushViewController:carReturnVC animated:YES];

            carReturnVC.didSelectedCell = ^(CarReturnModel *returnModel) {
                weakself.changeHCAddress = @"1";
                
                [weakself.mainMapView removeAnnotation:weakself.startAnnotation];
                [weakself.mainMapView removeAnnotation:weakself.destinationAnnotation];

                weakself.startCoordinate = weakself.userLocationCoordinate2D;
                weakself.destinationCoordinate = CLLocationCoordinate2DMake([returnModel.lat floatValue], [returnModel.lng floatValue]);
                [weakself startRoutePlanning];
            };
        };
    }
    return _mainOrderRemindReturnView;
}

- (MainOrderRemindPayView *)mainOrderRemindPayView {
    if (!_mainOrderRemindPayView) {
        _mainOrderRemindPayView = [MainOrderRemindPayView newAutoLayoutView];
        
        DPWeakSelf;
        _mainOrderRemindPayView.didSelectedBtn = ^(NSInteger tag) {
            if (tag == 57) {
                [weakself showHint:@"去支付"];
            }
        };
    }
    return _mainOrderRemindPayView;
}

- (MainUpCarView *)mainUpCarView {
    if (!_mainUpCarView) {
        _mainUpCarView = [MainUpCarView newAutoLayoutView];
        
        DPWeakSelf;
        //cell
        _mainUpCarView.didSelectedCell = ^(NSString *idd) {//进入详情
            [weakself getCarDetailsWithCarId:idd];
        };
    }
    return _mainUpCarView;
}

- (MainUpCarDetailView *)mainUpCarDetailView {
    if (!_mainUpCarDetailView) {
        _mainUpCarDetailView = [MainUpCarDetailView newAutoLayoutView];
        
        DPWeakSelf;
        _mainUpCarDetailView.didSelectedBtn = ^(NSInteger tag) {
            if (tag == 22) {//关闭
                [weakself.mainUpCarDetailView removeFromSuperview];
                
                [weakself.view addSubview:weakself.mainUpCarView];
                
                if (IS_IPHONE_X) {
                    weakself.bottomButtonConstraints.constant = -280 - DPBigSpacing - DangerArea;
                }else{
                    weakself.bottomButtonConstraints.constant = -280 - DPBigSpacing;
                }
                
                [weakself.mainUpCarView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, DPMiddleSpacing, 0, DPMiddleSpacing) excludingEdge:ALEdgeTop];
                [weakself.mainUpCarView autoSetDimension:ALDimensionHeight toSize:280];
                
            }else if (tag == 23){//立即预订

#pragma mark - edit
                NSString *dddd = DPToken;
                if (!dddd) {
                    [weakself showHint:@"请先登录"];
                }else{
                    [weakself.mainUpCarView removeFromSuperview];
                    
                    [weakself checkUserIfToDeposit];
                }
            }
        };
    }
    return _mainUpCarDetailView;
}

- (CarStatusView *)carStatusView {
    if (!_carStatusView) {
        _carStatusView = [CarStatusView newAutoLayoutView];
    }
    return _carStatusView;
}

- (CarServiceView *)carServiceView {
    if (!_carServiceView) {
        _carServiceView = [CarServiceView newAutoLayoutView];
    }
    return _carServiceView;
}

- (CarMessageView *)carMessageView {
    if (!_carMessageView) {
        _carMessageView = [CarMessageView newAutoLayoutView];
    }
    return _carMessageView;
}

- (CarOperationView *)carOperationView {
    if (!_carOperationView) {
        _carOperationView = [CarOperationView newAutoLayoutView];
    }
    return _carOperationView;
}

- (CarReturnView *)carReturnView {
    if (!_carReturnView) {
        _carReturnView = [CarReturnView newAutoLayoutView];
    }
    return _carReturnView;
}

- (CarPaymentView *)carPayView {
    if (!_carPayView) {
        _carPayView = [CarPaymentView newAutoLayoutView];
    }
    return _carPayView;
}

- (NSMutableArray *)carArray {
    if (!_carArray) {
        _carArray = [NSMutableArray new];
    }
    return _carArray;
}

- (NSMutableArray *)currentArray {
    if (!_currentArray) {
        _currentArray = [NSMutableArray array];
    }
    return _currentArray;
}

- (NSMutableArray *)annotionArray {
    if (!_annotionArray) {
        _annotionArray = [NSMutableArray array];
    }
    return _annotionArray;
}

#pragma mark - method
- (void)layoutConstraints {
    
    //地图
    [self.mainMapView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.mainMapView autoPinToTopLayoutGuideOfViewController:self withInset:0];
    
    NSArray *views = @[self.customButton,self.positionButton];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [views autoSetViewsDimensionsToSize:CGSizeMake(41, 41)];

    [self.customButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];

    [self.positionButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];

    [self.nowUseCarButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.customButton];
    [self.nowUseCarButton autoSetDimensionsToSize:CGSizeMake(200, 50)];
    [self.nowUseCarButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.mapAreaView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    if (IS_IPHONE_X) {
        [self.mapAreaView autoSetDimension:ALDimensionHeight toSize:38+DangerArea];
    }else{
        [self.mapAreaView autoSetDimension:ALDimensionHeight toSize:38];
    }
}

#pragma mark - show user center
- (void)addLeftNavAction:(UIButton *)sender {
    [self getUserCenterMessagesOfMain];
}

#pragma mark - UINavigationControllerDelegate
// 将要显示控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];

    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}

- (void)addRightNavAction {
//    [self showHint:@"消息"];
//
//    OrderResultQuestionViewController *BHBHB = [[OrderResultQuestionViewController alloc] init];
//    BHBHB.oid = @"121212";
//    BHBHB.condition = 1;
//    [self.navigationController pushViewController:BHBHB animated:YES];
//    [self actionAddAnnotation];
}

//标记地图中心位置
- (void) initCenterView {
    self.centerAnnotationView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pin"]];
    self.centerAnnotationView.center = CGPointMake(self.mainMapView.center.x, self.mainMapView.center.y - CGRectGetHeight(self.centerAnnotationView.bounds) / 2);
    
    [self.mainMapView addSubview:self.centerAnnotationView];
}

#pragma mark - car message - request process
//未完成的订单
- (void) getAvailableOrder {
    NSString *availableOrderString = [NSString stringWithFormat:@"%@%@/%@/%f/%f",DPBaseUrl,DPCarOfAvailableMessage,DPToken,self.userLocationCoordinate2D.latitude,self.userLocationCoordinate2D.longitude];
    
    NSDictionary *params = @{
                             @"ticketid" : self.chooseTicketModel.ID ? self.chooseTicketModel.ID : @"",
                             @"balance" : self.balanceString ?  self.balanceString : @"0"
                             };
    
    DPWeakSelf;
    [self requestDataPostWithString:availableOrderString params:params successBlock:^(id responseObject) {
        
        AvailableOrderResponse *response = [AvailableOrderResponse mj_objectWithKeyValues:responseObject];
        
        if ([response.status isEqualToString:@"200"]) {
            
            if (response.data) {//有订单
                AvailableOrderModel *availableModel = response.data;
                
                [weakself.currentArray addObject:availableModel];
                
                //订单详情显示
                NSInteger orderTag = [availableModel.status integerValue];
                [weakself showCarDetailMessagesWithOrderTag:orderTag andOrderModel:availableModel];
                
                //去掉多余的标注
                [weakself.mainMapView removeAnnotations:weakself.annotionArray];
                
                //显示路线规划
                weakself.startCoordinate = weakself.userLocationCoordinate2D;
                weakself.destinationCoordinate = CLLocationCoordinate2DMake([response.data.lat floatValue], [response.data.lng floatValue]);
                [self startRoutePlanning];
                
            }else{
                [weakself getAllAnnotion];
                [weakself.nowUseCarButton setHidden:NO];
            }
        }
    } andFailBlock:^(NSError *error) {
        
    }];
}

//获取所有气泡标注
- (void) getAllAnnotion {
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.validatesDomainName = NO;
    securityPolicy.allowInvalidCertificates = YES;
    session.securityPolicy = securityPolicy;

    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    //    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/htDP", nil];
    
    //设置超时时间
    [session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    session.requestSerializer.timeoutInterval = 5.f;
    [session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    NSString *annotionString = [NSString stringWithFormat:@"%@%@",DPBaseUrl,DPAnnotionList];

    DPWeakSelf;
    [session GET:annotionString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        AnnotionResponse *response = [AnnotionResponse mj_objectWithKeyValues:responseObject];
        
        if ([response.status isEqualToString:@"200"]) {
            
            [weakself.annotionArray removeAllObjects];
            
            for (AnnotionModel *model in response.parklist) {
                
                MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
                pointAnnotation.coordinate = CLLocationCoordinate2DMake([model.lat floatValue], [model.lng floatValue]);
                pointAnnotation.title = model.num;
                [weakself.annotionArray addObject:pointAnnotation];
                
            }
            
            //添加标注
            [weakself.mainMapView addAnnotations:weakself.annotionArray];
            [weakself.mainMapView showAnnotations:weakself.annotionArray edgePadding:UIEdgeInsetsMake(20, 20, 20, 80) animated:YES];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void) getAvailablaCarListWithCoordinate:(CLLocationCoordinate2D )coordinate {
    
    NSString *carList = [NSString stringWithFormat:@"%@%@/%@/%@/%f/%f",DPBaseUrl,DPCarList,@"1",@"1",coordinate.longitude,coordinate.latitude];
    
    DPWeakSelf;
    [self requestDataGetWithString:carList params:nil successBlock:^(id responseObject) {
       
        CarListResponse *response = [CarListResponse mj_objectWithKeyValues:responseObject];
        
        if ([response.status isEqualToString:@"200"]) {
            
            [weakself.nowUseCarButton setHidden:YES];
            if (IS_IPHONE_X) {
                weakself.bottomButtonConstraints.constant = -280 - DPBigSpacing - DangerArea;
            }else{
                weakself.bottomButtonConstraints.constant = -280 - DPBigSpacing;
            }
            
            [weakself.mainUpCarView removeFromSuperview];
            
            [weakself.view addSubview:self.mainUpCarView];
            [weakself.mainUpCarView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.customButton withOffset:DPMiddleSpacing];
            [weakself.mainUpCarView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
            [weakself.mainUpCarView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
            [weakself.mainUpCarView autoSetDimension:ALDimensionHeight toSize:280];
            
            //数据
            weakself.mainUpCarView.carListResponse = response;
            
            [weakself.mainUpCarView setupMainUpCarView];
            [weakself.mainUpCarView.mainUpCarTableView reloadData];
            
            weakself.mainUpCarView.didSelectedBtn = ^(NSInteger tag) {
                [weakself doNavigationWithEndLocation:@[response.lat,response.lng]];
            };
        }
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

//列表单个详情
- (void) getCarDetailsWithCarId:(NSString *)carID {
    NSString *detail = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPCarDetails,carID];
    
    DPWeakSelf;
    [self requestDataGetWithString:detail params:nil successBlock:^(id responseObject) {
        
        CarDetailModel *carDetailModel = [CarDetailModel mj_objectWithKeyValues:responseObject];
        if ([carDetailModel.status isEqualToString:@"200"]) {
            
            [weakself.carArray removeAllObjects];
            
            if (IS_IPHONE_X) {
                weakself.bottomButtonConstraints.constant = - 470 - DPBigSpacing - DangerArea;
            }else{
                weakself.bottomButtonConstraints.constant = - 470 - DPBigSpacing;
            }
            
            [weakself.view addSubview:weakself.mainUpCarDetailView];
            
            [weakself.mainUpCarDetailView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.customButton withOffset:DPMiddleSpacing];
            [weakself.mainUpCarDetailView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
            [weakself.mainUpCarDetailView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
            [weakself.mainUpCarDetailView autoSetDimension:ALDimensionHeight toSize:470];
            
            weakself.mainUpCarDetailView.carDetailModel = carDetailModel.carinfo;
            
            [weakself.mainUpCarDetailView setupMainUpCarDetailView];
            [weakself.mainUpCarDetailView.mainUpCarDetailTableView reloadData];

            [weakself.carArray addObject:carDetailModel.carinfo];
            
        }
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

//现在用车 -- 获取最近的点
- (void) nowToFindTheNearestPoint {
    NSString *nearestStr = [NSString stringWithFormat:@"%@%@/%f/%f",DPBaseUrl,DPCarOfNearestPoint,self.userLocationCoordinate2D.longitude,self.userLocationCoordinate2D.latitude];
    
    DPWeakSelf;
    [self requestDataGetWithString:nearestStr params:nil successBlock:^(id responseObject) {
    
        CarListResponse *response = [CarListResponse mj_objectWithKeyValues:responseObject];
        
        if ([response.status isEqualToString:@"200"]) {
            
            [weakself getAvailablaCarListWithCoordinate:CLLocationCoordinate2DMake([response.data.lat floatValue], [response.data.lng floatValue])];
        }
    } andFailBlock:^(NSError *error) {
        
    }];
    
}

//订单详情
- (void) showCarDetailMessagesWithOrderTag:(NSInteger)tag andOrderModel:(AvailableOrderModel *)orderModel{
    
    //“现在用车”按钮消失（该按钮只在没有未完成订单的时候出现）
    [self.nowUseCarButton setHidden:YES];
    
    [self.mainUpCarView removeFromSuperview];
    [self.mainUpCarDetailView removeFromSuperview];
    
    [self.mainOrderRemindWantView removeFromSuperview];
    [self.mainOrderRemindUseView removeFromSuperview];
    [self.mainOrderRemindReturnView removeFromSuperview];
    [self.mainOrderRemindPayView removeFromSuperview];
    
    [self.carStatusView removeFromSuperview];
    [self.carServiceView removeFromSuperview];
    [self.carMessageView removeFromSuperview];
    [self.carReturnView removeFromSuperview];
    [self.carPayView removeFromSuperview];
    [self.carOperationView removeFromSuperview];
    
    DPWeakSelf;
    if (tag == 0) {//预定成功，去取车

        //顶部有订单的提醒
        [self.view addSubview:self.mainOrderRemindWantView];
        [self.mainOrderRemindWantView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        [self.mainOrderRemindWantView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.mainOrderRemindWantView autoPinToTopLayoutGuideOfViewController:self withInset:DPMiddleSpacing];
        [self.mainOrderRemindWantView autoSetDimension:ALDimensionHeight toSize:70];
        
        //底部有订单详情
        [self.view addSubview:self.carStatusView];
        [self.view addSubview:self.carServiceView];
        
        if (IS_IPHONE_X) {
            self.bottomButtonConstraints.constant = -60-80-DPMiddleSpacing*2 - DangerArea;
        }else{
            self.bottomButtonConstraints.constant = -60-80-DPMiddleSpacing*2;
        }
        
        [self.carStatusView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPBigSpacing];
        [self.carStatusView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPBigSpacing];
        [self.carStatusView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.customButton withOffset:DPMiddleSpacing];
        [self.carStatusView autoSetDimension:ALDimensionHeight toSize:60];
        
        [self.carServiceView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.carStatusView];
        [self.carServiceView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        [self.carServiceView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.carServiceView autoSetDimension:ALDimensionHeight toSize:80];
        
        //remind内容
        //倒计时
        _orderTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTheCountDownWithTime) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_orderTimer forMode:NSRunLoopCommonModes];
    
        NSString *name = [NSString stringWithFormat:@"%@ %@\n",orderModel.car_code,orderModel.car_name];
        self.mainOrderRemindWantView.remindLabel.attributedText = [NSString setAttributeOfFirstString:@"已预定车辆：" firstFont:DPFont3 firstColor:DPDarkGrayColor secondString:name secondFont:DPFont3 secondColor:DPBlueColor thirdString:@"将为您预留半小时，请尽快完成开锁" thirdFont:DPFont3 thirdColor:DPDarkGrayColor align:0 space:DPSmallSpacing];
        
      //status文字显示
        self.carStatusView.wantCarLabel.textColor = DPWhiteColor;
        self.carStatusView.wantCarLabel.font = DPFont6;
        self.carStatusView.wantCarLabel.text = @"取车";
        
        self.carStatusView.useCarLabel.textColor = DPLightGrayColor10;
        self.carStatusView.useCarLabel.font = DPFont3;
        self.carStatusView.useCarLabel.text = @"用车";
        
        self.carStatusView.payLabel.textColor = DPLightGrayColor10;
        self.carStatusView.payLabel.font = DPFont3;
        self.carStatusView.payLabel.text = @"支付";
        
        [self.carStatusView.imagePoint1 setImage:[UIImage imageNamed:@"car_nogo"]];
        [self.carStatusView.imagePoint2 setImage:[UIImage imageNamed:@"car_circle"]];
        [self.carStatusView.imagePoint3 setImage:[UIImage imageNamed:@"car_circle"]];
        
        self.carStatusView.line2.backgroundColor = DPLightGrayColor11;
        self.carStatusView.line3.backgroundColor = DPLightGrayColor11;
        self.carStatusView.line4.backgroundColor = DPLightGrayColor11;
        
        //message
        self.carServiceView.serviceLabel.text = [NSString stringWithFormat:@"%@ · 服务点",orderModel.qcaddress];
        self.carServiceView.addressLabel.text = orderModel.upaddress;
        
    }else if (tag == 1){// 开锁成功，去检查
        
        if ([self.changeHCAddress isEqualToString:@"1"]) {//更改了还车点
            [self.mainOrderRemindUseView removeFromSuperview];
            [self.carStatusView removeFromSuperview];
            [self.carMessageView removeFromSuperview];
            [self.carOperationView removeFromSuperview];
            
            //上面有提示框
            [self.view addSubview:self.mainOrderRemindReturnView];
            [self.mainOrderRemindReturnView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
            [self.mainOrderRemindReturnView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
            [self.mainOrderRemindReturnView autoPinToTopLayoutGuideOfViewController:self withInset:DPMiddleSpacing];
            [self.mainOrderRemindReturnView autoSetDimension:ALDimensionHeight toSize:48];
            
            //下面有详情
            [self.view addSubview:self.carStatusView];
            [self.view addSubview:self.carReturnView];
            [self.view addSubview:self.carOperationView];
            
            if (IS_IPHONE_X) {
                self.bottomButtonConstraints.constant = -60-135-7-50-DPMiddleSpacing-DPMiddleSpacing - DangerArea;
            }else{
                self.bottomButtonConstraints.constant = -60-135-7-50-DPMiddleSpacing-DPMiddleSpacing;
            }
            
            [self.carStatusView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPBigSpacing];
            [self.carStatusView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPBigSpacing];
            [self.carStatusView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.carReturnView];
            [self.carStatusView autoSetDimension:ALDimensionHeight toSize:60];
            
            [self.carReturnView autoSetDimension:ALDimensionHeight toSize:135];
            [self.carReturnView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
            [self.carReturnView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
            [self.carReturnView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.carOperationView withOffset:-7];
            
            if (IS_IPHONE_X) {
                [self.carOperationView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, DPMiddleSpacing, DPMiddleSpacing+DangerArea, DPMiddleSpacing) excludingEdge:ALEdgeTop];
                [self.carOperationView autoSetDimension:ALDimensionHeight toSize:50];
            }else{
                [self.carOperationView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, DPMiddleSpacing, DPMiddleSpacing, DPMiddleSpacing) excludingEdge:ALEdgeTop];
                [self.carOperationView autoSetDimension:ALDimensionHeight toSize:50];
            }
            
            
            //remind message
            NSString *spsp = [NSString stringWithFormat:@"%@·服务点",orderModel.hcnet];
            NSMutableAttributedString *titleds = [NSString setAttributeOfFirstString:@"  请前往 " firstFont:DPFont3 firstColor:DPDarkGrayColor secondString:spsp secondFont:DPFont3 secondColor:DPGrayColor];
            [self.mainOrderRemindReturnView.titleButton setAttributedTitle:titleds forState:0];
            
            //status
            self.carStatusView.wantCarLabel.textColor = DPLightGrayColor10;
            self.carStatusView.wantCarLabel.font = DPFont3;
            self.carStatusView.wantCarLabel.text = @"已取车";
            
            self.carStatusView.useCarLabel.textColor = DPWhiteColor;
            self.carStatusView.useCarLabel.font = DPFont6;
            self.carStatusView.useCarLabel.text = @"用车中";

            self.carStatusView.payLabel.textColor = DPLightGrayColor10;
            self.carStatusView.payLabel.font = DPFont3;
            self.carStatusView.payLabel.text = @"支付";
            
            [self.carStatusView.imagePoint1 setImage:[UIImage imageNamed:@"car_go"]];
            [self.carStatusView.imagePoint2 setImage:[UIImage imageNamed:@"car_nogo"]];
            [self.carStatusView.imagePoint3 setImage:[UIImage imageNamed:@"car_circle"]];
            
            self.carStatusView.line2.backgroundColor = DPBlueColor;
            self.carStatusView.line3.backgroundColor = DPLightGrayColor11;
            self.carStatusView.line4.backgroundColor = DPLightGrayColor11;
            
            //return message
            self.carReturnView.serviceLabel.text = orderModel.hcnet;
            self.carReturnView.addressLabel.text = orderModel.hcaddress ? orderModel.hcaddress : orderModel.yhcaddress;
            
            //operation
            [self.carOperationView.leftActButton setTitle:@"继续用车" forState:0];
            [self.carOperationView.leftActButton setImage:[UIImage imageNamed:@"s"] forState:0];
            [self.carOperationView.rightActButton setTitle:@"现在还车" forState:0];
            [self.carOperationView.rightActButton setImage:[UIImage imageNamed:@"s"] forState:0];

            self.carOperationView.didSelectedBtn = ^(NSInteger tag) {
                if (tag == 67) {
                    weakself.changeHCAddress = @"0";
                    [weakself showCarDetailMessagesWithOrderTag:1 andOrderModel:orderModel];
                }else if (tag == 68){
                    
                //现在还车
                    [weakself showCarCheckViewInView:weakself.view finishBlock:^(NSString *unlock) {
                        //确认还车
                        //两个经纬度的实际距离
                        AMapDistanceSearchRequest *request = [[AMapDistanceSearchRequest alloc] init];
                        request.origins = @[
                                            [AMapGeoPoint locationWithLatitude:[orderModel.lat floatValue] longitude:[orderModel.lng floatValue]]];
                        
                        request.destination = [AMapGeoPoint locationWithLatitude:[orderModel.hclat floatValue] longitude:[orderModel.hclng floatValue]];
                        request.type = 1;
                        
                        //                    weakself.search = [[AMapSearchAPI alloc] init];
                        //                    weakself.search.delegate = weakself;
                        [weakself.search AMapDistanceSearch:request];
                        
                    }];
                }
            };
        }else{
            //未更改还车点
            //顶部有提示框
            [self.view addSubview:self.mainOrderRemindUseView];
            [self.mainOrderRemindUseView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
            [self.mainOrderRemindUseView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
            [self.mainOrderRemindUseView autoPinToTopLayoutGuideOfViewController:self withInset:DPMiddleSpacing];
            [self.mainOrderRemindUseView autoSetDimension:ALDimensionHeight toSize:48];
            
            //底部有内容
            [self.view addSubview:self.carStatusView];
            [self.view addSubview:self.carMessageView];
            [self.view addSubview:self.carOperationView];
            
            if (IS_IPHONE_X) {
                self.bottomButtonConstraints.constant = -60-220-50-DPMiddleSpacing-DPBigSpacing - DangerArea;
            }else{
                self.bottomButtonConstraints.constant = -60-220-50-DPMiddleSpacing-DPBigSpacing;
            }

            [self.carStatusView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPBigSpacing];
            [self.carStatusView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPBigSpacing];
            [self.carStatusView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:weakself.carMessageView];
            [self.carStatusView autoSetDimension:ALDimensionHeight toSize:60];
            
            [self.carMessageView autoSetDimension:ALDimensionHeight toSize:220];
            [self.carMessageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
            [self.carMessageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
            [self.carMessageView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.carOperationView withOffset:-7];
            
            if (IS_IPHONE_X) {
                [self.carOperationView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, DPMiddleSpacing, DPMiddleSpacing+DangerArea, DPMiddleSpacing) excludingEdge:ALEdgeTop];
                [self.carOperationView autoSetDimension:ALDimensionHeight toSize:50];
            }else{
                [self.carOperationView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, DPMiddleSpacing, DPMiddleSpacing, DPMiddleSpacing) excludingEdge:ALEdgeTop];
                [self.carOperationView autoSetDimension:ALDimensionHeight toSize:50];
            }
            
            //status文字显示
            //status
            self.carStatusView.wantCarLabel.textColor = DPLightGrayColor10;
            self.carStatusView.wantCarLabel.font = DPFont3;
            self.carStatusView.wantCarLabel.text = @"已取车";
            
            self.carStatusView.useCarLabel.textColor = DPWhiteColor;
            self.carStatusView.useCarLabel.font = DPFont6;
            self.carStatusView.useCarLabel.text = @"用车中";
            
            self.carStatusView.payLabel.textColor = DPLightGrayColor10;
            self.carStatusView.payLabel.font = DPFont3;
            self.carStatusView.payLabel.text = @"支付";
            
            [self.carStatusView.imagePoint1 setImage:[UIImage imageNamed:@"car_go"]];
            [self.carStatusView.imagePoint2 setImage:[UIImage imageNamed:@"car_nogo"]];
            [self.carStatusView.imagePoint3 setImage:[UIImage imageNamed:@"car_circle"]];
            
            self.carStatusView.line2.backgroundColor = DPBlueColor;
            self.carStatusView.line3.backgroundColor = DPLightGrayColor11;
            self.carStatusView.line4.backgroundColor = DPLightGrayColor11;
            
            //详情显示
            self.carMessageView.nameLabel.text = [NSString stringWithFormat:@"%@  %@",orderModel.car_code,orderModel.car_name];
            NSString *imgs = [NSString stringWithFormat:@"%@%@",DPBaseUrl,orderModel.img];
            [self.carMessageView.carImageView sd_setImageWithURL:[NSURL URLWithString:imgs] placeholderImage:[UIImage imageNamed:@""]];
            
            //现在还车
            self.carMessageView.didSelectedBtn = ^(NSInteger tag) {
                weakself.changeHCAddress = @"1";
                [weakself showCarDetailMessagesWithOrderTag:1 andOrderModel:orderModel];
            };
        }
    }else if (tag == 2){//还车成功，去支付
        
        [self.mainMapView removeAnnotation:weakself.startAnnotation];
        [self.mainMapView removeAnnotation:weakself.destinationAnnotation];
        [self.naviRoute removeFromMapView];
        
        //上面有提示框
        [self.view addSubview:self.mainOrderRemindPayView];
        [self.mainOrderRemindPayView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        [self.mainOrderRemindPayView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.mainOrderRemindPayView autoPinToTopLayoutGuideOfViewController:weakself withInset:DPMiddleSpacing];
        [self.mainOrderRemindPayView autoSetDimension:ALDimensionHeight toSize:48];
        
        if (IS_IPHONE_X) {
            self.bottomButtonConstraints.constant = - 60 - 365 - DPMiddleSpacing - DangerArea;
        }else{
            self.bottomButtonConstraints.constant = - 60 - 365 - DPMiddleSpacing;
        }
        
        //下面有支付信息
        [self.view addSubview:self.carStatusView];
        [self.view addSubview:self.carPayView];
        
        [weakself.carStatusView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPBigSpacing];
        [weakself.carStatusView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPBigSpacing];
        [weakself.carStatusView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.customButton withOffset:DPMiddleSpacing];
        [weakself.carStatusView autoSetDimension:ALDimensionHeight toSize:60];
        
        [self.carPayView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        [self.carPayView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.carPayView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.carStatusView];
        [self.carPayView autoSetDimension:ALDimensionHeight toSize:365+DangerArea];
        
        //status文字显示
        //status
        self.carStatusView.wantCarLabel.textColor = DPLightGrayColor10;
        self.carStatusView.wantCarLabel.font = DPFont3;
        self.carStatusView.wantCarLabel.text = @"已取车";
        
        self.carStatusView.useCarLabel.textColor = DPLightGrayColor10;
        self.carStatusView.useCarLabel.font = DPFont3;
        self.carStatusView.useCarLabel.text = @"还车成功";
        
        self.carStatusView.payLabel.textColor = DPWhiteColor;
        self.carStatusView.payLabel.font = DPFont6;
        self.carStatusView.payLabel.text = @"待支付";
        
        [self.carStatusView.imagePoint1 setImage:[UIImage imageNamed:@"car_go"]];
        [self.carStatusView.imagePoint2 setImage:[UIImage imageNamed:@"car_go"]];
        [self.carStatusView.imagePoint3 setImage:[UIImage imageNamed:@"car_nogo"]];
        
        self.carStatusView.line2.backgroundColor = DPBlueColor;
        self.carStatusView.line3.backgroundColor = DPBlueColor;
        self.carStatusView.line4.backgroundColor = DPLightGrayColor11;
        
        //支付信息
        self.carPayView.moneyLabel.attributedText = [NSString setAttributeOfFirstString:@"  租金（元）\n" firstFont:DPFont3 firstColor:DPGrayColor secondString:orderModel.money secondFont:[UIFont systemFontOfSize:31] secondColor:DPDarkGrayColor align:1 space:DPSmallSpacing];
        
        if (!self.chooseTicketModel) {
            NSString *num = [NSString stringWithFormat:@"%@张优惠券",orderModel.ticketnum];
            NSMutableAttributedString *ticket = [NSString setAttributeOfFirstString:num firstFont:DPFont4 firstColor:DPBlueColor secondString:@"可用  " secondFont:DPFont4 secondColor:DPDarkGrayColor];
            [self.carPayView.chooseTicketButton setAttributedTitle:ticket forState:0];
        }else{
            NSString *mmmm = [NSString stringWithFormat:@"-¥%@",self.chooseTicketModel.money];
            NSMutableAttributedString *ticket = [NSString setAttributeOfFirstString:mmmm firstFont:DPFont4 firstColor:DPBlueColor secondString:@"  " secondFont:DPFont4 secondColor:DPDarkGrayColor];
            [self.carPayView.chooseTicketButton setAttributedTitle:ticket forState:0];
        }
        
        self.carPayView.accountLabel.text = [NSString stringWithFormat:@"帐户余额（余额¥%@）",orderModel.useryue];
        
        //账户余额的勾选显示情况
        if (!self.balanceString) {
            [self.carPayView.accountSelectButton setImage: [UIImage imageNamed:@"bank_noselected"] forState:0];
        }else{
            [self.carPayView.accountSelectButton setImage: [UIImage imageNamed:@"invoice_selecteds"] forState:0];
        }

        NSString *eles = [NSString stringWithFormat:@"还需支付¥%@  ",orderModel.smoney];
        [self.carPayView.wechatButton setTitle:eles forState:0];
        
        
        self.carPayView.didSelectedBtn = ^(NSInteger tag) {
            if (tag == 432) {//费用明细
                [weakself showMainPayMessageViewInView:weakself.view WithModel:orderModel finishBlock:^(NSInteger tag) {
                    if (tag == 334) {//计价规则
                        [weakself showHint:@"计价规则"];
                    }else{//订单疑问
                        MyOrderDetailQuestionViewController *myOrderDetailQuestionVC = [[MyOrderDetailQuestionViewController alloc] init];
                        myOrderDetailQuestionVC.oid = orderModel.oid;
                        [weakself.navigationController pushViewController:myOrderDetailQuestionVC animated:YES];
                    }
                }];
            }else if (tag == 433) {//选择优惠券
                ChooseTicketViewController *chooseTicketVC = [[ChooseTicketViewController alloc] init];
                chooseTicketVC.oid = orderModel.oid;
                chooseTicketVC.choosedTicketModel = weakself.chooseTicketModel;
                [weakself.navigationController pushViewController:chooseTicketVC animated:YES];
                
                chooseTicketVC.didSelectedItem = ^(TicketModel *model) {
                    weakself.chooseTicketModel = model;
                };
            }else if (tag == 434){//立即支付
                //1.单纯账户余额支付
                if ([orderModel.smoney isEqualToString:@"0"]) {//在微信支付金额为0 的情况下
                    [weakself confirmToPayWithYueOfOrderModel:orderModel];
                }else{
                    //2.微信支付,微信部分支付
                    [weakself confirmToPayWithOrderModel:orderModel];
                }
                
            }else if (tag == 435){//对余额的勾选
                
                //1.首先判断是否设置过余额支付密码
                if ([orderModel.checkpwd isEqualToString:@"0"]) {
                    //1.1 未设置支付密码
                    [weakself showHint:@"未设置支付密码,去设置"];
                    ResetPayViewController *resetPayVC = [[ResetPayViewController alloc] init];
                    resetPayVC.phoneString = @"13162521916";
                    resetPayVC.direction = @"设置";
                    [weakself.navigationController pushViewController:resetPayVC animated:YES];
                }else{
                    //1.2已设置好支付密码，可以直接选择余额
                    //1.2.1余额为0
                    if ([orderModel.useryue isEqualToString:@"0"]) {
                        [weakself showHint:@"您的余额不足"];
                    }else{
                        //1.2.2 余额不为0
                        if (!weakself.balanceString) {
                            [weakself showPWDBlurInView:weakself.view finishBlock:^(NSString *unlock) {
                                if (unlock.length >= 6) {//输入密码后
                                    NSString *spspspsp = [weakself MD5AndHashFromString:unlock];
                                    [weakself toVerifyThePasswordOfPaymentWithPassword:spspspsp];
                                    
                                    [weakself hiddenBlurView];
                                    
                                }else if([unlock isEqualToString:@"忘记密码"]){//忘记密码
                                    [weakself hiddenBlurView];
                                    [weakself showHint:@"忘记密码"];
                                    
                                    ResetPayViewController *resetPayVC = [[ResetPayViewController alloc] init];
                                    resetPayVC.phoneString = @"13162521916";
                                    resetPayVC.direction = @"重置";
                                    [weakself.navigationController pushViewController:resetPayVC animated:YES];
                                }
                            }];
                        }else{
                            weakself.balanceString = nil;
                            [weakself getAvailableOrder];
                        }
                    }

                }
                
            }
        };
    }
}

//查看用户是否交押金
- (void) checkUserIfToDeposit {
    NSString *cheString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPCarDetailsOfStatus,DPToken];
    
    CarListModel *model = self.carArray[0];
    
    NSDictionary *params = @{
                             @"number" : model.car_code,
                             @"aid" : model.ID
                             };
    
    DPWeakSelf;
    [self requestDataPostWithString:cheString params:params successBlock:^(id responseObject) {
        CheckModel *mmm = [CheckModel mj_objectWithKeyValues:responseObject];
        if ([mmm.status isEqualToString:@"200"]) {
            if ([mmm.data isEqualToString:@"0"]) {
                //未交押金
                [weakself showAlert];
            }else{
                [weakself.mainUpCarDetailView removeFromSuperview];
                
                if (IS_IPHONE_X) {
                    weakself.bottomButtonConstraints.constant = -38 - DangerArea;
                }else{
                    weakself.bottomButtonConstraints.constant = -38;
                }
                
                OrderGenerateViewController *orderGenerateVC = [[OrderGenerateViewController alloc] init];
                CarListModel *model = weakself.carArray[0];
                orderGenerateVC.carModel = model;
                orderGenerateVC.qcCoordinate = CLLocationCoordinate2DMake([model.lat doubleValue], [model.lng doubleValue]);
                [weakself.navigationController pushViewController:orderGenerateVC animated:YES];
            }
        }
    } andFailBlock:^(NSError *error) {
        
    }];
}
    
//    [self requestDataPostWithString:cheString params:params successBlock:^(id responseObject) {
//
//        CheckModel *mmm = [CheckModel mj_objectWithKeyValues:responseObject];
    
//        if ([mmm.status isEqualToString:@"200"]) {
//
//            if ([mmm.data isEqualToString:@"0"]) {
//                //未交押金
//                [weakself showAlert];
//
//            }else{//已交押金，直接预订车辆
//
//                [weakself.mainUpCarDetailView removeFromSuperview];
//
////                OrderGenerateViewController *orderGenerateVC = [[OrderGenerateViewController alloc] init];
////                CarListModel *model = weakself.carArray[0];
////                orderGenerateVC.carModel = model;
////                orderGenerateVC.qcCoordinate = CLLocationCoordinate2DMake([model.lat doubleValue], [model.lng doubleValue]);
//////                orderGenerateVC.userCoordinate = weakself.userLocationCoordinate2D;
////                [weakself.navigationController pushViewController:orderGenerateVC animated:YES];
//
//
//
////                MineViewController *mineVC = [MineViewController alloc] init];
////                [weakself.navigationController pushViewController:mineVC animated:YES];
//            }
//        }
        
//    } andFailBlock:^(NSError *error) {
//
//    }];

- (void) showAlert {
    
    UIAlertController *checkAlertController = [[UIAlertController alloc] init];
    
    DPWeakSelf;
    UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"芝麻信用免押" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        MyGrantViewController *myGrantVC = [[MyGrantViewController alloc] init];
        [weakself.navigationController pushViewController:myGrantVC animated:YES];
    }];
    [checkAlertController addAction:act1];
    
    UIAlertAction *act2 = [UIAlertAction actionWithTitle:@"信用卡免押" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        MyCardViewController *myCardVC = [[MyCardViewController alloc] init];
        [weakself.navigationController pushViewController:myCardVC animated:YES];
    }];
    [checkAlertController addAction:act2];
    
    UIAlertAction *act3 = [UIAlertAction actionWithTitle:@"去交押金" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        MyDepositViewController *myDepositVC = [[MyDepositViewController alloc] init];
        [weakself.navigationController pushViewController:myDepositVC animated:YES];
    }];
    [checkAlertController addAction:act3];
    
    UIAlertAction *act4 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [checkAlertController addAction:act4];
    
    [self presentViewController:checkAlertController animated:YES completion:nil];
}

//现在还车
- (void) confirmToReturnTheCarWithOrderModel:(AvailableOrderModel *)orderModel withHckm:(NSString *)hckm {
    NSString *returnString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPCarDetailsOfReturn,DPToken];
    
    NSDictionary *params = @{
                             @"oid" : orderModel.oid,
                             @"hckm" : hckm
                             };
    
    DPWeakSelf;
    [self requestDataPostWithString:returnString params:params successBlock:^(id responseObject) {
        BaseModel *returnModel = [BaseModel mj_objectWithKeyValues:responseObject];
        
        [weakself showHint:returnModel.info];
        
        if ([returnModel.status isEqualToString:@"200"]) {
            [weakself.mainMapView removeAnnotation:weakself.startAnnotation];
            [weakself.mainMapView removeAnnotation:weakself.destinationAnnotation];
            [weakself.naviRoute removeFromMapView];
            
            [weakself getAvailableOrder];
        }
    } andFailBlock:^(NSError *error) {
        
    }];
}

//立即支付 - 账户余额支付
- (void) confirmToPayWithYueOfOrderModel:(AvailableOrderModel *)orderModel {
    NSString *payString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPCarDetailsOfYuePay,DPToken];

    NSDictionary *params = @{
                             @"oid"  :  orderModel.oid,
                             @"yuepay " : orderModel.yuepay,
                             @"types" : @"4",
                             @"tid" : self.chooseTicketModel.ID ? self.chooseTicketModel.ID : @""
                             };
    
    DPWeakSelf;
    [self requestDataPostWithString:payString params:params successBlock:^(id responseObject) {
        BaseModel *baseModel = [BaseModel mj_objectWithKeyValues:responseObject];
        if ([baseModel.status isEqualToString:@"200"]) {
            [weakself getAvailableOrder];
        }else{
            NSLog(@"支付失败");
        }
    } andFailBlock:^(NSError *error) {
        
    }];
    
}

//立即支付-微信支付(包括全部微信支付 和 部分微信支付)
- (void) confirmToPayWithOrderModel:(AvailableOrderModel *)orderModel {
    
    NSString *unlockString = [NSString stringWithFormat: @"%@%@/%@",DPBaseUrl,DPCarDetailsOfUnlock,DPToken];

    NSDictionary *pa = @{
                             @"oid"  :  orderModel.oid,
                             @"mark" : @"delete",
                             };

    DPWeakSelf;
    [self requestDataPostWithString:unlockString params:pa successBlock:^(id responseObject) {
        BaseModel *mo = [BaseModel mj_objectWithKeyValues:responseObject];
        if ([mo.status isEqualToString:@"200"]) {
            
            [weakself.mainOrderRemindPayView removeFromSuperview];
            [weakself.carStatusView removeFromSuperview];
            [weakself.carPayView removeFromSuperview];
            
            if (IS_IPHONE_X) {
                weakself.bottomButtonConstraints.constant = -38-DangerArea;
            }else{
                weakself.bottomButtonConstraints.constant = -38;
            }
            
        }
    } andFailBlock:^(NSError *error) {

    }];

    return ;
    
    NSString *payString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPCarDetailsOfPay,DPToken];

    NSDictionary *params = @{
                             @"oid"  :  orderModel.oid,
                             @"smoney" : @"0.01",
//                                 orderModel.smoney,
                             @"types" : @"1",
                             @"tid" : self.chooseTicketModel.ID ? self.chooseTicketModel.ID : @""
                             };

    [self requestDataPostWithString:payString params:params successBlock:^(id responseObject) {

        WechatModel *model = [WechatModel mj_objectWithKeyValues:responseObject];
        
        if ([model.status isEqualToString:@"200"]) {
            
            // 调起微信支付
            PayReq *reqPay = [[PayReq alloc] init];
            reqPay.partnerId = model.partnerid;
            reqPay.prepayId = model.prepayid;
            reqPay.nonceStr = model.noncestr;
            reqPay.timeStamp = [model.timestamp intValue];
            reqPay.package = model.package;
            reqPay.sign = model.sign;
            
            [WXApi sendReq:reqPay];
        }

    } andFailBlock:^(NSError *error) {

    }];
    
    
    /*
        NSString *unlockString = [NSString stringWithFormat: @"%@%@/%@",DPBaseUrl,DPCarDetailsOfUnlock,DPToken];
        
        NSDictionary *params = @{
                                 @"oid"  :  orderModel.oid,
                                 @"mark" : @"delete",
                                 @"soil" : orderModel.oilmass
                                 };
        
        DPWeakSelf;
        [self requestDataPostWithString:unlockString params:params successBlock:^(id responseObject) {
            
            BaseModel *payModel = [BaseModel mj_objectWithKeyValues:responseObject];
            
            [weakself showHint:payModel.info];
            if ([payModel.status isEqualToString:@"200"]) {
                
                [weakself.mainOrderRemindPayView removeFromSuperview];
                [weakself.carStatusView removeFromSuperview];
                [weakself.carPayView removeFromSuperview];
                
                [weakself getAvailableOrder];
            }
        } andFailBlock:^(NSError *error) {
            
        }];
        */
}

- (void)getOrderPayResult:(NSNotification *)notification {
    
    if ([notification.object isEqualToString:@"success"]){
        [self showHint:@"success"];
    }else if([notification.object isEqualToString:@"cancel"]){
        [self showHint:@"cancel"];
    }else{
        [self showHint:@"fail"];
    }
    
}

/**
 销毁广播
 */
-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void) startTheCountDownWithTime {
    AvailableOrderModel *orderModel = self.currentArray[0];
    
    //当前时间戳
    NSDate *currentDate = [NSDate date];
    NSString *currentString = [NSString stringWithFormat:@"%f",[currentDate timeIntervalSince1970]];
   
    //差值：addtime + 1800秒 - 当前时间戳 = 倒计时时间
    NSInteger value = [orderModel.addtime integerValue] + 1800 - [currentString integerValue];
    
    NSString *ssssss;
    value--;
    if (value > 0) {//倒计时未结束
        ssssss = [NSString stringWithFormat:@"%02ld:%02ld",value/60,value%60];
        self.mainOrderRemindWantView.circleProgressView.progress = 1 - value/1800.0;
        self.mainOrderRemindWantView.circleProgressView.progressLabel.text = ssssss;
    }else{//倒计时结束
        
        [_orderTimer invalidate];
        _orderTimer = nil;
        
        [self.mainOrderRemindWantView removeFromSuperview];
        [self.carStatusView removeFromSuperview];
        [self.carMessageView removeFromSuperview];
        
        if (IS_IPHONE_X) {
            self.bottomButtonConstraints.constant = 38+DangerArea;
        }else{
            self.bottomButtonConstraints.constant = 38;
        }
    }
}

//路线规划
- (void) startRoutePlanning {
        self.search = [[AMapSearchAPI alloc] init];
        self.search.delegate = self;
    
        [self addDefaultAnnotations];
    
        [self searchRoutePlanningWalk];  //步行路线开始规划
}
//添加标注
- (void)addDefaultAnnotations {
    MAPointAnnotation *startAnnotation = [[MAPointAnnotation alloc] init];
    startAnnotation.coordinate = self.startCoordinate;
    startAnnotation.title = @"11";
    startAnnotation.subtitle = [NSString stringWithFormat:@"{%f, %f}", self.startCoordinate.latitude, self.startCoordinate.longitude];
    self.startAnnotation = startAnnotation;
    
    MAPointAnnotation *destinationAnnotation = [[MAPointAnnotation alloc] init];
    destinationAnnotation.coordinate = self.destinationCoordinate;
    destinationAnnotation.title = @"22";
    destinationAnnotation.subtitle = [NSString stringWithFormat:@"{%f, %f}", self.destinationCoordinate.latitude, self.destinationCoordinate.longitude];
    self.destinationAnnotation = destinationAnnotation;
    
    [self.mainMapView addAnnotation:startAnnotation];
    [self.mainMapView addAnnotation:destinationAnnotation];
}

//步行路线开始规划
- (void)searchRoutePlanningWalk {
    
    AMapWalkingRouteSearchRequest *navi = [[AMapWalkingRouteSearchRequest alloc] init];
    
    /* 出发点. */
    navi.origin = [AMapGeoPoint locationWithLatitude:self.startCoordinate.latitude
                                           longitude:self.startCoordinate.longitude];
    /* 目的地. */
    navi.destination = [AMapGeoPoint locationWithLatitude:self.destinationCoordinate.latitude
                                                longitude:self.destinationCoordinate.longitude];
    
    [self.search AMapWalkingRouteSearch:navi];
}


//获取用户中心信息
- (void) getUserCenterMessagesOfMain {
    
    NSString *centerString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPMyUserCenterMessages,DPToken];
    
    DPWeakSelf;
    [self requestDataGetWithString:centerString params:nil successBlock:^(id responseObject) {
        
        UserResponse *response = [UserResponse mj_objectWithKeyValues:responseObject];

        if ([response.status isEqualToString:@"200"]) {
            [weakself showMainUserCenterViewInView:weakself.view WithModel:response.data   finishBlock:^(NSInteger tag) {
                switch (tag) {
                    case 5:{//用户中心
//                        MineViewController *mineVC = [[MineViewController alloc] init];
//                        [weakself.navigationController pushViewController:mineVC animated:YES];
                        LoginViewController *loginVC = [[LoginViewController alloc] init];
                        [weakself.navigationController pushViewController:loginVC animated:YES];
                    }
                        break;
                    case 10:{//订单
                        MyOrderViewController *myOrderVC = [[MyOrderViewController alloc] init];
                        [weakself.navigationController pushViewController:myOrderVC animated:YES];
                    }
                        break;
                    case 11:{//钱包
                        MyWalletListViewController *myWalletListVC = [[MyWalletListViewController alloc] init];
                        [weakself.navigationController pushViewController:myWalletListVC animated:YES];
                    }
                        break;
                    case 12:{//授权
                        MyGrantViewController *myGrantVC = [[MyGrantViewController alloc] init];
                        [weakself.navigationController pushViewController:myGrantVC animated:YES];
                    }
                        break;
                    case 13:{//违章
                        MyBreakViewController *myBreakVC = [[MyBreakViewController alloc] init];
                        [weakself.navigationController pushViewController:myBreakVC animated:YES];
                    }
                        break;
                    case 14:{//客服
//                        NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"是否拨打客服电话\ntelprompt://%@",@"13162521916"];
//                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
                        
                        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"10086"];
                        UIWebView * callWebview = [[UIWebView alloc] init];
                        [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
                        [weakself.view addSubview:callWebview];
                    }
                        break;
                    case 15:{//设置
                        MySettingViewController *mySettingVC = [[MySettingViewController alloc] init];
                        [weakself.navigationController pushViewController:mySettingVC animated:YES];
                    }
                        break;
                    default:
                        break;
                }
            }];
        }
        
    } andFailBlock:^(NSError *error) {
        
    }];
}


//密码加密上传参数
- (NSString *)MD5AndHashFromString:(NSString *)str {
    
    //MD5
      const  char *cStr = [str UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest );// This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
                [output appendFormat:@"%02x",digest[i]];
    }
    
    //sha1加密
    const char *cstr1 = [output cStringUsingEncoding:NSUTF8StringEncoding];
    
    NSData *data = [NSData dataWithBytes:cstr1 length:output.length];
    //使用对应的CC_SHA1,CC_SHA256,CC_SHA384,CC_SHA512的长度分别是20,32,48,64
    uint8_t digest1[CC_SHA1_DIGEST_LENGTH];
    
    //使用对应的CC_SHA256,CC_SHA384,CC_SHA512
    CC_SHA1(data.bytes, data.length, digest1);
    
    NSMutableString* output1 = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++){
        [output1 appendFormat:@"%02x", digest1[i]];
    }
    
    return output1;
    
}

//验证输入的账户余额支付密码是否正确
- (void) toVerifyThePasswordOfPaymentWithPassword:(NSString *)password {
    NSString *passString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPCarDetailsOfVerifyPaymentPassword,DPToken];
    
    NSDictionary *param = @{@"password" : password};
    
    DPWeakSelf;
    [self requestDataPostWithString:passString params:param successBlock:^(id responseObject) {
        PasswordModel *model = [PasswordModel mj_objectWithKeyValues:responseObject];
        
        if ([model.status isEqualToString:@"200"]) {
            if ([model.data isEqualToString:@"1"]) {//成功
                [weakself hiddenBlurView];
                AvailableOrderModel *avModel = weakself.currentArray[0];
                weakself.balanceString = avModel.useryue;
                [weakself getAvailableOrder];
            }else{//失败
                [weakself showHint:model.info];
            }
        }
    } andFailBlock:^(NSError *error) {
        [weakself hiddenBlurView];
    }];
}

//remove
- (void)hiddenBlurView {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIView *tagView = [window viewWithTag:9999];
    if (tagView) {
        [tagView removeFromSuperview];
    }
}

//获取
//- (void) showPayMessage {
//    NSString *payMessageString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPCarDetailsOfShowPayMessages,DPToken];
//
//    DPWeakSelf;
//    self requestDataPostWithString:payMessageString params:<#(NSDictionary *)#> successBlock:<#^(id responseObject)successBlock#> andFailBlock:<#^(NSError *error)failBlock#>
//}



#pragma mark - mapView delegate
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAUserLocation class]]) {
        return nil;
    }else if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
       
        
        
        //标注的view的初始化和复用
        static NSString *routePlanningCellIdentifier = @"RoutePlanningCellIdentifier";
        
        MAAnnotationView *poiAnnotationView = (MAAnnotationView*)[self.mainMapView dequeueReusableAnnotationViewWithIdentifier:routePlanningCellIdentifier];
        
        if (poiAnnotationView == nil) {
            poiAnnotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:routePlanningCellIdentifier];
        }
        
        poiAnnotationView.canShowCallout = YES;
        poiAnnotationView.image = nil;
        
        //拐点的图标标注
        if ([annotation isKindOfClass:[MANaviAnnotation class]]) {
            poiAnnotationView.image = [UIImage imageNamed:@"invoice_selectedss"];
        }else{
            //起点，终点的图标标注
            if ([[annotation title] isEqualToString:@"11"]) {
                poiAnnotationView.image = [UIImage imageNamed:@"authenty_blue"];  //起点
            }else if([[annotation title] isEqualToString:@"22"]){
                poiAnnotationView.image = [UIImage imageNamed:@"map_annotion_selected"];  //终点
            }
        }
        
        return poiAnnotationView;
        
        return nil;
        
        CustomAnnotationView *annotationView =
        [[CustomAnnotationView alloc] init];
        
        for (NSInteger i = 0 ;  i < self.annotionArray.count ; i++ ) {
            MAPointAnnotation *ssss = self.annotionArray[i];
            
            NSLog(@"京都京都%f",ssss.coordinate.latitude);
            NSLog(@"唯独唯独%f",ssss.coordinate.longitude);
            
            annotationView.carNumberLabel.text = ssss.title;
            
            if ([ssss.title isEqualToString:@"0"]) {
                annotationView.carBackgroundImageView.image = [UIImage imageNamed:@"map_noannotion"];
            }else {
                annotationView.carBackgroundImageView.image = [UIImage imageNamed:@"map_annotion"];
            }
        }
        return annotationView;

    }
    return nil;
}

//- (void)selectAnnotation:(id <MAAnnotation>)annotation animated:(BOOL)animated {
//    [self selectAnnotation:annotation animated:YES];
//    
//    NSLog(@"selectAnnotation");
//}

//点击标注
- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view {
    if ([view isKindOfClass:[CustomAnnotationView class]]) {
        
        NSLog(@"京都京都%f",view.annotation.coordinate.latitude);
        NSLog(@"唯独唯独%f",view.annotation.coordinate.longitude);
        
        CustomAnnotationView *cusView = (CustomAnnotationView *)view;
        cusView.carBackgroundImageView.image = [UIImage imageNamed:@"more_error"];
        
        [self getAvailablaCarListWithCoordinate:view.annotation.coordinate];
    }
}

- (void)mapView:(MAMapView *)mapView didDeselectAnnotationView:(MAAnnotationView *)view {
    if ([view isKindOfClass:[CustomAnnotationView class]]) {
        
        NSLog(@"京都京都%f",view.annotation.coordinate.latitude);
        NSLog(@"唯独唯独%f",view.annotation.coordinate.longitude);
        
        CustomAnnotationView *cusView = (CustomAnnotationView *)view;
        cusView.carBackgroundImageView.image = [UIImage imageNamed:@"lock_blue"];
        
        [self getAvailablaCarListWithCoordinate:view.annotation.coordinate];
    }
}

//点击地图空白区域（不包括标注）
- (void)mapView:(MAMapView *)mapView didSingleTappedAtCoordinate:(CLLocationCoordinate2D)coordinate {
        [self.mainUpCarView removeFromSuperview];
        [self.mainUpCarDetailView removeFromSuperview];
    
    //当无订单时，点击地图空白区域，customButton才会消失
    if (self.currentArray.count == 0) {
        
        if (IS_IPHONE_X) {
            self.bottomButtonConstraints.constant = -38 - DangerArea;
        }else{
            self.bottomButtonConstraints.constant = -38;
        }
        [self.nowUseCarButton setHidden:NO];
    }
}

- (void)mapViewDidFinishLoadingMap:(MAMapView *)mapView {
    if (self.annotionArray.count == 0) {
        [self getAllAnnotion];
    }
}

- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation {
    //用户位置
    self.userLocationCoordinate2D = userLocation.location.coordinate;
}

#pragma mark - AMapSearchDelegate
////当路径规划搜索请求发生错误时，会调用代理的此方法
- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error
{
    [self.naviRoute removeFromMapView];
}

/* 路径规划搜索回调. */
- (void)onRouteSearchDone:(AMapRouteSearchBaseRequest *)request response:(AMapRouteSearchResponse *)response
{
    if (response.route == nil){
        [self.naviRoute removeFromMapView];
        return;
    }
    
    self.route = response.route;
    
    [self presentCurrentRouteCourse];
}

//在地图上显示当前选择的路径
- (void) presentCurrentRouteCourse {
    
    [self.naviRoute removeFromMapView];  //清空地图上已有的路线
    
    MANaviAnnotationType type = MANaviAnnotationTypeWalking; //导航类型
    
    AMapGeoPoint *startPoint = [AMapGeoPoint locationWithLatitude:self.startAnnotation.coordinate.latitude longitude:self.startAnnotation.coordinate.longitude]; //起点
    
    AMapGeoPoint *endPoint = [AMapGeoPoint locationWithLatitude:self.destinationAnnotation.coordinate.latitude longitude:self.destinationAnnotation.coordinate.longitude];  //终点
    
    //根据已经规划的路径，起点，终点，规划类型，是否显示实时路况，生成显示方案
    self.naviRoute = [MANaviRoute naviRouteForPath:self.route.paths[0] withNaviType:type showTraffic:NO startPoint:startPoint endPoint:endPoint];
    
    [self.naviRoute addToMapView:self.mainMapView];  //显示到地图上
    
    UIEdgeInsets edgePaddingRect = UIEdgeInsetsMake(DPMiddleSpacing, DPMiddleSpacing, DPMiddleSpacing, DPMiddleSpacing);
    
    //缩放地图使其适应polylines的展示
    [self.mainMapView setVisibleMapRect:[CommonUtility mapRectForOverlays:self.naviRoute.routePolylines]
                        edgePadding:edgePaddingRect
                           animated:NO];
}

- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id<MAOverlay>)overlay
{
    //虚线，如需要步行的
    if ([overlay isKindOfClass:[LineDashPolyline class]]) {
        MAPolylineRenderer *polylineRenderer = [[MAPolylineRenderer alloc] initWithPolyline:((LineDashPolyline *)overlay).polyline];
        polylineRenderer.lineWidth = 6;
//        polylineRenderer.lineDash = YES;
        polylineRenderer.strokeColor = DPGreenColor3;
        
        return polylineRenderer;
    }
    
    //showTraffic为NO时，不需要带实时路况，路径为单一颜色，比如步行线路目前为海蓝色
    if ([overlay isKindOfClass:[MANaviPolyline class]]) {
        MANaviPolyline *naviPolyline = (MANaviPolyline *)overlay;
        MAPolylineRenderer *polylineRenderer = [[MAPolylineRenderer alloc] initWithPolyline:naviPolyline.polyline];
        
        polylineRenderer.lineWidth = 6;
        
        if (naviPolyline.type == MANaviAnnotationTypeWalking) {
            polylineRenderer.strokeColor = DPGreenColor3;
//            self.naviRoute.walkingColor;
        } else if (naviPolyline.type == MANaviAnnotationTypeRailway) {
            polylineRenderer.strokeColor = self.naviRoute.walkingColor;
        } else {
            polylineRenderer.strokeColor = self.naviRoute.walkingColor;;
        }
        
        return polylineRenderer;
    }
    
    //showTraffic为YES时，需要带实时路况，路径为多颜色渐变
//    if ([overlay isKindOfClass:[MAMultiPolyline class]]) {
//        MAMultiColoredPolylineRenderer * polylineRenderer = [[MAMultiColoredPolylineRenderer alloc] initWithMultiPolyline:overlay];
//
//        polylineRenderer.lineWidth = 6;
//        polylineRenderer.strokeColors = [self.naviRoute.multiPolylineColors copy];
//
//        return polylineRenderer;
//    }
    
    return nil;
}

- (void)onDistanceSearchDone:(AMapDistanceSearchRequest *)request response:(AMapDistanceSearchResponse *)response{
    
    NSArray *asas = response.results;
    AMapDistanceResult *result = [AMapDistanceResult mj_objectWithKeyValues:asas[0]];
    
    float lll = result.distance * 0.001;
    
    NSString *distances = [NSString stringWithFormat:@"%.3f",lll];
    
    AvailableOrderModel *model = self.currentArray[0];
    [self confirmToReturnTheCarWithOrderModel:model withHckm:distances];
}


#pragma mark - 第三方导航
//跳转至地图导航
//导航只需要目的地经纬度，endLocation为纬度、经度的数组
- (void) doNavigationWithEndLocation:(NSArray *)endLocation {
    
    NSMutableArray *maps = [NSMutableArray array];
    
    //苹果原生地图-苹果原生地图方法和其他不一样
    NSMutableDictionary *iosMapDic = [NSMutableDictionary dictionary];
    iosMapDic[@"title"] = @"苹果地图";
    [maps addObject:iosMapDic];
    
    //百度地图
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]]) {
        NSMutableDictionary *baiduMapDic = [NSMutableDictionary dictionary];
        baiduMapDic[@"title"] = @"百度地图";
//        NSString *urlString = [[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=latlng:%@,%@|name=上海&mode=driving&coord_type=gcj02",endLocation[0],endLocation[1]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *urlString = [[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=latlng:%@,%@|name=北京&mode=driving&coord_type=gcj02",endLocation[0],endLocation[1]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

        baiduMapDic[@"url"] = urlString;
        [maps addObject:baiduMapDic];
    }
    
    //高德地图
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]]) {
        NSMutableDictionary *gaodeMapDic = [NSMutableDictionary dictionary];
        gaodeMapDic[@"title"] = @"高德地图";
        NSString *urlString = [[NSString stringWithFormat:@"iosamap://navi?sourceApplication=%@&backScheme=%@&lat=%@&lon=%@&dev=0&style=2",@"导航功能",@"nav123456",endLocation[0],endLocation[1]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        gaodeMapDic[@"url"] = urlString;
        [maps addObject:gaodeMapDic];
    }
    
    //谷歌地图
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]]) {
        NSMutableDictionary *googleMapDic = [NSMutableDictionary dictionary];
        googleMapDic[@"title"] = @"谷歌地图";
        NSString *urlString = [[NSString stringWithFormat:@"comgooglemaps://?x-source=%@&x-success=%@&saddr=&daddr=%@,%@&directionsmode=driving",@"导航测试",@"nav123456",endLocation[0], endLocation[1]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        googleMapDic[@"url"] = urlString;
        [maps addObject:googleMapDic];
    }
    
    //腾讯地图
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"qqmap://"]]) {
        NSMutableDictionary *qqMapDic = [NSMutableDictionary dictionary];
        qqMapDic[@"title"] = @"腾讯地图";
        NSString *urlString = [[NSString stringWithFormat:@"qqmap://map/routeplan?from=我的位置&type=drive&tocoord=%@,%@&to=终点&coord_type=1&policy=0",endLocation[0], endLocation[1]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        qqMapDic[@"url"] = urlString;
        [maps addObject:qqMapDic];
    }
    
    //添加取消按钮
    [maps addObject:@{@"title" : @"取消"}];
    
    //选择
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"选择地图" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    NSInteger index = maps.count;
    
    for (int i = 0; i < index; i++) {
        
        NSString * title = maps[i][@"title"];
        
        //苹果原生地图方法
        if (i == 0) {
            UIAlertAction * action0 = [UIAlertAction actionWithTitle:title style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                [self navAppleMapWithArray:endLocation];
            }];
            [alert addAction:action0];
            continue;
        }
        
        //取消按钮
        if (i == index - 1) {
            UIAlertAction * action6 = [UIAlertAction actionWithTitle:title style:(UIAlertActionStyleDefault) handler:nil];
            [alert addAction:action6];
            continue;
        }
        
        //其他地图
        UIAlertAction * action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSString *urlString = maps[i][@"url"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
        }];
        
        [alert addAction:action];
        
    }
    [self presentViewController:alert animated:YES completion:nil];
}

////苹果地图
- (void)navAppleMapWithArray:(NSArray *)end
{
    //    CLLocationCoordinate2D gps = [JZLocationConverter bd09ToWgs84:self.destinationCoordinate2D];

    //终点坐标
    CLLocationCoordinate2D loc = CLLocationCoordinate2DMake([end[0] floatValue], [end[1] floatValue]);

    //用户位置
    MKMapItem *currentLoc = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:self.userLocationCoordinate2D addressDictionary:nil]];
//    [MKMapItem mapItemForCurrentLocation];
    
    //终点位置
    MKMapItem *toLocation = [[MKMapItem alloc]initWithPlacemark:[[MKPlacemark alloc]initWithCoordinate:loc addressDictionary:nil] ];

    NSArray *items = @[currentLoc,toLocation];
    //第一个
    NSDictionary *dic = @{
                          MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving,
                          MKLaunchOptionsMapTypeKey : @(MKMapTypeStandard),
                          MKLaunchOptionsShowsTrafficKey : @(YES)
                          };
    //第二个，都可以用
    //    NSDictionary * dic = @{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,
    //                           MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]};

    [MKMapItem openMapsWithItems:items launchOptions:dic];
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
