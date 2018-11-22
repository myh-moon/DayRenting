//
//  OrderResultViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderResultViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MapKit/MapKit.h>
#import <AMapNaviKit/AMapNaviKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import "OrderResultQuestionViewController.h"

#import "UIViewController+Blur.h"

#import "OrderResultMessageView.h"
#import "OrderResultRemindView.h"
#import "OrderResultUnlockView.h"
#import "OrderResultCheckView.h"
#import "MapAreaImageView.h"

//model
#import "AvailableOrderResponse.h"
#import "AvailableOrderModel.h"

@interface OrderResultViewController ()<MAMapViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,AMapNaviWalkViewDelegate,AMapNaviWalkManagerDelegate>

@property (nonatomic,strong) MAMapView *orderResultMapView;
@property (nonatomic,strong) MAUserLocationRepresentation *mainRepresentation;  // 用户当前定位的显示

@property (nonatomic,strong) OrderResultRemindView *resultRemindView;  //提示框
@property (nonatomic,strong) UIButton *resultCountDownButton; //倒计时

@property (nonatomic,strong) OrderResultMessageView *resultMessageView;
@property (nonatomic,strong) OrderResultUnlockView *unlockView;
@property (nonatomic,strong) NSTimer *checkTimer;
@property (nonatomic,strong) OrderResultCheckView *checkView;
@property (nonatomic,assign) NSInteger orderValue;

@property (nonatomic,strong) UIButton *unlockButton;  //开锁
@property (nonatomic,strong) UIButton *serviceButton;  //客服
@property (nonatomic,strong) MapAreaImageView *mapAreaView;

@property (nonatomic,strong) NSString *oidString;   //oid
@property (nonatomic,strong) NSString *oilString;  //油量
@property (nonatomic,strong) NSMutableArray *resultArray;

@property (nonatomic,strong) AMapSearchAPI *search;
@property (nonatomic,strong) AMapNaviWalkManager *walkManager;

@end

@implementation OrderResultViewController

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [_checkTimer invalidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
    [self.rightNavButton setTitle:@"..." forState:0];
    [self.rightNavButton setTitleColor:DPDarkGrayColor forState:0];
    
    [self.view addSubview:self.orderResultMapView];
    [self.view addSubview:self.serviceButton];
    [self.view addSubview:self.resultMessageView];
    [self.view addSubview:self.unlockButton];
    [self.view addSubview:self.mapAreaView];
    
    if ([self.direction isEqualToString:@"1"]) {
        [self.view addSubview:self.resultRemindView];
    }else if ([self.direction isEqualToString:@"2"]){
        [self.view addSubview:self.resultCountDownButton];
    }
    
    [self.view setNeedsUpdateConstraints];
    
    [self.serviceButton setHidden:YES];
    [self.resultMessageView setHidden:YES];
    [self.unlockButton setHidden:YES];
    [self.resultRemindView setHidden:YES];
    [self.resultCountDownButton setHidden:YES];
    
    [self getOrderDetailMessage];
}

#pragma mark - init
- (MAMapView *)orderResultMapView {
    if (!_orderResultMapView) {
        _orderResultMapView = [MAMapView newAutoLayoutView];
        _orderResultMapView.delegate = self;
        _orderResultMapView.showsUserLocation = YES;   //是否显示用户位置
        _orderResultMapView.userTrackingMode = 1;          //定位用户位置的模式
        _orderResultMapView.rotationDegree = 0;               //设置地图旋转角度
        _orderResultMapView.rotateEnabled = NO;               ///是否支持旋转
        _orderResultMapView.rotateCameraEnabled = NO;      //是否支持camera旋转
        _orderResultMapView.maxZoomLevel = 19;
        _orderResultMapView.minZoomLevel = 3;
        _orderResultMapView.zoomLevel = 14;
        _orderResultMapView.showsScale = NO;               //是否显示比例尺,
        _orderResultMapView.showsCompass = NO;         //是否显示指南针
        [_orderResultMapView updateUserLocationRepresentation:self.mainRepresentation];
        
        //用户经纬度
        //        _orderResultMapView.userLocation.location.coordinate.latitude
    }
    return _orderResultMapView;
}

