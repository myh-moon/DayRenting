//
//  MyBreakDetailHeaderCell.h
//  DayParting
//
//  Created by jiamanu on 2018/11/7.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyBreakDetailHeaderItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyBreakDetailHeaderCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong,readwrite) MyBreakDetailHeaderItem *item;

@end

NS_ASSUME_NONNULL_END
