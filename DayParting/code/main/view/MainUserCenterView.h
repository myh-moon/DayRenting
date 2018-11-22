//
//  MainUserCenterView.h
//  DayParting
//
//  Created by jiamanu on 2018/8/28.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BasePopView.h"
#import "UserModel.h"

@interface MainUserCenterView : BasePopView

@property (nonatomic,strong) UITableView *mainUserCenterTableView;
@property (nonatomic,strong) RETableViewManager *mainManager;

//@property (nonatomic,strong) NSLayoutConstraint *widthTableConstraints;
@property (nonatomic,strong) NSLayoutConstraint *leftTableConstraints;

- (void) setupMainUserCenterTableView;

@property (nonatomic,strong) UserModel *userModel;

@end
