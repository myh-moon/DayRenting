//
//  MyCardCodeCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyCardCodeItem.h"

@interface MyCardCodeCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UITextField *contentTextField;
@property (nonatomic,strong) UIButton *getCodeButton;

@property (nonatomic,strong,readwrite) MyCardCodeItem *item;

@end
