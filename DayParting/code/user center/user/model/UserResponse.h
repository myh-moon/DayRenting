//
//  UserResponse.h
//  DayParting
//
//  Created by jiamanu on 2018/9/10.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseModel.h"
#import "UserModel.h"

@interface UserResponse : BaseModel

@property (nonatomic,strong) UserModel *data;

@end
