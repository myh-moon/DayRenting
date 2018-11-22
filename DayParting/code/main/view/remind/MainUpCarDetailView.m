//
//  MainUpCarDetailView.m
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainUpCarDetailView.h"

#import "MainUpCarDetailTextItem.h"
#import "MainUpCarDetailCostItem.h"
#import "MainUpCarDetailWelfareItem.h"
#import "MainUpCarDetailOrderItem.h"

@implementation MainUpCarDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds  = YES;
        self.backgroundColor = DPWhiteColor;
        
        [self addSubview:self.mainUpCarDetailTableView];
        
        [self setNeedsUpdateConstraints];
        
        self.mainUpCarDetailManager = [[RETableViewManager alloc] initWithTableView:self.mainUpCarDetailTableView];
        
        self.mainUpCarDetailManager[@"MainUpCarDetailTextItem"] = @"MainUpCarDetailTextCell";
        self.mainUpCarDetailManager[@"MainUpCarDetailCostItem"] = @"MainUpCarDetailCostCell";
        self.mainUpCarDetailManager[@"MainUpCarDetailWelfareItem"] = @"MainUpCarDetailWelfareCell";
        self.mainUpCarDetailManager[@"MainUpCarDetailOrderItem"] = @"MainUpCarDetailOrderCell";
        
        
        [self setupMainUpCarDetailView];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {

        [self.mainUpCarDetailTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(2, 2, 0, 2)];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UITableView *)mainUpCarDetailTableView {
    if (!_mainUpCarDetailTableView) {
        _mainUpCarDetailTableView = [UITableView newAutoLayoutView];
        _mainUpCarDetailTableView.tableFooterView = [UIView new];
        _mainUpCarDetailTableView.backgroundColor = DPWhiteColor;
        _mainUpCarDetailTableView.showsVerticalScrollIndicator = NO;
        _mainUpCarDetailTableView.bounces = NO;
        
//        _mainUpCarDetailTableView.layer.shadowColor = DPBlackColor.CGColor;
//        _mainUpCarDetailTableView.layer.shadowOffset = CGSizeMake(2, -2);
//        _mainUpCarDetailTableView.layer.shadowOpacity = 0.08;
    }
    return _mainUpCarDetailTableView;
}

- (void) setupMainUpCarDetailView {
    [self.mainUpCarDetailManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.mainUpCarDetailManager addSection:section];
    
    DPWeakSelf;
    //text
    MainUpCarDetailTextItem *textItem = [[MainUpCarDetailTextItem alloc] initWithCarDetailModel:self.carDetailModel];
    textItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:textItem];
    textItem.didSelectedBtn = ^(NSInteger tag) {
        if (tag == 123) {//关闭
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(22);
            }
        }
    };
    
    //cost
    MainUpCarDetailCostItem *costItem = [[MainUpCarDetailCostItem alloc]initWithCarDetailModel:self.carDetailModel];
    costItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:costItem];
    
    //welfare
    MainUpCarDetailWelfareItem *welfareItem = [[MainUpCarDetailWelfareItem alloc] init];
    welfareItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:welfareItem];
    
    //order
    MainUpCarDetailOrderItem *orderItem = [[MainUpCarDetailOrderItem alloc] init];
    orderItem.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:orderItem];
    orderItem.didSelectedBtn = ^(NSInteger tag) {
        if (weakself.didSelectedBtn) {//预定
            weakself.didSelectedBtn(23);
        }
    };
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
