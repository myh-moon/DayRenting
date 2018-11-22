//
//  TicketChooseView.h
//  DayParting
//
//  Created by jiamanu on 2018/9/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BasePopView.h"

@interface TicketChooseView : BasePopView

@property (nonatomic,strong) UIButton *availableButton;
@property (nonatomic,strong) UIButton *historyButton;

@property (nonatomic,strong) UILabel *lineLabel;

@property (nonatomic,strong) UILabel *grayLabel;

@property (nonatomic,strong) NSLayoutConstraint *leftLineConstraints;

@end