- (MAUserLocationRepresentation *)mainRepresentation {
    if (!_mainRepresentation) {
        //用户位置显示样式控制
        _mainRepresentation = [[MAUserLocationRepresentation alloc] init];
        _mainRepresentation.showsAccuracyRing = NO; //不显示精度圈
        //        _mainRepresentation.showsHeadingIndicator = YES;//显示指向
    }
    return _mainRepresentation;
}


- (OrderResultRemindView *)resultRemindView {
    if (!_resultRemindView) {
        _resultRemindView = [OrderResultRemindView newAutoLayoutView];
    }
    return _resultRemindView;
}

- (UIButton *)resultCountDownButton {
    if (!_resultCountDownButton) {
        _resultCountDownButton = [UIButton newAutoLayoutView];
        
        _resultCountDownButton.layer.cornerRadius = 6;
        _resultCountDownButton.layer.masksToBounds = YES;
        _resultCountDownButton.backgroundColor = DPWhiteColor;
        [_resultCountDownButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
        
        [_resultCountDownButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [_resultCountDownButton setContentEdgeInsets:UIEdgeInsetsMake(0, DPMiddleSpacing, 0, 0)];
    }
    return _resultCountDownButton;
}

- (UIButton *)serviceButton {
    if (!_serviceButton) {
        _serviceButton = [UIButton newAutoLayoutView];
        _serviceButton.layer.cornerRadius = 20.5;
        _serviceButton.backgroundColor = DPWhiteColor;
        [_serviceButton setImage:[UIImage imageNamed:@"telephone"] forState:0];
        
        [_serviceButton addAction:^(UIButton *btn) {
            NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"13162521916"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        }];
    }
    return _serviceButton;
}

- (OrderResultMessageView *)resultMessageView {
    if (!_resultMessageView) {
        _resultMessageView = [OrderResultMessageView newAutoLayoutView];
    }
    return _resultMessageView;
}

- (UIButton *)unlockButton {
    if (!_unlockButton) {
        _unlockButton = [UIButton newAutoLayoutView];
        _unlockButton.backgroundColor = DPRedColor;
        [_unlockButton setTitle:@"开锁用车" forState:0];
        [_unlockButton setTitleColor:DPWhiteColor forState:0];
        _unlockButton.titleLabel.font = DPFont6;
        _unlockButton.backgroundColor = DPBlueColor;
        _unlockButton.layer.cornerRadius = 6;
        _unlockButton.layer.masksToBounds = YES;
        
        DPWeakSelf;
        [_unlockButton addAction:^(UIButton *btn) {
            
            //1.需要同意《租车合同》
            if (!weakself.resultMessageView.markButton.selected) {
                //2.订单详情
                if (weakself.resultArray.count > 0) {
                    
                    AvailableOrderModel *model = weakself.resultArray[0];
                    [weakself showUnlockViewWithModel:model];
                }
            }else{
                [weakself showHint:@"请先同意《租车合同》"];
            }

//            [weakself showHint:@"面部识别"];
//
//            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//                UIImagePickerController *imageController = [[UIImagePickerController alloc]init];
//                imageController.delegate = weakself;
//                imageController.allowsEditing = YES;
//                imageController.sourceType = UIImagePickerControllerSourceTypeCamera;
//                [weakself presentViewController:imageController animated:YES completion:nil];
//            }

            
            
        }];
    }
    return _unlockButton;
}

- (MapAreaImageView *)mapAreaView {
    if (!_mapAreaView) {
        _mapAreaView = [MapAreaImageView newAutoLayoutView];
    }
    return _mapAreaView;
}

- (AMapNaviWalkManager *)walkManager {
    if (!_walkManager) {
        _walkManager = [[AMapNaviWalkManager alloc] init];
        _walkManager.delegate = self;
    }
    return _walkManager;
}

- (NSMutableArray *)resultArray {
    if (!_resultArray) {
        _resultArray = [NSMutableArray array];
    }
    return _resultArray;
}

#pragma mark - method
- (void)addRightNavAction {
    
    DPWeakSelf;
    [self showMenuViewInView:self.view finishBlock:^(NSString *cate) {
//        [weakself showHint:cate];
        if ([cate isEqualToString:@"取消订单"]) {
            
            UIAlertController *cancelAlertController = [UIAlertController alertControllerWithTitle:nil message:@"确认取消订单？" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *act0 = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (weakself.resultArray.count > 0) {
                    [weakself cancelTheOrder];
                }
            }];
            [cancelAlertController addAction:act0];
            
            UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
            [cancelAlertController addAction:act1];
            
            [weakself presentViewController:cancelAlertController animated:YES completion:nil];
            
        }else if ([cate isEqualToString:@"车况上报"]){
            OrderResultQuestionViewController *orderResultQuestionVC = [[OrderResultQuestionViewController alloc] init];
            [weakself.navigationController pushViewController:orderResultQuestionVC animated:YES];
        }
    }];
}


- (void)layoutConstraints {
    [self.orderResultMapView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.orderResultMapView autoPinToTopLayoutGuideOfViewController:self withInset:0];
    
    if ([self.direction isEqualToString:@"1"]) {//预订成功
        
        [self.resultRemindView autoPinToTopLayoutGuideOfViewController:self withInset:DPMiddleSpacing];
        [self.resultRemindView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        [self.resultRemindView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.resultRemindView autoSetDimension:ALDimensionHeight toSize:70];
        
    }else if ([self.direction isEqualToString:@"2"]){//查看订单
        [self.resultCountDownButton autoPinToTopLayoutGuideOfViewController:self withInset:DPMiddleSpacing];
        [self.resultCountDownButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
        [self.resultCountDownButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [self.resultCountDownButton autoSetDimension:ALDimensionHeight toSize:45];
    }
    
    [self.serviceButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.resultMessageView];
    [self.serviceButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.resultMessageView withOffset:-DPMiddleSpacing];
    [self.serviceButton autoSetDimensionsToSize:CGSizeMake(41, 41)];
    
    [self.resultMessageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.unlockButton];
    [self.resultMessageView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.unlockButton];
    [self.resultMessageView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.unlockButton withOffset:-DPSmallSpacing];
    [self.resultMessageView autoSetDimension:ALDimensionHeight toSize:220];
    
    if (IS_IPHONE_X) {
        [self.unlockButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, DPMiddleSpacing, DPMiddleSpacing+DangerArea, DPMiddleSpacing) excludingEdge:ALEdgeTop];
        [self.unlockButton autoSetDimension:ALDimensionHeight toSize:50];
        
        [self.mapAreaView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.mapAreaView autoSetDimension:ALDimensionHeight toSize:DPBigSpacing+DangerArea];
        
    }else{
        [self.unlockButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, DPMiddleSpacing, DPMiddleSpacing, DPMiddleSpacing) excludingEdge:ALEdgeTop];
        [self.unlockButton autoSetDimension:ALDimensionHeight toSize:50];
        
        [self.mapAreaView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.mapAreaView autoSetDimension:ALDimensionHeight toSize:DPBigSpacing];
    }
    
    
}

- (void) getOrderDetailMessage{
    NSString *availableOrderString = [NSString stringWithFormat:@"%@%@/%@/%f/%f",DPBaseUrl,DPCarOfAvailableMessage,DPToken,self.userCoordinate.latitude,self.userCoordinate.longitude];
    
    DPWeakSelf;
    [self requestDataGetWithString:availableOrderString params:nil successBlock:^(id responseObject) {
        
        AvailableOrderResponse *response = [AvailableOrderResponse mj_objectWithKeyValues:responseObject];
        
        if ([response.status isEqualToString:@"200"]) {

//            if (!response.data.unlocktime) {//表示已开锁
//                [weakself showCheckView];
//            }else{
                //未开锁过
                [weakself.serviceButton setHidden:NO];
                [weakself.resultMessageView setHidden:NO];
                [weakself.unlockButton setHidden:NO];
                
                AvailableOrderModel *availableModel = response.data;
                [weakself.resultArray addObject:response.data];
                
                //参数
                weakself.oidString = availableModel.oid;
                weakself.oilString = availableModel.oilmass;
                
                //title
                if ([weakself.direction isEqualToString:@"1"]) {
                    weakself.title = @"预定成功";
                }else{
                    weakself.title = availableModel.car_code;
                }
                
                //remind
                //            截止日期
                NSString *ttiit = [NSString stringWithFormat:@"%ld",[availableModel.addtime integerValue] + 1800];
                NSString *timetime = [NSDate getHmFormatterTime:ttiit];
                
                if ([weakself.direction isEqualToString:@"1"]) {//
                    [weakself.resultRemindView setHidden:NO];
                    weakself.resultRemindView. remindLabel.attributedText = [NSString setAttributeOfFirstString:@"请在" firstFont:DPFont3 firstColor:DPLightGrayColor secondString:timetime secondFont:DPFont3 secondColor:DPBlueColor thirdString:@"前完成开锁，超时订单将自动取消" thirdFont:DPFont3 thirdColor:DPLightGrayColor];
                    
                }else{
                    [weakself.resultCountDownButton setHidden:NO];
                    
                    NSMutableAttributedString *time = [NSString setAttributeOfFirstString:@"  将为您预留半小时，请在" firstFont:DPFont3 firstColor:DPDarkGrayColor secondString:timetime secondFont:DPFont3 secondColor:DPBlueColor thirdString:@"前完成开锁" thirdFont:DPFont3 thirdColor:DPDarkGrayColor];
                    [weakself.resultCountDownButton setAttributedTitle:time forState:0];
                    [weakself.resultCountDownButton setImage:[UIImage imageNamed:@"car_return"] forState:0];
                }
                
                //信息显示
                weakself.resultMessageView.serviceLabel.text = [NSString stringWithFormat:@"%@ · 服务点",availableModel.qcaddress];
                weakself.resultMessageView.addressLabel.text = availableModel.upaddress;
                
                NSString *imgimg = [NSString stringWithFormat:@"%@%@",DPBaseUrl,availableModel.img];
                [weakself.resultMessageView.carImageView sd_setImageWithURL:[NSURL URLWithString:imgimg] placeholderImage:[UIImage imageNamed:@""]];
                
                NSString *code = [NSString stringWithFormat:@"%@  ",availableModel.car_code];
                weakself.resultMessageView.nameLabel.attributedText = [NSString setAttributeOfFirstString:code firstFont:DPFont4 firstColor:DPBlackColor secondString:availableModel.car_name secondFont:DPFont2 secondColor:DPLightGrayColor7];
                
                weakself.resultMessageView.oilLabel.text = [NSString stringWithFormat:@"  油量%@  ",availableModel.oilmass];
                
                weakself.resultMessageView.colorLabel.text = [NSString stringWithFormat:@"  %@  ",availableModel.color];
                
                weakself.resultMessageView.siteLabel.text = [NSString stringWithFormat:@"  %@座  ",availableModel.sites];
                
                //路线规划
                [weakself startRoutePlanning];
            }
            
            
//        }
    } andFailBlock:^(NSError *error) {
        
    }];
}

//上传图片
- (void)requestDataPostImageWithString:(NSString *)string params:(NSDictionary *)params successBlock:(void (^)(id))successBlock andFailBlock:(void (^)(NSError *))failBlock {
    [self showHudInView:self.view hint:@"请稍后"];
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    //    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/htDP", nil];
    
    //设置超时时间
    [session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    session.requestSerializer.timeoutInterval = 5.f;
    [session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         nil];
    
    
    DPWeakSelf;
    [session POST:string parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakself hideHud];
        
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [weakself hideHud];
        [weakself showHint:@"请检查网络"];
    }];
}


//开锁弹出框
- (void) showUnlockViewWithModel:(AvailableOrderModel *)model {
    [self hiddenBlurView];
    
    UIView *tagView  = [self.view viewWithTag:9999];
    self.unlockView = [self.view viewWithTag:9998];
    
    if (!tagView) {
//        tagView.translatesAutoresizingMaskIntoConstraints = NO;
//        // 磨砂效果
//        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
//        // 磨砂视图
//        tagView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//        tagView.tag = 9999;
        tagView = [UIView newAutoLayoutView];
        tagView.tag = 9999;
        tagView.backgroundColor = UIColorFromRGB1(0x000000, 0.5);
        
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        [window addSubview:tagView];
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        self.unlockView = [OrderResultUnlockView newAutoLayoutView];
        [tagView addSubview:self.unlockView];
        [self.unlockView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.unlockView autoSetDimension:ALDimensionHeight toSize:400];
        [self.unlockView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:27.5];
        [self.unlockView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:27.5];
        
        //显示
        self.unlockView.nameLabel.attributedText = [NSString setAttributeOfFirstString:model.car_code firstFont:DPFont4 firstColor:DPBlackColor secondString:@"  |  " secondFont:DPFont4 secondColor:DPLightGrayColor8 thirdString:model.car_name thirdFont:DPFont4 thirdColor:DPDarkGrayColor];
        self.unlockView.colorLabel.text = [NSString stringWithFormat:@"  %@  ",model.color];
        self.unlockView.siteLabel.text = [NSString stringWithFormat:@"  %@个座位  ",model.sites];
        self.unlockView.autoLabel.text = [NSString stringWithFormat:@"  %@  ",@"自动挡"];
        NSString *sdsd = [NSString stringWithFormat:@"%@%@",DPBaseUrl,model.img];
        [self.unlockView.carImageView sd_setImageWithURL:[NSURL URLWithString:sdsd] placeholderImage:[UIImage imageNamed:@""]];
        [self.unlockView.unlockButton setImage:[UIImage imageNamed:@"unlock_click"] forState:0];
        
//        if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
//            UIControl *tapControl1 = [UIControl newAutoLayoutView];
//            [tagView addSubview:tapControl1];
//            [tapControl1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
//            [tapControl1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.unlockView];
//            [tapControl1 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
//
//            UIControl *tapControl2 = [UIControl newAutoLayoutView];
//            [tagView addSubview:tapControl2];
//            [tapControl2 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
//            [tapControl2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.unlockView];
//            [tapControl2 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
//        }
        
        DPWeakSelf;
        self.unlockView.didSelectedBtn = ^(NSInteger tag) {
            if (tag ==89) {//关闭
                [weakself hiddenBlurView];
            }else{//点击开锁
                //正在开锁中
                [weakself.unlockView.unlockButton setImage:[UIImage imageNamed:@"unlock_ing"] forState:0];
                weakself.unlockView.unlockLabel.text = @"正在开锁中…";
                

                
                //已成功开锁
//                [unlockView.unlockButton setImage:[UIImage imageNamed:@"unlock_success"] forState:0];
//                unlockView.unlockLabel.text = @"已成功开锁";
//                unlockView.unlockLabel.textColor = DPBlueColor;
                
                [weakself startToUnlockingOfType:@"unlock"];
            }
        };
    }
}

//车辆检查
- (void) showCheckView {
    [self hiddenBlurView];
    
    UIView *tagView  = [self.view viewWithTag:9999];
    self.checkView = [self.view viewWithTag:9998];
    
    if (!tagView) {
        tagView = [UIView newAutoLayoutView];
        tagView.tag = 9999;
        tagView.backgroundColor = UIColorFromRGB1(0x000000, 0.5);
        
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        [window addSubview:tagView];
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        self.checkView = [OrderResultCheckView newAutoLayoutView];
        [tagView addSubview:self.checkView];
        [self.checkView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.checkView autoSetDimension:ALDimensionHeight toSize:380];
        [self.checkView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:27.5];
        [self.checkView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:27.5];
        
        //remind内容
        //倒计时
        _orderValue = 600;
        _checkTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTheCountDownWithTimeOfOrder) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_checkTimer forMode:NSRunLoopCommonModes];
        
        //提示文字
        self.checkView.attentionLabel.attributedText = [NSString setAttributeOfFirstString:@"请在10分钟内完成验车，过时或自行移动车辆，\n" firstFont:DPFont4 firstColor:DPDarkGrayColor secondString:@"将视为验车通过，并开始计费" secondFont:DPFont4 secondColor:DPGrayColor align:1 space:DPMiddleSpacing];

        
        
//        if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
//            UIControl *tapControl1 = [UIControl newAutoLayoutView];
//            [tagView addSubview:tapControl1];
//            [tapControl1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
//            [tapControl1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:checkView];
//            [tapControl1 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
//
//            UIControl *tapControl2 = [UIControl newAutoLayoutView];
//            [tagView addSubview:tapControl2];
//            [tapControl2 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
//            [tapControl2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:checkView];
//            [tapControl2 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
//        }
    }

    DPWeakSelf;
    self.checkView.didSelectedBtn = ^(NSInteger tag) {
        [weakself hiddenBlurView];
        if (tag == 47) {//故障上报
            OrderResultQuestionViewController *orderResultQuestionVC = [[OrderResultQuestionViewController alloc] init];
            orderResultQuestionVC.oid = weakself.oidString;
            [weakself.navigationController pushViewController:orderResultQuestionVC animated:YES];
        }else{//车辆正常
             [weakself startToUnlockingOfType:@"clickcharging"];
        }
    };
}

