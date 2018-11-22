//
//  MainUserHeaderItem.h
//  DayParting
//
//  Created by jiamanu on 2018/8/28.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseItem.h"
#import "UserModel.h"

@interface MainUserHeaderItem : BaseItem

@property (nonatomic,copy) NSString *userImageString;
@property (nonatomic,copy) NSString *userNameString;
@property (nonatomic,copy) NSString *userLevelString;  //会员等级

- (instancetype) initWithIUserModel:(UserModel *)model;

@end
