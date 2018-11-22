//
//  UIViewController+Blur.h
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "AvailableOrderModel.h"
#import <FXBlurView/FXBlurView.h>

@interface UIViewController (Blur)

//可用车辆列表
- (void) showMainAvailableCarListViewInView:(UIView *)view array:(NSArray *)carList finishBlock:(void(^)(NSString *name,NSString *cid))finishBlock;


//订单页面的“更多“功能
- (void) showMenuViewInView:(UIView *)view finishBlock:(void(^)(NSString *cate))finishBlock;

//确认订单页面的“预计还车时间”
- (void) showDatePickerViewInView:(UIView *)view finishBlock:(void(^)(NSString *date))finishBlock;

//绑定银行卡页面的“有效期选择”
- (void) showBankValidDatePickerViewInView:(UIView *)view finishBlock:(void(^)(NSString *date))finishBlock;


//订单详情页面的“开锁用车”
- (void) showUnlockViewInView:(UIView *)view WithOrderModel:(AvailableOrderModel *)model finishBlock:(void(^)(NSString *unlock))finishBlock;

////订单详情页面的“开锁用车”后的检查车辆故障
- (void) showCarCheckViewInView:(UIView *)view finishBlock:(void(^)(NSString *unlock))finishBlock;

//首页的“确认还车”
- (void) showCarReturnConfirmViewInView:(UIView *)view finishBlock:(void(^)(NSString *unlock))finishBlock;

////ji fen dui hua
//- (void) showScoreExchangeViewInView:(UIView *)view finishBlock:(void(^)(NSString *unlock))finishBlock;

//积分兑换结果
- (void) showScoreExchangeViewInView:(UIView *)view withMoney:(NSString *)money finishBlock:(void(^)(NSString *unlock))finishBlock;


//身份认证时，确认身份证信息
- (void) showAuthentyViewInView:(UIView *)view andName:(NSString *)name andIDCard:(NSString *)number finishBlock:(void(^)(NSString *unlock))finishBlock;

//主页。菜单
- (void) showMainUserCenterViewInView:(UIView *)view WithModel:(UserModel *)model finishBlock:(void(^)(NSInteger tag))finishBlock;


//首页status=2时订单支付信息
- (void) showMainPayMessageViewInView:(UIView *)view WithModel:(AvailableOrderModel *)model finishBlock:(void(^)(NSInteger tag))finishBlock;

//首页订单支付结果显示  result = success,cancel
- (void) showMainPayResultViewInView:(UIView *)view WithModel:(AvailableOrderModel *)model WithResult:(NSString *)result finishBlock:(void(^)(NSInteger tag))finishBlock;


//公用弹框- 1，按行程开票中，选择完行程之后的弹出框    2，车况上报。   3，交用车押金。   4.违章查询,    5-重置支付密码 image:invoice_remind
- (void) showCommonBlurInView:(UIView *)view andRemindImage:(NSString *)img andRemindString:(NSString *)remindString andLeftAct:(NSString *)leftString leftColor:(UIColor *)leftColor andRightAct:(NSString *)rightString rightColor:(UIColor *)rightColor finishBlock:(void(^)(NSString *unlock))finishBlock;


//首页，选择余额支付时，弹出密码输入框
- (void) showPWDBlurInView:(UIView *)view finishBlock:(void(^)(NSString *unlock))finishBlock;

@end
