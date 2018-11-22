//
//  MyOrderDetailQuestionContactCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderDetailQuestionContactItem.h"

@interface MyOrderDetailQuestionContactCell : BaseCell

@property (nonatomic,strong) UIButton *submitButton;
@property (nonatomic,strong) UIButton *contactButton;

@property (nonatomic,strong,readwrite) MyOrderDetailQuestionContactItem *item;

@end
