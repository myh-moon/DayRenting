//
//  MyCardAddViewController.h
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "DPViewController.h"

@interface MyCardAddViewController : DPViewController

@property (nonatomic,strong) void (^didSubmitBank)(NSString *); //返回上一页面，是否需要刷新

@end
