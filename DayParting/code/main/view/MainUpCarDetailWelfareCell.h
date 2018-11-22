//
//  MainUpCarDetailWelfareCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/16.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MainUpCarDetailWelfareItem.h"

@interface MainUpCarDetailWelfareCell : BaseCell

@property (nonatomic,strong) UILabel *abatementLabel;
@property (nonatomic,strong) UIButton *serviceButton;
@property (nonatomic,strong) UILabel *serviceLabel;

@property (nonatomic,strong,readwrite) MainUpCarDetailWelfareItem *item;

@end
