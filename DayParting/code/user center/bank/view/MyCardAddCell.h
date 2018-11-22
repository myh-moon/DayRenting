//
//  MyCardAddCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/4.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyCardAddItem.h"

@interface MyCardAddCell : BaseCell

@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIImageView *addImageView;
@property (nonatomic,strong) UILabel *addLabel;

@property (nonatomic,strong,readwrite) MyCardAddItem *item;

@end
