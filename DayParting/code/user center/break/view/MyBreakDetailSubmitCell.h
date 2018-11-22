//
//  MyBreakDetailSubmitCell.h
//  DayParting
//
//  Created by jiamanu on 2018/11/7.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyBreakDetailSubmitItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyBreakDetailSubmitCell : BaseCell

@property (nonatomic,strong) UIButton *submitButton;
@property (nonatomic,strong) UIButton *changeButton;

@property (nonatomic,strong,readwrite) MyBreakDetailSubmitItem *item;


@end

NS_ASSUME_NONNULL_END
