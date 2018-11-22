//
//  MyBreakDeailTextCell.h
//  DayParting
//
//  Created by jiamanu on 2018/11/3.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyBreakDeailTextItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyBreakDeailTextCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *contentLabel;

@property (nonatomic,strong,readwrite) MyBreakDeailTextItem *item;

@end

NS_ASSUME_NONNULL_END
