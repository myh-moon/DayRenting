//
//  MyOrderDetailQuestionReasonCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderDetailQuestionReasonItem.h"

@interface MyOrderDetailQuestionReasonCell : BaseCell

@property (nonatomic,strong) UIView *backWhiteView;
@property (nonatomic,strong) UITextView *reasonTextView;

@property (nonatomic,strong,readwrite) MyOrderDetailQuestionReasonItem *item;


@end
