//
//  DPRefreshViewController.h
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "NetWorkViewController.h"

@interface DPRefreshViewController : NetWorkViewController

@property (nonatomic,strong) RETableViewManager *DPRefreshManager;
@property (nonatomic,strong) UITableView *DPRefreshTableView;
@property (nonatomic,assign) NSInteger pageIndex;

@property (nonatomic,copy) void (^pullToRefreshHandler)(void);
@property (nonatomic,copy) void (^pullToLoadMoreHandler) (void);


@end
