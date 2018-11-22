//
//  CarPaymentView.h
//  DayParting
//
//  Created by jiamanu on 2018/8/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BasePopView.h"

@interface CarPaymentView : BasePopView

@property (nonatomic,strong) UIView *layerView;  //模糊背景试图

@property (nonatomic,strong) UILabel *moneyLabel;  //租金
@property (nonatomic,strong) UIButton *costDetailButton;  //费用明细

@property (nonatomic,strong) UILabel *ticketLabel;  //优惠券
@property (nonatomic,strong) UIButton *chooseTicketButton;  //选择优惠券

@property (nonatomic,strong) UILabel *lineLabel1;

@property (nonatomic,strong) UILabel *accountLabel;  //账户余额
//@property (nonatomic,strong) UIImageView *accountImageView;
@property (nonatomic,strong) UIButton *accountSelectButton;  //余额选中按钮

@property (nonatomic,strong) UILabel *lineLabel2;


@property (nonatomic,strong) UIButton *wechatTitleButton;  //微信支付
@property (nonatomic,strong) UIButton *wechatButton;  //微信支付

@property (nonatomic,strong) UIButton *payButton;  //支付

@end
