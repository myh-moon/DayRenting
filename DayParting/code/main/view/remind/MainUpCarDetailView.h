//
//  MainUpCarDetailView.h
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BasePopView.h"
#import "CarListModel.h"

@interface MainUpCarDetailView : BasePopView

@property (nonatomic,strong) RETableViewManager *mainUpCarDetailManager;
@property (nonatomic,strong) UITableView *mainUpCarDetailTableView;

//- (void) reloadData:(NSArray *)list;

//@property (nonatomic,strong) void (^didSelectedBtn)(NSString *idd);

@property (nonatomic,strong) CarListModel *carDetailModel;

- (void)setupMainUpCarDetailView;

@end
