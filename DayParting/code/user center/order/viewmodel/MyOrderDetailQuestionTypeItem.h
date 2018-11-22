//
//  MyOrderDetailQuestionTypeItem.h
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseItem.h"

@interface MyOrderDetailQuestionTypeItem : BaseItem

//@property (nonatomic,assign) BOOL showSelected;  //是否被选中
@property (nonatomic,copy) NSString *showSelected;  //是否被选中  1-选中。0-未选中

@property (nonatomic,copy) NSString *typeString;

@end
