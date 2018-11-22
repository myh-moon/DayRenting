//
//  MainUpCarDetailTextCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MainUpCarDetailTextItem.h"

@interface MainUpCarDetailTextCell : BaseCell

@property (nonatomic,strong) UILabel *codeLabel;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *lineLabel;
@property (nonatomic,strong) UIButton *attentionButton;
@property (nonatomic,strong) UIButton *closeButton;
@property (nonatomic,strong) UIImageView *carImageView;
@property (nonatomic,strong) UILabel *oilLabel;

@property (nonatomic,strong) UIView *oilProgressBackView;
@property (nonatomic,strong) UILabel *oilClassLabel1;
@property (nonatomic,strong) UILabel *oilClassLabel2;
@property (nonatomic,strong) UILabel *oilClassLabel3;
@property (nonatomic,strong) UILabel *oilClassLabel4;
@property (nonatomic,strong) UILabel *oilClassLabel5;
@property (nonatomic,strong) UILabel *oilClassLabel6;
@property (nonatomic,strong) UILabel *oilClassLabel7;
@property (nonatomic,strong) UILabel *oilClassLabel8;
@property (nonatomic,strong) UILabel *oilClassLabel9;
@property (nonatomic,strong) UILabel *oilClassLabel10;
@property (nonatomic,strong) UIImageView *oilTopView;


@property (nonatomic,strong) UILabel *colorLabel;
@property (nonatomic,strong) UILabel *siteLabel;
@property (nonatomic,strong) UILabel *autoLabel;

@property (nonatomic,strong,readwrite) MainUpCarDetailTextItem *item;

@end
