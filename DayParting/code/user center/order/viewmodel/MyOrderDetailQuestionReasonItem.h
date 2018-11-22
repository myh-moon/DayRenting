//
//  MyOrderDetailQuestionReasonItem.h
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "RETableViewItem.h"

@interface MyOrderDetailQuestionReasonItem : RETableViewItem

@property (nonatomic,copy) NSString *edit;  //是否能编辑 1-能，0-不能

@property (nonatomic,strong) void (^didEditing)(NSString *text);

@end
