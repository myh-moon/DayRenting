//
//  AuthentyModel.h
//  DayParting
//
//  Created by jiamanu on 2018/9/6.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDCardModel.h"

@interface AuthentyModel : NSObject

@property (nonatomic,copy) NSString *src;
@property (nonatomic,copy) NSString *infos;
@property (nonatomic,strong) IDCardModel *idcardArr;

@end
