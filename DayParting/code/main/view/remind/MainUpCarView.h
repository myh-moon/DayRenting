//
//  MainUpCarView.h
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainUpCarHeaderView.h"
#import "CarListResponse.h"

@interface MainUpCarView : UIView

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) RETableViewManager *mainUpCarManager;
@property (nonatomic,strong) UITableView *mainUpCarTableView;
@property  (nonatomic,strong) MainUpCarHeaderView *mainUpCarHeaderView;

@property (nonatomic,strong) void (^didSelectedCell)(NSString *idd);
@property (nonatomic,strong) void (^didSelectedBtn)(NSInteger tag);

@property (nonatomic,strong) CarListResponse *carListResponse;

- (void) setupMainUpCarView;

@end
