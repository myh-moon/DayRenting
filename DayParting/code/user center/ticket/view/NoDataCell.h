//
//  NoDataCell.h
//  DayParting
//
//  Created by jiamanu on 2018/10/23.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "NoDataItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface NoDataCell : BaseCell

@property (nonatomic,strong) UIImageView *noDataImageView;
@property (nonatomic,strong) UIButton *noDataButton;

@property (nonatomic,strong,readwrite) NoDataItem *item;

@end

NS_ASSUME_NONNULL_END
