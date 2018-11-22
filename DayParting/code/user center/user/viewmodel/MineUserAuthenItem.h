//
//  MineUserAuthenItem.h
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseItem.h"
#import "UserModel.h"

@interface MineUserAuthenItem : BaseItem

@property (nonatomic,copy) NSString *authenStateString;
@property (nonatomic,copy) NSString *licenseStateString;

- (instancetype) initWithUserModel:(UserModel *)model;

@end
