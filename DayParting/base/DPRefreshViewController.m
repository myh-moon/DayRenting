//
//  DPRefreshViewController.m
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "DPRefreshViewController.h"

@interface DPRefreshViewController ()

@end

@implementation DPRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.DPRefreshTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.DPRefreshManager = [[RETableViewManager alloc] initWithTableView:self.DPRefreshTableView];
    
    self.pageIndex = 1;
}

- (UITableView *)DPRefreshTableView {
    if (!_DPRefreshTableView) {
        _DPRefreshTableView = [UITableView newAutoLayoutView];
        _DPRefreshTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, DPSmallSpacing)];
        _DPRefreshTableView.showsVerticalScrollIndicator = NO;
        _DPRefreshTableView.backgroundColor = DPWhiteColor;
        
        DPWeakSelf;
        _DPRefreshTableView.mj_header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
            if (weakself.pullToRefreshHandler) {
                weakself.pullToRefreshHandler();
            }
        }];
         [_DPRefreshTableView.mj_header beginRefreshing];
        
        _DPRefreshTableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
            if (weakself.pullToLoadMoreHandler) {
                weakself.pullToLoadMoreHandler();
            }
        }];
        
    }
    return _DPRefreshTableView;
}

- (void)layoutConstraints {
    [self.DPRefreshTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.DPRefreshTableView autoPinToTopLayoutGuideOfViewController:self withInset:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
