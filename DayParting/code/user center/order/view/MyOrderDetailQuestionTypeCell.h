//
//  MyOrderDetailQuestionTypeCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderDetailQuestionTypeItem.h"

@interface MyOrderDetailQuestionTypeCell : BaseCell

@property (nonatomic,strong) UILabel *typeLabel;
@property (nonatomic,strong) UIImageView *typeImageView;

@property (nonatomic,strong,readwrite) MyOrderDetailQuestionTypeItem *item;

@end
