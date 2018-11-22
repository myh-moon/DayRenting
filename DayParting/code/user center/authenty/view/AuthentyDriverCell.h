//
//  AuthentyDriverCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/6.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "AuthentyPictureView.h"
#import "AuthentyDriverItem.h"

@interface AuthentyDriverCell : BaseCell

@property (nonatomic,strong) UILabel *remindLabel;
@property (nonatomic,strong) AuthentyPictureView *faceButton;
@property (nonatomic,strong) AuthentyPictureView *oppositeButton;
@property (nonatomic,strong) UIButton *submitButton;

@property (nonatomic,strong,readwrite) AuthentyDriverItem *item;

@end
