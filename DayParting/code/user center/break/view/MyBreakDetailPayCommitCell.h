//
//  MyBreakDetailPayCommitCell.h
//  DayParting
//
//  Created by jiamanu on 2018/11/3.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyBreakDetailPayCommitItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyBreakDetailPayCommitCell : BaseCell

@property (nonatomic,strong) UILabel *moneyLabel;
@property (nonatomic,strong) UIButton *commitButton;

@property (nonatomic,strong,readwrite) MyBreakDetailPayCommitItem *item;

@end

NS_ASSUME_NONNULL_END
