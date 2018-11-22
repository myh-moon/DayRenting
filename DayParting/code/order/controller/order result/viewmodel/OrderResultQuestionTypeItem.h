//
//  OrderResultQuestionTypeItem.h
//  DayParting
//
//  Created by jiamanu on 2018/9/13.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseItem.h"

@interface OrderResultQuestionTypeItem : BaseItem

@property (nonatomic,copy) NSString *titleString;
@property (nonatomic,strong) NSArray *typeLists;
@property (nonatomic,assign) NSInteger typeSelected;
@property (nonatomic,copy) NSString *placeholderString;


@property (nonatomic,strong) void (^didEditting)(NSString *text);


@end
