//
//  UIViewController+Blur.m
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "UIViewController+Blur.h"
#import "OrderResultMoreView.h"
#import "OrderGenerateTimeView.h"
#import "OrderResultUnlockView.h"
#import "OrderResultCheckView.h"
#import "MainOrderRemindReturnConfirmView.h"
#import "MineUserScoreExchangeResultView.h"
#import "AuthentyMessageView.h"
#import "MainUserCenterView.h"
#import "MainOrderRemindCostDetailView.h"
#import "MainOrderRemindPayResultView.h"
#import "InvoiceGenerateRemindView.h"  //公共弹框
#import "MainOrderRemindPayPWDView.h" //密码支付弹窗
#import "BankValidView.h"   //绑定银行卡-选择有效期


#import "MainUpCarView.h"

@implementation UIViewController (Blur)

- (void)showMenuViewInView:(UIView *)view finishBlock:(void (^)(NSString *))finishBlock {
    [self hiddenBlurView];
    
    UIView *tagView = [self.view viewWithTag:9999];
    OrderResultMoreView *moreView = [self.view viewWithTag:9998];
    
    if (!tagView) {
        tagView = [UIView newAutoLayoutView];
        tagView.tag = 9999;
        tagView.backgroundColor = UIColorFromRGB1(0x000000, 0.5);
        
        if (!view) {
            view = self.view;
        }
        
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        [window addSubview:tagView];
        
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        moreView = [OrderResultMoreView newAutoLayoutView];
        [tagView addSubview:moreView];
        
        [moreView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
        [moreView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:64];
        [moreView autoSetDimensionsToSize:CGSizeMake(120, 80)];
    }
    
    
    if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
        UIControl *tapControl = [UIControl newAutoLayoutView];
        [tagView addSubview:tapControl];
        
        [tapControl autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [tapControl autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:moreView];
        
        [tapControl addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
    }
    
    DPWeakSelf;
    if (finishBlock) {
        [moreView setDidSelectedBtn:^(NSString *cate) {
            [weakself hiddenBlurView];
            finishBlock(cate);
        }];
    }
    
}

- (void)showDatePickerViewInView:(UIView *)view finishBlock:(void (^)(NSString *))finishBlock {
    
    [self hiddenBlurView];
    
    UIView *tagView = [self.view viewWithTag:9999];
    OrderGenerateTimeView *generateTimeView = [self.view viewWithTag:9998];
    
    if (!tagView) {
        tagView = [UIView newAutoLayoutView];
        tagView.tag = 9999;
        tagView.backgroundColor = UIColorFromRGB1(0x000000, 0.5);
        
        if (!view) {
            view = self.view;
        }
        
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        [window addSubview:tagView];
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        generateTimeView = [OrderGenerateTimeView newAutoLayoutView];
        [tagView addSubview:generateTimeView];
        
        [generateTimeView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [generateTimeView autoSetDimension:ALDimensionHeight toSize:290];
    }
    
    DPWeakSelf;
    if (finishBlock) {
        [generateTimeView setDidSelectedBtn:^(NSString *idd) {
            if ([idd isEqualToString:@"取消"]) {
                [weakself hiddenBlurView];
            }else if([idd isEqualToString:@"确定"]){
                 [weakself hiddenBlurView];
                finishBlock(idd);
            }else{
                [weakself hiddenBlurView];
                finishBlock(idd);
            }
        }];
    }
}

- (void)showBankValidDatePickerViewInView:(UIView *)view finishBlock:(void (^)(NSString *))finishBlock {
    
    [self hiddenBlurView];
    
    UIView *tagView = [self.view viewWithTag:9999];
    BankValidView *bankTimeView = [self.view viewWithTag:9998];
    
    if (!tagView) {
        tagView = [UIView newAutoLayoutView];
        tagView.tag = 9999;
        tagView.backgroundColor = UIColorFromRGB1(0x000000, 0.5);
        
        if (!view) {
            view = self.view;
        }
        
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        [window addSubview:tagView];
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        bankTimeView = [BankValidView newAutoLayoutView];
        [tagView addSubview:bankTimeView];
        
        [bankTimeView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [bankTimeView autoSetDimension:ALDimensionHeight toSize:290];
    }
    
    DPWeakSelf;
    if (finishBlock) {
        [bankTimeView setDidSelectedBtn:^(NSString *idd) {
            if ([idd isEqualToString:@"取消"]) {
                [weakself hiddenBlurView];
            }else if([idd isEqualToString:@"确定"]){
                [weakself hiddenBlurView];
                finishBlock(idd);
            }else{
                [weakself hiddenBlurView];
                finishBlock(idd);
            }
        }];
    }
}

- (void)showUnlockViewInView:(UIView *)view WithOrderModel:(AvailableOrderModel *)model finishBlock:(void (^)(NSString *))finishBlock {
    
      [self hiddenBlurView];
    
    FXBlurView *tagView  = [self.view viewWithTag:9999];
    OrderResultUnlockView *unlockView = [self.view viewWithTag:9998];
    
    if (!tagView) {
//        tagView.translatesAutoresizingMaskIntoConstraints = NO;
//        // 磨砂效果
//        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
//        // 磨砂视图
//        tagView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//        tagView.tag = 9999;
        tagView = [FXBlurView newAutoLayoutView];
        tagView.dynamic = NO;
        tagView.tag = 9999;
        tagView.backgroundColor = UIColorFromRGB1(0x000000, 0.5);
        
        if (!view) {
            view = self.view;
        }
        
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        [window addSubview:tagView];
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        unlockView = [OrderResultUnlockView newAutoLayoutView];
        [tagView addSubview:unlockView];
        [unlockView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [unlockView autoSetDimension:ALDimensionHeight toSize:380];
        [unlockView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25];
        [unlockView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25];
        
        //显示
//        NSString *code = [NSString stringWithFormat:@"%@  ",model.car_code];
        unlockView.nameLabel.attributedText = [NSString setAttributeOfFirstString:model.car_code firstFont:DPFont4 firstColor:DPBlackColor secondString:@"  |  " secondFont:DPFont4 secondColor:DPLightGrayColor8 thirdString:model.car_name thirdFont:DPFont4 thirdColor:DPDarkGrayColor];
        unlockView.colorLabel.text = [NSString stringWithFormat:@"  %@  ",model.color];
//        @"  白色  ";
        unlockView.siteLabel.text = [NSString stringWithFormat:@"  %@个座位  ",model.sites];
//        @"  5个座位  ";
        unlockView.autoLabel.text = [NSString stringWithFormat:@"  %@  ",@"自动挡"];
//        @"  自动挡  ";
        NSString *sdsd = [NSString stringWithFormat:@"%@%@",DPBaseUrl,model.img];
        [unlockView.carImageView sd_setImageWithURL:[NSURL URLWithString:sdsd] placeholderImage:[UIImage imageNamed:@""]];

        
        if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
            UIControl *tapControl1 = [UIControl newAutoLayoutView];
            [tagView addSubview:tapControl1];
            [tapControl1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
            [tapControl1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:unlockView];
            [tapControl1 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
            
            UIControl *tapControl2 = [UIControl newAutoLayoutView];
            [tagView addSubview:tapControl2];
            [tapControl2 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
            [tapControl2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:unlockView];
            [tapControl2 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
            
        }
    }
    
//    finishBlock
    DPWeakSelf;
    if (finishBlock) {
        [unlockView setDidSelectedBtn:^(NSInteger tag) {
            if (tag == 89) {
                [weakself hiddenBlurView];
            }else{
                [weakself hiddenBlurView];
                finishBlock(@"开锁");
            }
        }];
    }
    
}

- (void)showCarCheckViewInView:(UIView *)view finishBlock:(void (^)(NSString *))finishBlock {
    
      [self hiddenBlurView];
    
    UIView *tagView  = [self.view viewWithTag:9999];
    OrderResultCheckView *unlockView = [self.view viewWithTag:9998];
    
    if (!tagView) {
        tagView = [UIView newAutoLayoutView];
        tagView.tag = 9999;
        tagView.backgroundColor = UIColorFromRGB1(0x000000, 0.5);
        
        if (!view) {
            view = self.view;
        }
        
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        [window addSubview:tagView];
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        unlockView = [OrderResultCheckView newAutoLayoutView];
        [tagView addSubview:unlockView];
        [unlockView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [unlockView autoSetDimension:ALDimensionHeight toSize:380];
        [unlockView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25];
        [unlockView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25];
        
        
        //内容显示
        unlockView.confirmImageView.image = [UIImage imageNamed:@"return_remind"];
        unlockView.remindLabel.text = @"注意事项";
        unlockView.attentionLabel.attributedText = [NSString setAttributeOfFirstString:@"确认还车后，车辆将立即锁车\n" firstFont:DPFont4 firstColor:DPDarkGrayColor secondString:@"请将车钥匙放回原处，并确定您站在车外" secondFont:DPFont4 secondColor:DPGrayColor align:1 space:DPMiddleSpacing];
        [unlockView.notReturnButton setTitle:@"暂不还车" forState:0];
        [unlockView.returnButton setTitle:@"确认还车" forState:0];

        
//        if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
//            UIControl *tapControl1 = [UIControl newAutoLayoutView];
//            [tagView addSubview:tapControl1];
//            [tapControl1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
//            [tapControl1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:unlockView];
//            [tapControl1 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
//
//            UIControl *tapControl2 = [UIControl newAutoLayoutView];
//            [tagView addSubview:tapControl2];
//            [tapControl2 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
//            [tapControl2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:unlockView];
//            [tapControl2 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
//
//        }
    }
    
    //    finishBlock
    DPWeakSelf;
    if (finishBlock) {
        [unlockView setDidSelectedBtn:^(NSInteger tag) {
            [weakself hiddenBlurView];
            if (tag == 48) {//确认还车
                finishBlock(@"确认还车");
            }
        }];
    }
}

- (void)showCarReturnConfirmViewInView:(UIView *)view finishBlock:(void (^)(NSString *))finishBlock {
    
      [self hiddenBlurView];
    
    UIView *tagView  = [self.view viewWithTag:9999];
    MainOrderRemindReturnConfirmView *returnConfirmView = [self.view viewWithTag:9998];
    
    if (!tagView) {
        tagView = [UIView newAutoLayoutView];
        tagView.tag = 9999;
        tagView.backgroundColor = UIColorFromRGB1(0x000000, 0.5);
        
        if (!view) {
            view = self.view;
        }
        
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        [window addSubview:tagView];
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        returnConfirmView = [MainOrderRemindReturnConfirmView newAutoLayoutView];
        [tagView addSubview:returnConfirmView];
        [returnConfirmView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [returnConfirmView autoSetDimension:ALDimensionHeight toSize:380];
        [returnConfirmView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25];
        [returnConfirmView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25];
        
        if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
            UIControl *tapControl1 = [UIControl newAutoLayoutView];
            [tagView addSubview:tapControl1];
            [tapControl1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
            [tapControl1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:returnConfirmView];
            [tapControl1 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
            
            UIControl *tapControl2 = [UIControl newAutoLayoutView];
            [tagView addSubview:tapControl2];
            [tapControl2 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
            [tapControl2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:returnConfirmView];
            [tapControl2 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    DPWeakSelf;
    [returnConfirmView setDidSelectedBtn:^(NSInteger tag) {
        [weakself hiddenBlurView];
        if (finishBlock) {
            if (tag == 47){
                finishBlock(@"暂不还车");
            }else if (tag == 48){
                finishBlock(@"确认还车");
            }
        }
    }];
    
//    if (finishBlock) {
//        [returnConfirmView setDidSelectedBtn:^(NSInteger tag) {
//            [weakself hiddenBlurView];
//            if (tag == 47){
//                finishBlock(@"暂不还车");
//            }else if (tag == 48){
//                finishBlock(@"确认还车");
//            }
//        }];
//    }
    
}

- (void)showScoreExchangeViewInView:(UIView *)view withMoney:(NSString *)money finishBlock:(void (^)(NSString *))finishBlock {
    [self hiddenBlurView];
    
    UIView *tagView  = [self.view viewWithTag:9999];
    MineUserScoreExchangeResultView *scoreExchangeView = [self.view viewWithTag:9998];
    
    if (!tagView) {
        tagView = [UIView newAutoLayoutView];
        tagView.tag = 9999;
        tagView.backgroundColor = UIColorFromRGB1(0x000000, 0.5);
        
        if (!view) {
            view = self.view;
        }
        
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        [window addSubview:tagView];
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        scoreExchangeView = [MineUserScoreExchangeResultView newAutoLayoutView];
        [tagView addSubview:scoreExchangeView];
        [scoreExchangeView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [scoreExchangeView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [scoreExchangeView autoSetDimension:ALDimensionHeight toSize:270];
        [scoreExchangeView autoSetDimension:ALDimensionWidth toSize:280];
        scoreExchangeView.scoreLabel.text = [NSString stringWithFormat:@"已成功兑换%@元抵用券",money];

//        if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
//            UIControl *tapControl1 = [UIControl newAutoLayoutView];
//            [tagView addSubview:tapControl1];
//            [tapControl1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
//            [tapControl1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:scoreExchangeView];
//            [tapControl1 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
//
//            UIControl *tapControl2 = [UIControl newAutoLayoutView];
//            [tagView addSubview:tapControl2];
//            [tapControl2 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
//            [tapControl2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:scoreExchangeView];
//            [tapControl2 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
//        }
    }
    
    DPWeakSelf;
    [scoreExchangeView setDidSelectedBtn:^(NSInteger tag) {
        [weakself hiddenBlurView];
        if (finishBlock) {
            if (tag == 456) {
                finishBlock(@"关闭");
            }if (tag == 457){
                finishBlock(@"现在用车");
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

- (void) hiddenBlurViewhiddenBlurView {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    FXBlurView *tagView = [window viewWithTag:9999];
    if (tagView) {
        [tagView removeFromSuperview];
    }
}

- (void)showMainAvailableCarListViewInView:(UIView *)view array:(NSArray *)carList finishBlock:(void (^)(NSString *, NSString *))finishBlock {
    
      [self hiddenBlurView];
    
     MainUpCarView *mainUpCarView = [self.view viewWithTag:9998];
    
    if (!view) {
        view = self.view;
    }
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [window addSubview:mainUpCarView];
    
    mainUpCarView = [MainUpCarView newAutoLayoutView];
    
    [mainUpCarView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:view];
    [mainUpCarView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:view withOffset:DPMiddleSpacing];
    [mainUpCarView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:view withOffset:-DPMiddleSpacing];
    [mainUpCarView autoSetDimension:ALDimensionHeight toSize:270];
    
    
//    [mainUpCarView reloadData:carList];
    
    
    if (finishBlock) {
//        [mainUpCarView setDidSelectedItem:^(NSString *text, NSString *cid) {
//            [mainUpCarView removeFromSuperview];
//            finishBlock(text,cid);
//        }];
//        mainUpCarView
    }
}


- (void) showAuthentyViewInView:(UIView *)view andName:(NSString *)name andIDCard:(NSString *)number finishBlock:(void(^)(NSString *unlock))finishBlock {
    [self hiddenBlurView];
    
    UIView *tagView  = [self.view viewWithTag:9999];
    AuthentyMessageView *authentyMessageView = [self.view viewWithTag:9998];
    
    if (!tagView) {
        tagView = [UIView newAutoLayoutView];
        tagView.tag = 9999;
        tagView.backgroundColor = UIColorFromRGB1(0x000000, 0.5);
        
        if (!view) {
            view = self.view;
        }
        
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        [window addSubview:tagView];
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        authentyMessageView = [AuthentyMessageView newAutoLayoutView];
        [tagView addSubview:authentyMessageView];
        [authentyMessageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [authentyMessageView autoSetDimension:ALDimensionHeight toSize:300];
        [authentyMessageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25];
        [authentyMessageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25];
        
        authentyMessageView.nameLabel.attributedText = [NSString setAttributeOfFirstString:@"姓名            " firstFont:DPFont4 firstColor:DPLightGrayColor17 secondString:name secondFont:DPFont4 secondColor:DPDarkGrayColor];
        authentyMessageView.numberLabel.attributedText = [NSString setAttributeOfFirstString:@"身份证号    " firstFont:DPFont4 firstColor:DPLightGrayColor17 secondString:number secondFont:DPFont4 secondColor:DPDarkGrayColor];
        
        
//        if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
//            UIControl *tapControl1 = [UIControl newAutoLayoutView];
//            [tagView addSubview:tapControl1];
//            [tapControl1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
//            [tapControl1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:authentyMessageView];
//            [tapControl1 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
//            
//            UIControl *tapControl2 = [UIControl newAutoLayoutView];
//            [tagView addSubview:tapControl2];
//            [tapControl2 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
//            [tapControl2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:authentyMessageView];
//            [tapControl2 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
//        }
    }
    
    DPWeakSelf;
    [authentyMessageView setDidSelectedBtn:^(NSInteger tag) {
        [weakself hiddenBlurView];
        if (finishBlock) {
            if (tag == 13){
                finishBlock(@"确认完毕");
            }
        }
    }];
}

//首页 - 用户中心
- (void)showMainUserCenterViewInView:(UIView *)view WithModel:(UserModel *)model finishBlock:(void (^)(NSInteger))finishBlock {
    
    [self hiddenBlurView];
    
    UIView *tagView  = [self.view viewWithTag:9999];
    MainUserCenterView *mainUserView = [self.view viewWithTag:9998];
    
    if (!tagView) {
        tagView = [UIView newAutoLayoutView];
        tagView.tag = 9999;
        tagView.backgroundColor = UIColorFromRGB1(0x000000, 0.5);
        
        if (!view) {
            view = self.view;
        }
        
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        [window addSubview:tagView];
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        mainUserView = [MainUserCenterView newAutoLayoutView];
        [tagView addSubview:mainUserView];
        [mainUserView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeRight];
        [mainUserView autoSetDimension:ALDimensionWidth toSize:DPWindowWidth-100];
        mainUserView.userModel = model;
        
        [UIView transitionWithView:view duration:0.5 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            mainUserView.leftTableConstraints.constant = 0;
            [mainUserView layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            
        }];
        
        
        [mainUserView setupMainUserCenterTableView];
        [mainUserView.mainUserCenterTableView reloadData];
        
        if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
            UIControl *tapControl1 = [UIControl newAutoLayoutView];
            [tagView addSubview:tapControl1];
            [tapControl1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeLeft];
            [tapControl1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:mainUserView];
            [tapControl1 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    DPWeakSelf;
    [mainUserView setDidSelectedBtn:^(NSInteger tag) {
        [weakself hiddenBlurView];
        if (finishBlock) {
            finishBlock(tag);
        }
    }];
}

//支付信息
- (void) showMainPayMessageViewInView:(UIView *)view WithModel:(AvailableOrderModel *)model finishBlock:(void(^)(NSInteger tag))finishBlock {
    
    [self hiddenBlurView];
    
    UIView *tagView = [self.view viewWithTag:9999];
    MainOrderRemindCostDetailView *payMessageView = [self.view viewWithTag:9998];
    
    if (!tagView) {
        tagView = [UIView newAutoLayoutView];
        tagView.tag = 9999;
        tagView.backgroundColor = UIColorFromRGB1(0x000000, 0.5);
        
        if (!view) {
            view = self.view;
        }
        
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        [window addSubview:tagView];
        
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        payMessageView = [MainOrderRemindCostDetailView newAutoLayoutView];
        [tagView addSubview:payMessageView];
        [payMessageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [payMessageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25];
        [payMessageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25];
        [payMessageView autoSetDimension:ALDimensionHeight toSize:455];
        
        //显示信息
        payMessageView .rentMoneyLabel.attributedText = [NSString setAttributeOfFirstString:@"  租金（元）\n" firstFont:DPFont3 firstColor:DPGrayColor secondString:model.money secondFont:[UIFont fontWithName:@"PingFangSC-Medium" size:31] secondColor:DPDarkGrayColor align:1 space:5];
        
        
        //计算时间间隔
        NSDate* date = [NSDate dateWithTimeIntervalSince1970:[model.qctime doubleValue]];
        
        NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:[model.hctime doubleValue]];
        
        NSTimeInterval seconds = [date2 timeIntervalSinceDate:date];
        
        NSString *tttttt = [NSString stringWithFormat:@"时长费（%.f分钟） \n",seconds/60];
        
        NSString *day = [NSString stringWithFormat:@"日间时长费：%@元/分钟\n",model.tsmoney];
        NSString *night = [NSString stringWithFormat:@"夜间时长费：%@元/分钟",model.ytmoney];
        payMessageView.shichangLabel.attributedText = [NSString setAttributeOfFirstString:tttttt firstFont:DPFont4 firstColor:DPGrayColor secondString:day secondFont:DPFont2 secondColor:DPLightGrayColor thirdString:night thirdFont:DPFont2 thirdColor:DPLightGrayColor align:0 space:DPSmallSpacing];
        payMessageView.shichangMoneyLabel.text = [NSString stringWithFormat:@"%@元",model.shichangfee];
        
        NSString *llll = [NSString stringWithFormat:@"里程费（%@公里）\n",model.mileage];
        NSString *licheng = [NSString stringWithFormat:@"%@元/公里\n",model.kmoney];
        payMessageView.lichengLabel.attributedText = [NSString setAttributeOfFirstString:llll firstFont:DPFont4 firstColor:DPGrayColor secondString:licheng secondFont:DPFont2 secondColor:DPLightGrayColor align:0 space:DPSmallSpacing];
        payMessageView.lichengMoneyLabel.text = [NSString stringWithFormat:@"%@元",model.kmmoney];
        
        payMessageView.serviceMoneyLabel.text = [NSString stringWithFormat:@"%@元",model.zunxiangmony];
    }
    
    
    if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
        UIControl *tapControl1 = [UIControl newAutoLayoutView];
        [tagView addSubview:tapControl1];
        [tapControl1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [tapControl1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:payMessageView];
        [tapControl1 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
        
        UIControl *tapControl2 = [UIControl newAutoLayoutView];
        [tagView addSubview:tapControl2];
        [tapControl2 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [tapControl2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:payMessageView];
        [tapControl2 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
    }
    
    DPWeakSelf;
    if (finishBlock) {
        [payMessageView setDidSelectedBtn:^(NSInteger tag) {
            [weakself hiddenBlurView];
            if (tag == 334) {//计价规则
                finishBlock(334);
            }else if(tag == 335){//订单疑问
                 finishBlock(335);
            }
        }];
    }
    
}

- (void)showMainPayResultViewInView:(UIView *)view WithModel:(AvailableOrderModel *)model WithResult:(NSString *)result finishBlock:(void (^)(NSInteger))finishBlock {
    
    [self hiddenBlurView];
    
    UIView *tagView = [self.view viewWithTag:9999];
    MainOrderRemindPayResultView *payResultView = [self.view viewWithTag:9998];
    
    if (!tagView) {
        tagView = [UIView newAutoLayoutView];
        tagView.tag = 9999;
        tagView.backgroundColor = UIColorFromRGB1(0x000000, 0.5);
        
        if (!view) {
            view = self.view;
        }
        
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        [window addSubview:tagView];
        
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        payResultView = [MainOrderRemindPayResultView newAutoLayoutView];
        [tagView addSubview:payResultView];
        [payResultView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [payResultView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25];
        [payResultView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25];
        [payResultView autoSetDimension:ALDimensionHeight toSize:450];
        
        //信息显示
        if ([result isEqualToString:@"success"]) {//成功
            payResultView.resultLabel.text = @"支付成功";
        }else if ([result isEqualToString:@"cancel"]){//取消
            payResultView.resultLabel.text = @"支付取消";
        }else{//失败
            payResultView.resultLabel.text = @"支付失败";
        }
        
        payResultView.oidDetailLabel.text = model.oid;
        payResultView.wayLabel.text = @"微信支付";
        payResultView.ticketLabel.text = model.oid;
        payResultView.oidDetailLabel.text = model.oid;

    }
    
    if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
        UIControl *tapControl1 = [UIControl newAutoLayoutView];
        [tagView addSubview:tapControl1];
        [tapControl1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [tapControl1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:payResultView];
        [tapControl1 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
        
        UIControl *tapControl2 = [UIControl newAutoLayoutView];
        [tagView addSubview:tapControl2];
        [tapControl2 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [tapControl2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:payResultView];
        [tapControl2 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
    }
    
    DPWeakSelf;
    if (finishBlock) {
        [payResultView setDidSelectedBtn:^(NSInteger tag) {
            [weakself hiddenBlurView];
            if(tag == 223){//
                finishBlock(223);
            }
        }];
    }
}

- (void) showCommonBlurInView:(UIView *)view andRemindImage:(NSString *)img andRemindString:(NSString *)remindString andLeftAct:(NSString *)leftString leftColor:(UIColor *)leftColor andRightAct:(NSString *)rightString rightColor:(UIColor *)rightColor finishBlock:(void (^)(NSString *))finishBlock {
    
    [self hiddenBlurView];
    
    UIView *tagView = [self.view viewWithTag:9999];
    InvoiceGenerateRemindView *resultRemindView = [self.view viewWithTag:9998];
    
    if (!tagView) {
        tagView = [UIView newAutoLayoutView];
        tagView.tag = 9999;
        tagView.backgroundColor = UIColorFromRGB1(0x000000, 0.5);
        
        if (!view) {
            view = self.view;
        }
        
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        [window addSubview:tagView];
        
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        resultRemindView = [InvoiceGenerateRemindView newAutoLayoutView];
        [tagView addSubview:resultRemindView];
        [resultRemindView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [resultRemindView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [resultRemindView autoSetDimensionsToSize:CGSizeMake(290, 205)];
        
        //信息显示
        resultRemindView.remindImageView.image = [UIImage imageNamed:img];
        [resultRemindView.leftButton setTitle:leftString forState:0];
        [resultRemindView.leftButton setTitleColor:leftColor forState:0];
        [resultRemindView.rightButton setTitle:rightString forState:0];
        [resultRemindView.rightButton setTitleColor:rightColor forState:0];

        NSMutableAttributedString *remindAttribute = [[NSMutableAttributedString alloc] initWithString:remindString];
        [remindAttribute setAttributes:@{NSFontAttributeName:DPFont4,NSForegroundColorAttributeName:DPDarkGrayColor} range:NSMakeRange(0, remindString.length)];
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = 1;
        style.lineSpacing = 8;
        [remindAttribute addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, remindString.length)];
        resultRemindView.remindLabel.attributedText = remindAttribute;
    }
    
    DPWeakSelf;
    if (finishBlock) {
        [resultRemindView setDidSelectedBtn:^(NSInteger tag) {
            [weakself hiddenBlurView];
            if(tag == 335){//
                finishBlock(@"左边");
            }else if (tag == 336){
                finishBlock(@"右边");
            }
        }];
    }
    
}


- (void)showPWDBlurInView:(UIView *)view finishBlock:(void (^)(NSString *))finishBlock {
    [self hiddenBlurView];
    
    UIView *tagView = [self.view viewWithTag:9999];
    MainOrderRemindPayPWDView *pwdView = [self.view viewWithTag:9998];
    
    if (!tagView) {
        tagView = [UIView newAutoLayoutView];
        tagView.tag = 9999;
        tagView.backgroundColor = UIColorFromRGB1(0x000000, 0.5);
        
        if (!view) {
            view = self.view;
        }
        
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        [window addSubview:tagView];
        
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        pwdView = [ MainOrderRemindPayPWDView newAutoLayoutView];
        [pwdView.pwdTextField resignFirstResponder];
        [tagView addSubview:pwdView];
        [pwdView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [pwdView autoSetDimension:ALDimensionHeight toSize:455];
        
        //信息显示
    }
    
    
    if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
        UIControl *tapControl1 = [UIControl newAutoLayoutView];
        [tagView addSubview:tapControl1];
        [tapControl1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [tapControl1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:pwdView];
        [tapControl1 addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
    }
    
    DPWeakSelf;
    if (finishBlock) {
        [pwdView setDidSelectedBtn:^(NSInteger tag) {
            if (tag == 221) {//关闭
                [weakself hiddenBlurView];
            }else if(tag == 222){
                finishBlock(@"忘记密码");
            }
        }];
        
        [pwdView setDidEditting:^(NSString *text) {
            finishBlock(text);
        }];
    }
}

@end
