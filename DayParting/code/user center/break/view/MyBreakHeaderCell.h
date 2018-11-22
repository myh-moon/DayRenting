//
//  MyBreakHeaderCell.h
//  DayParting
//
//  Created by jiamanu on 2018/10/15.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyBreakHeaderItem.h"

@interface MyBreakHeaderCell : BaseCell

@property (nonatomic,strong) UILabel *headerLabel;

@property (nonatomic,strong,readwrite) MyBreakHeaderItem *item;

@end
