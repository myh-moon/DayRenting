//
//  MyWalletCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/31.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyWalletCell.h"

@implementation MyWalletCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.contentButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.contentButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = DPDarkGrayColor;
        _titleLabel.font = DPFont5;
    }
    return _titleLabel;
}

- (UIButton *)contentButton {
    if (!_contentButton) {
        _contentButton = [UIButton newAutoLayoutView];
        [_contentButton swapImage];
        [_contentButton setImage:[UIImage imageNamed:@"right_arrow"] forState:0];
        
        _contentButton.titleLabel.font = DPFont4;
        _contentButton.userInteractionEnabled = NO;
    }
    return _contentButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    if ([self.item.showSeperate isEqualToString:@"2"]) {
        self.separatorInset = DPSeperateInsert2;
    }else{
        self.separatorInset = DPSeperateInsert;
    }
    
    self.titleLabel.text = self.item.titleString;
    NSString *sdsdsd = [NSString stringWithFormat:@"%@  ",self.item.cotentString];
    [self.contentButton setTitle:sdsdsd forState:0];
    
    if ([self.item.cotentString isEqualToString:@"未交押金"]) {
        [self.contentButton setTitleColor:DPLightGrayColor17 forState:0];
    }else{
        [self.contentButton setTitleColor:DPDarkGrayColor forState:0];
    }
    
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