- (void)hiddenBlurView {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIView *tagView = [window viewWithTag:9999];
    if (tagView) {
        [tagView removeFromSuperview];
    }
}

//面部识别
- (void) startToFaceRecognitionWithImage:(UIImage *)img {
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    //    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/htDP", nil];
    
    //设置超时时间
    [session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    session.requestSerializer.timeoutInterval = 5.f;
    [session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         nil];
    
    NSString *faceString = [NSString stringWithFormat:@"%@%@/%@",DPBaseUrl,DPCarDetailsOfFaceRecognition,DPToken];
    
    DPWeakSelf;
    [session POST:faceString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

//开始开锁
- (void) startToUnlockingOfType:(NSString *)type {
    
    NSString *unlockString = [NSString stringWithFormat: @"%@%@/%@",DPBaseUrl,DPCarDetailsOfUnlock,DPToken];
    
    NSDictionary *params = @{
        @"oid"  :  self.oidString,
        @"mark" : type,
        @"soil" : self.oilString
    };
    
    DPWeakSelf;
    [self requestDataPostWithString:unlockString params:params successBlock:^(id responseObject) {
       
        BaseModel *unlockModel = [BaseModel mj_objectWithKeyValues:responseObject];
        
        [weakself showHint:unlockModel.info];
        if ([unlockModel.status isEqualToString:@"200"]) {
            
            if ([type isEqualToString:@"unlock"]) {//开锁
                
                [weakself.unlockView.unlockButton setImage:[UIImage imageNamed:@"unlock_success"] forState:0];
                weakself.unlockView.unlockLabel.text = @"已成功开锁";
                weakself.unlockView.unlockLabel.textColor = DPBlueColor;
                
                [weakself performSelector:@selector(hiddenBlurView) withObject:nil afterDelay:1];
                [weakself performSelector:@selector(showCheckView) withObject:nil afterDelay:2];

//                [weakself hiddenBlurView];
                
//                [weakself showCarCheckViewInView:weakself.view finishBlock:^(NSString *check) {
//                    if ([check isEqualToString:@"故障上报"]) {
//                        OrderResultQuestionViewController *orderResultQuestionVC = [[OrderResultQuestionViewController alloc] init];
//                        [weakself.navigationController pushViewController:orderResultQuestionVC animated:YES];
//
//                    }else if ([check isEqualToString:@"车辆正常"]){
//                        [weakself startToUnlockingOfType:@"clickcharging"];
//                    }
//                }];
                
//                [weakself showCheckView];
                
            }else if([type isEqualToString:@"clickcharging"]){//检查车辆正常
                [weakself.navigationController popViewControllerAnimated:YES];
            }
        }
    } andFailBlock:^(NSError *error) {
        
    }];
    
}

#pragma mark - image picker delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
//    self.imageHandler(image);
    
    [self startToFaceRecognitionWithImage:image];
}

//取消订单
- (void) cancelTheOrder {
    NSString *unlockString = [NSString stringWithFormat: @"%@%@/%@",DPBaseUrl,DPCarDetailsOfUnlock,DPToken];
    
    NSDictionary *params = @{
                         @"oid"  :  self.oidString,
                         @"mark" : @"discard",
                         };
    
    DPWeakSelf;
    [self requestDataPostWithString:unlockString params:params successBlock:^(id responseObject) {
        BaseModel *mo = [BaseModel mj_objectWithKeyValues:responseObject];
        
        [weakself showHint:mo.info];
        
        if ([mo.status isEqualToString:@"200"]) {
            [weakself.navigationController popViewControllerAnimated:YES];
        }
    } andFailBlock:^(NSError *error) {
        
    }];
}
    
    

////倒计时10分钟
//- (void) startTheCountDownWithTimeOfOrder {
//    AvailableOrderModel *orderModel = self.currentArray[0];
//
//    //当前时间戳
//    NSDate *currentDate = [NSDate date];
//    NSString *currentString = [NSString stringWithFormat:@"%f",[currentDate timeIntervalSince1970]];
//
//    //差值：addtime + 1800秒 - 当前时间戳 = 倒计时时间
//    NSInteger value = [orderModel.addtime integerValue] + 1800 - [currentString integerValue];
//
//    NSString *ssssss;
//    value--;
//    if (value > 0) {//倒计时未结束
//        ssssss = [NSString stringWithFormat:@"%02ld:%02ld\n",value/60,value%60];
//        [self.mainOrderRemindWantView.countdownButton setTitle:ssssss forState:0];
//    }else{
//        [_checkTimer invalidate];
//    }
//}

#pragma mark - map delegate
//路线规划
- (void) startRoutePlanning {
    
//    CLLocationCoordinate2D startCoordinate = {31.231886,121.456224};
//    CLLocationCoordinate2D endCoordinate = {31.231880,121.456220};
//
//    AMapWalkingRouteSearchRequest *navi = [[AMapWalkingRouteSearchRequest alloc] init];
//
//    //    navi.requireExtension = YES;
//    //    navi.strategy = 5;
//    /* 出发点. */
//    navi.origin = [AMapGeoPoint locationWithLatitude:startCoordinate.latitude
//                                           longitude:startCoordinate.longitude];
//    /* 目的地. */
//    navi.destination = [AMapGeoPoint locationWithLatitude:endCoordinate.latitude
//                                                longitude:endCoordinate.longitude];
//
//    [self.search AMapWalkingRouteSearch:navi];
    
    AMapNaviPoint *startPoint = [[AMapNaviPoint alloc] init];
    startPoint.latitude = 31.231886;
    startPoint.longitude = 121.456224;
    AMapNaviPoint *endPoint = [[AMapNaviPoint alloc] init];
    endPoint.latitude = 31.231886;
    endPoint.longitude = 121.455214;

    [self.walkManager calculateWalkRouteWithStartPoints:@[startPoint] endPoints:@[endPoint]];
}

- (void)walkManagerOnCalculateRouteSuccess:(AMapNaviWalkManager *)walkManager
{
    NSLog(@"onCalculateRouteSuccess");
    
    //显示路径或开启导航
//    [[AMapNaviWalkManager sha] startGPSNavi];
//    NSArray *sss = [walkManager getNaviGuideList];
    [self.walkManager startGPSNavi];
}

- (void)dealloc
{

    [self.walkManager stopNavi];
    self.walkManager.delegate = nil;
//    [AMapNaviWalkManager destroyInstance];
    
//    [[AMapNaviWalkManager sharedInstance] stopNavi];
//    [[AMapNaviDriveManager sharedInstance] removeDataRepresentative:self.driveView];
//    [[AMapNaviDriveManager sharedInstance] setDelegate:nil];
//
//    BOOL success = [AMapNaviDriveManager destroyInstance];
//    NSLog(@"单例是否销毁成功 : %d",success);
}


//倒计时10分钟
- (void) startTheCountDownWithTimeOfOrder {
    
    NSString *ssssss;
    _orderValue--;
    
    if (_orderValue > 0) {//倒计时未结束
        ssssss = [NSString stringWithFormat:@"00:%02ld:%02ld",_orderValue/60,_orderValue%60];
        self.checkView.remindLabel.text = ssssss;
    }else{
        self.checkView.remindLabel.text = @"00:00:00";
        [_checkTimer invalidate];
        [self.navigationController popViewControllerAnimated:YES];
    }
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
