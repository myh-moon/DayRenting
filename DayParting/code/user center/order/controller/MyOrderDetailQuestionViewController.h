//
//  MyOrderDetailQuestionViewController.h
//  DayParting
//
//  Created by jiamanu on 2018/9/7.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "DPViewController.h"

@interface MyOrderDetailQuestionViewController : DPViewController

@property (nonatomic,strong) NSString *oid;

@property (nonatomic,strong) void (^didBack)(NSString *back);
@end
