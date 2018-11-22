//
//  MainUserHeaderCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/28.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MainUserHeaderCell.h"

@implementation MainUserHeaderCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 215;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.headerImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.vipButton];
    [self.contentView addSubview:self.gradeButton];
    [self.contentView addSubview:self.actButton];

    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        #pragma mark - warning
        [self.headerImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:42];
        [self.headerImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.headerImageView autoSetDimensionsToSize:CGSizeMake(75, 75)];
        
        [self.nameLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.headerImageView];
        [self.nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headerImageView withOffset:DPMiddleSpacing];
        
        [self.gradeButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.nameLabel];
        [self.gradeButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nameLabel withOffset:11];
        
        [self.vipButton autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.gradeButton withOffset:-5];
        [self.vipButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.gradeButton];
        
        [self.actButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.gradeButton withOffset:DPSmallSpacing];
        [self.actButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.gradeButton];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIImageView *)headerImageView {
    if (!_headerImageView) {
        _headerImageView = [UIImageView newAutoLayoutView];
        _headerImageView.layer.cornerRadius = 37.5;
        _headerImageView.layer.masksToBounds = YES;
    }
    return _headerImageView;
}

-(UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView];
        _nameLabel.textColor = DPDarkGrayColor;
        _nameLabel.font = DPFont5;
    }
    return _nameLabel;
}

- (UIButton *)vipButton {
    if (!_vipButton) {
        _vipButton = [UIButton newAutoLayoutView];
        [_vipButton setImage:[UIImage imageNamed:@"vip"] forState:0];
        _vipButton.userInteractionEnabled = NO;
    }
    return _vipButton;
}

- (UIButton *)gradeButton {
    if (!_gradeButton) {
        _gradeButton = [UIButton newAutoLayoutView];
        [_gradeButton setTitleColor:DPLightGrayColor forState:0];
        _gradeButton.titleLabel.font = DPFont4;
        _gradeButton.userInteractionEnabled = NO;
    }
    return _gradeButton;
}

- (UIButton *)actButton {
    if (!_actButton) {
        _actButton = [UIButton newAutoLayoutView];
        [_actButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
        _actButton.userInteractionEnabled = NO;
    }
    return _actButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
//    self.headerImageView.backgroundColor = DPRedColor;
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:self.item.userImageString] placeholderImage:[UIImage imageNamed:@""]];
    
    self.nameLabel.text = self.item.userNameString;
//    @"您尚未完成身份认证，暂无法租车";
    
    [self.gradeButton setTitle:self.item.userLevelString forState:0];
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
