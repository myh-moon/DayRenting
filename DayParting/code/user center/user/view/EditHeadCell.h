//
//  EditHeadCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/21.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "EditHeadItem.h"

@interface EditHeadCell : BaseCell

@property (nonatomic,strong) UIImageView *headerImageView;
@property (nonatomic,strong) UILabel *headerLabel;

@property (nonatomic,strong,readwrite) EditHeadItem *item;

@end
