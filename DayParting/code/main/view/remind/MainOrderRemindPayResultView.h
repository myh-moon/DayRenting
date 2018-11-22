//
//  MainOrderRemindPayResultView.h
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BasePopView.h"

@interface MainOrderRemindPayResultView : BasePopView

@property (nonatomic,strong) UIButton *cancelButton;
@property (nonatomic,strong) UIImageView *resultImageView;
@property (nonatomic,strong) UILabel *resultLabel;

@property (nonatomic,strong) UILabel *oidLabel;
@property (nonatomic,strong) UILabel *oidDetailLabel;

@property (nonatomic,strong) UILabel *wayLabel;
@property (nonatomic,strong) UILabel *wayDetailLabel;

@property (nonatomic,strong) UILabel *ticketLabel;
@property (nonatomic,strong) UILabel *ticketDetailLabel;

@property (nonatomic,strong) UILabel *moneyLabel;
@property (nonatomic,strong) UILabel *moneyDetailLabel;

@property (nonatomic,strong) UIButton *checkOrderButton;

@end
