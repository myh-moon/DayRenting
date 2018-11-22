//
//  ExchangeCodeCell.h
//  DayParting
//
//  Created by jiamanu on 2018/10/19.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "ExchangeCodeItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExchangeCodeCell : BaseCell

@property (nonatomic,strong) UITextField *codeTextField;

@property (nonatomic,strong,readwrite) ExchangeCodeItem *item;

@end

NS_ASSUME_NONNULL_END
