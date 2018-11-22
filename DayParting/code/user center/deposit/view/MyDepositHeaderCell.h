//
//  MyDepositHeaderCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyDepositHeaderItem.h"

@interface MyDepositHeaderCell : BaseCell

//@property (nonatomic,strong) UIImageView *depositBackImageView;
@property (nonatomic,strong) UIButton *depositBackImageView;
@property (nonatomic,strong) UILabel *depositLabel;
@property (nonatomic,strong) UILabel *depositMoneyLabel;

@property (nonatomic,strong,readwrite) MyDepositHeaderItem *item;

@end
