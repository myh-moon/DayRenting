//
//  ExchangeCell.h
//  DayParting
//
//  Created by jiamanu on 2018/10/19.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "ExchangeItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExchangeCell : BaseCell

@property (nonatomic,strong) UIButton *exchangeButton;
@property (nonatomic,strong,readwrite) ExchangeItem *item;

@end

NS_ASSUME_NONNULL_END
