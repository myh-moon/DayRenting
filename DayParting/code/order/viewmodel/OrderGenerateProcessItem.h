//
//  OrderGenerateProcessItem.h
//  DayParting
//
//  Created by jiamanu on 2018/8/17.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseItem.h"

@interface OrderGenerateProcessItem : BaseItem

@property (nonatomic,copy) NSString *bname; //服务点

@property (nonatomic,copy) NSString *hctime;
@property (nonatomic,copy) NSString *hcaddress;

@property (nonatomic,copy) NSString *timeSelected;
@property (nonatomic,assign) NSString *addressSelected;

@end
