//
//  ResetFourCell.h
//  DayParting
//
//  Created by jiamanu on 2018/10/15.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "ResetFourItem.h"

@interface ResetFourCell : BaseCell

@property (nonatomic,strong) UIImageView *finishImageView;
@property (nonatomic,strong) UILabel *finishLabel;
@property (nonatomic,strong) UIButton *finishButton;

@property (nonatomic,strong,readwrite) ResetFourItem *item;

@end
