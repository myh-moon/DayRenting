//
//  OrderResultQuestionViewController.h
//  DayParting
//
//  Created by jiamanu on 2018/9/13.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "DPViewController.h"

@interface OrderResultQuestionViewController : DPViewController

@property (nonatomic,strong) NSString *oid;
@property (nonatomic,assign) NSInteger condition;  //1-车况上报。 2-故障上报

@end
