//
//  MyCardTextCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyCardTextItem.h"

@interface MyCardTextCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UITextField *contentTextField;

@property (nonatomic,strong,readwrite) MyCardTextItem *item;

@end
