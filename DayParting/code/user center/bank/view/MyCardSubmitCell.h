//
//  MyCardSubmitCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"

#import "MyCardSubmitItem.h"

@interface MyCardSubmitCell : BaseCell

@property (nonatomic,strong) UIButton *submitButton;

@property (nonatomic,strong,readwrite) MyCardSubmitItem *item;

@end
