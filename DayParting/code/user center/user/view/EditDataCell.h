//
//  EditDataCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/25.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "EditDataItem.h"

@interface EditDataCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UITextField *contentTextField;

@property (nonatomic,strong,readwrite) EditDataItem *item;

@end
