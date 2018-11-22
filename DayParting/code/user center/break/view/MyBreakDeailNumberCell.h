//
//  MyBreakDeailNumberCell.h
//  DayParting
//
//  Created by jiamanu on 2018/11/3.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyBreakDeailNumberItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyBreakDeailNumberCell : BaseCell

@property (nonatomic,strong) UILabel *numberLabel;

@property (nonatomic,strong,readwrite) MyBreakDeailNumberItem *item;

@end

NS_ASSUME_NONNULL_END
