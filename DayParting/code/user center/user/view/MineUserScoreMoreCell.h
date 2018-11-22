//
//  MineUserScoreMoreCell.h
//  DayParting
//
//  Created by jiamanu on 2018/10/24.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MineUserScoreMoreItem.h"


NS_ASSUME_NONNULL_BEGIN

@interface MineUserScoreMoreCell : BaseCell

@property (nonatomic,strong) UIButton *moreButton;
@property (nonatomic,strong,readwrite) MineUserScoreMoreItem *item;

@end

NS_ASSUME_NONNULL_END
