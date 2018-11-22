//
//  MainUpCarView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainUpCarView.h"

#import "MainUpCarItem.h"

#import "CarListResponse.h"
#import "CarListModel.h"

@implementation MainUpCarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds  = YES;
        
        [self addSubview:self.mainUpCarTableView];
        
        [self setNeedsUpdateConstraints];
        
        self.mainUpCarManager = [[RETableViewManager alloc] initWithTableView:self.mainUpCarTableView];
        
        self.mainUpCarManager[@"MainUpCarItem"] = @"MainUpCarCell";
        
        [self setupMainUpCarView];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.mainUpCarTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self];
        [self.mainUpCarTableView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self];
        [self.mainUpCarTableView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self];
        [self.mainUpCarTableView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self];

        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UITableView *)mainUpCarTableView {
    if (!_mainUpCarTableView) {
        _mainUpCarTableView = [UITableView newAutoLayoutView];
        _mainUpCarTableView.tableFooterView = [UIView new];
        _mainUpCarTableView.backgroundColor = DPWhiteColor;
        _mainUpCarTableView.bounces = NO;
        _mainUpCarTableView.showsVerticalScrollIndicator = NO;
    }
    return _mainUpCarTableView;
}

- (void) setupMainUpCarView {
    [self.mainUpCarManager removeAllSections];
    
    RETableViewSection *carSection = [RETableViewSection section];
    carSection.headerHeight = 120;
    carSection.footerHeight = 0;
    carSection.headerView = self.mainUpCarHeaderView;
    [self.mainUpCarManager addSection:carSection];
    
    //服务点
    NSString *service = [NSString stringWithFormat:@"%@ · 服务点\n",self.carListResponse.dotname];
    self.mainUpCarHeaderView.serviceLabel.attributedText = [NSString setAttributeOfFirstString:service firstFont:DPFont6 firstColor:DPWhiteColor secondString:self.carListResponse.dotAddrs secondFont:DPFont3 secondColor:DPLightGrayColor1 align:0 space:4];
    
    //距离
    NSString *distance = [NSString stringWithFormat:@"%@m",self.carListResponse.range];
    [self.mainUpCarHeaderView.distanceButton setTitle:distance forState:0];
    
    //可用车辆
    self.mainUpCarHeaderView.availableLabel1.attributedText = [NSString setAttributeOfFirstString:self.carListResponse.carnum firstFont:DPFont6 firstColor:DPLightGrayColor1 secondString:@"  辆车可用" secondFont:DPFont1 secondColor:DPLightGrayColor2];
    
    //停车位
    self.mainUpCarHeaderView.availableLabel2.attributedText = [NSString setAttributeOfFirstString:self.carListResponse.positionsnum firstFont:DPFont6 firstColor:DPLightGrayColor1 secondString:@"  个停车位" secondFont:DPFont1 secondColor:DPLightGrayColor2];
    
    //list
    if (self.carListResponse.cardata.count > 0) {
        for (NSInteger i=0; i<self.carListResponse.cardata.count; i++) {
            
            CarListModel *carModel = self.carListResponse.cardata[i];
            
            MainUpCarItem *carItem = [[MainUpCarItem alloc] initWithCarModel:carModel];
            carItem.selectionStyle = UITableViewCellSelectionStyleNone;
            if (i == self.carListResponse.cardata.count - 1) {
                carItem.showSeperate= @"3";
            }else{
                carItem.showSeperate= @"2";
            }
            [carSection addItem:carItem];
            DPWeakSelf;
            carItem.selectionHandler = ^(id item) {
                if (weakself.didSelectedCell) {
                    weakself.didSelectedCell(carModel.ID);
                }
            };
        }
    }else{
        NSLog(@"wuwuuw");
    }
}

- (MainUpCarHeaderView *)mainUpCarHeaderView {
    if (!_mainUpCarHeaderView) {
        _mainUpCarHeaderView = [[MainUpCarHeaderView alloc] initWithFrame:CGRectMake(0, 0, DPWindowWidth, 130)];

        [_mainUpCarHeaderView.navigationButton addTarget:self action:@selector(showNavigationMap) forControlEvents:UIControlEventTouchUpInside];
        [_mainUpCarHeaderView.distanceButton addTarget:self action:@selector(showNavigationMap) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _mainUpCarHeaderView;
}

- (void)showNavigationMap {
    if (self.didSelectedBtn) {
        self.didSelectedBtn(234);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
