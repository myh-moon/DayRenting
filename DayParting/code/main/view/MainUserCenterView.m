//
//  MainUserCenterView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/28.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainUserCenterView.h"
#import "MainUserTypeItem.h"
#import "MainUserHeaderItem.h"

@implementation MainUserCenterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.mainUserCenterTableView];
        
        [self setNeedsUpdateConstraints];
        
        self.mainManager = [[RETableViewManager alloc] initWithTableView:self.mainUserCenterTableView];
        self.mainManager[@"MainUserTypeItem"] = @"MainUserTypeCell";
        self.mainManager[@"MainUserHeaderItem"] = @"MainUserHeaderCell";

        [self setupMainUserCenterTableView];
        
        self.leftTableConstraints = [self.mainUserCenterTableView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:-(DPWindowWidth-100)];
    }
    return self;
}

- (void)layoutView {
    
    [self.mainUserCenterTableView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.mainUserCenterTableView autoSetDimension:ALDimensionHeight toSize:DPWindowHeight];
    [self.mainUserCenterTableView autoSetDimension:ALDimensionWidth toSize:DPWindowWidth-100];
}

- (UITableView *)mainUserCenterTableView {
    if (!_mainUserCenterTableView) {
//        _mainUserCenterTableView = [UITableView newAutoLayoutView];
        _mainUserCenterTableView.translatesAutoresizingMaskIntoConstraints = NO;
        _mainUserCenterTableView = [[UITableView alloc] initWithFrame:CGRectMake(-(DPWindowWidth-100), 0, DPWindowWidth-100, DPWindowHeight) style:UITableViewStylePlain];
        _mainUserCenterTableView.tableFooterView = [UIView new];
        _mainUserCenterTableView.backgroundColor = DPWhiteColor;
        _mainUserCenterTableView.bounces = NO;
    }
    return _mainUserCenterTableView;
}

- (void) setupMainUserCenterTableView {
    
    [self.mainManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.mainManager addSection:section];
    
    DPWeakSelf;
    MainUserHeaderItem *headerItem = [[MainUserHeaderItem alloc] initWithIUserModel:self.userModel];
    headerItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:headerItem];
    headerItem.selectionHandler = ^(id item) {
        if (weakself.didSelectedBtn) {
            weakself.didSelectedBtn(5);
        }
    };
    
    NSArray *imageArray = @[@"center_order",@"center_wallet",@"center_grant",@"center_break",@"center_service",@"center_setting"];
    NSArray *nameArray = @[@"   订单",@"   钱包",@"   授权",@"   违章",@"   客服",@"   设置"];
    
    for (NSInteger i=0; i<6; i++) {
        MainUserTypeItem *typeItem = [[MainUserTypeItem alloc] init];
        typeItem.typeImageString = imageArray[i];
        typeItem.typeNameString = nameArray[i];
        [section addItem:typeItem];
        
        typeItem.selectionHandler = ^(id item) {
            
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(i+10);
            }
        };
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
