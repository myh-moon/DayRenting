//
//  MainUserTypeCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/28.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainUserTypeCell.h"

@implementation MainUserTypeCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.typeButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.typeButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.typeButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)typeButton {
    if (!_typeButton) {
        _typeButton = [UIButton newAutoLayoutView];
        [_typeButton setTitleColor:DPGrayColor forState:0];
        _typeButton.titleLabel.font = DPFont6;
        _typeButton.userInteractionEnabled = NO;
    }
    return _typeButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.typeButton setImage:[UIImage imageNamed:self.item.typeImageString] forState:0];
    [self.typeButton setTitle:self.item.typeNameString forState:0];
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
