//
//  ResetFaceFirstCell.h
//  DayParting
//
//  Created by jiamanu on 2018/10/15.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "ResetFaceFirstItem.h"

@interface ResetFaceFirstCell : BaseCell

@property (nonatomic,strong) UILabel *remindLabel;

@property (nonatomic,strong) UIImageView *collectionImageView; //采集

@property (nonatomic,strong) UILabel *waitingLabel;
@property (nonatomic,strong) UILabel *conditionLabel;

@property (nonatomic,strong) UIButton *submitButton;

@property (nonatomic,strong,readwrite) ResetFaceFirstItem *item;

@end
