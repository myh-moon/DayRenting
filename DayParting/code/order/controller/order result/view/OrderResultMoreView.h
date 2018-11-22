//
//  OrderResultMoreView.h
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderResultMoreView : UIImageView

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIButton *cancelButton;//取消订单
@property (nonatomic,strong) UIButton *faultButton;//车况上报

@property (nonatomic,strong) void (^didSelectedBtn)(NSString *cate);

@end
