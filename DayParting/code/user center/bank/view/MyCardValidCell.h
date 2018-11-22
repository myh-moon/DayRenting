//
//  MyCardValidCell.h
//  DayParting
//
//  Created by jiamanu on 2018/11/1.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyCardValidItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyCardValidCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *contentLabel;

@property (nonatomic,strong,readwrite) MyCardValidItem *item;

@end

NS_ASSUME_NONNULL_END
