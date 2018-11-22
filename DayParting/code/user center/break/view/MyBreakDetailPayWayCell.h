//
//  MyBreakDetailPayWayCell.h
//  DayParting
//
//  Created by jiamanu on 2018/11/3.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyBreakDetailPayWayItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyBreakDetailPayWayCell : BaseCell

@property (nonatomic,strong) UIButton *wayButton;
@property (nonatomic,strong) UIImageView *wayImageView;

@property (nonatomic,strong,readwrite) MyBreakDetailPayWayItem *item;

@end

NS_ASSUME_NONNULL_END
