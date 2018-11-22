//
//  AuthentyProcessCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "AuthentyProcessItem.h"

@interface AuthentyProcessCell : BaseCell

@property (nonatomic,strong) UIImageView *pointImageView1;
@property (nonatomic,strong) UIImageView *pointImageView2;
@property (nonatomic,strong) UIImageView *pointImageView3;

@property (nonatomic,strong) UILabel *lineLabel1;
@property (nonatomic,strong) UILabel *lineLabel2;
@property (nonatomic,strong) UILabel *lineLabel3;
@property (nonatomic,strong) UILabel *lineLabel4;

@property (nonatomic,strong) UILabel *pointTextLabel1;
@property (nonatomic,strong) UILabel *pointTextLabel2;
@property (nonatomic,strong) UILabel *pointTextLabel3;

@property (nonatomic,strong,readwrite) AuthentyProcessItem *item;
@end
