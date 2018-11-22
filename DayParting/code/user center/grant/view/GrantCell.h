//
//  GrantCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "GrantItem.h"

@interface GrantCell : BaseCell

@property (nonatomic,strong) UIImageView *grantBackImageView;

@property (nonatomic,strong) UILabel *headerLabel;
@property (nonatomic,strong) UIImageView *firstImageView;
@property (nonatomic,strong) UILabel *lineLabel1;
@property (nonatomic,strong) UILabel *lineLabel2;
@property (nonatomic,strong) UIImageView *secondImageView;

@property (nonatomic,strong) UIView *whiteBackView;
@property (nonatomic,strong) UIImageView *zhimaImageView;
@property (nonatomic,strong) UILabel *zhimaLabel;
@property (nonatomic,strong) UILabel *remindLabel;
@property (nonatomic,strong) UIButton *actButton;  //操作


@property (nonatomic,strong,readwrite) GrantItem *item;

@end
