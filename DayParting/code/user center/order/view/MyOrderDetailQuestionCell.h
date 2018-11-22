//
//  MyOrderDetailQuestionCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderDetailQuestionItem.h"

@interface MyOrderDetailQuestionCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong,readwrite) MyOrderDetailQuestionItem *item;

@end
