//
//  ResetFaceSecondCell.h
//  DayParting
//
//  Created by jiamanu on 2018/10/15.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "ResetFaceSecondItem.h"

@interface ResetFaceSecondCell : BaseCell

@property (nonatomic,strong) UILabel *remindLabel;

@property (nonatomic,strong) UIImageView *collectionImageView; //采集

@property (nonatomic,strong) UIButton *submitButton;

@property (nonatomic,strong) UILabel *waitingLabel;

@property (nonatomic,strong,readwrite) ResetFaceSecondItem *item;

@end
