//
//  ExchangeCell.m
//  DayParting
//
//  Created by jiamanu on 2018/10/19.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "ExchangeCell.h"

@implementation ExchangeCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 90;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;

    [self.contentView addSubview:self.exchangeButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    
    [self.exchangeButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(30, DPMiddleSpacing, 10, DPMiddleSpacing)];
}

- (UIButton *)exchangeButton {
    if (!_exchangeButton) {
        _exchangeButton = [UIButton newAutoLayoutView];
        [_exchangeButton setTitle:@"兑换" forState:0];
        [_exchangeButton setTitleColor:DPWhiteColor forState:0];
        _exchangeButton.titleLabel.font = DPFont6;
        
        _exchangeButton.layer.cornerRadius = 6;
        
        _exchangeButton.layer.shadowOffset = CGSizeMake(3, 3);
        _exchangeButton.layer.shadowOpacity = 0.4;
        _exchangeButton.layer.shadowRadius = 5;
        
        
        DPWeakSelf;
        [_exchangeButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(57);
            }
        }];
    }
    return _exchangeButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [[RACObserve(self.item, selected) takeUntil:[self rac_prepareForReuseSignal]]subscribeNext:^(id x) {
        if (![x boolValue] ) {
            self.exchangeButton.backgroundColor = DPLightGrayColor23;
            self.exchangeButton.userInteractionEnabled = NO;
            
            self.exchangeButton.layer.shadowColor = DPLightGrayColor23.CGColor;

        }else{
            self.exchangeButton.backgroundColor = DPBlueColor;
            self.exchangeButton.userInteractionEnabled = YES;
            
            self.exchangeButton.layer.shadowColor = DPBlueColor.CGColor;

        }
    }];

}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
