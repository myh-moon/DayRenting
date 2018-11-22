//
//  MainUpCarCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MainUpCarItem.h"

@interface MainUpCarCell : BaseCell

@property (nonatomic,strong) UIImageView *carImageView;
@property (nonatomic,strong) UILabel *codeLabel;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *oilLabel;
@property (nonatomic,strong) UILabel *colorLabel;
@property (nonatomic,strong) UILabel *siteLabel;
@property (nonatomic,strong) UIImageView *actImageView;

@property (nonatomic,strong,readwrite) MainUpCarItem *item;

@end
