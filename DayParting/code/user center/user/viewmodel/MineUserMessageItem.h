//
//  MineUserMessageItem.h
//  DayParting
//
//  Created by jiamanu on 2018/8/28.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseItem.h"
#import "UserModel.h"

@interface MineUserMessageItem : BaseItem

@property (nonatomic,copy) NSString *userImgString;
@property (nonatomic,copy) NSString *userNameString;
@property (nonatomic,copy) NSString *scoreString;
//会员等级

- (instancetype) initWithUserModel:(UserModel *)model;

@end
