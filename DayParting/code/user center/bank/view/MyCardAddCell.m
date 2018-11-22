//
//  MyCardAddCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/4.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyCardAddCell.h"

@implementation MyCardAddCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 140;
}

- (void)cellDidLoad {
    [super  cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.backView];
    [self.backView addSubview:self.addImageView];
    [self.backView addSubview:self.addLabel];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.backView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(DPMiddleSpacing, DPMiddleSpacing, DPMiddleSpacing, DPMiddleSpacing)];
    
    
    [self.addImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.addImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:30];
    
    [self.addLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.addImageView];
    [self.addLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.addImageView withOffset:DPBigSpacing];
}

- (UIView *)backView {
    if (!_backView) {
        _backView.translatesAutoresizingMaskIntoConstraints = NO;
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DPWindowWidth-DPMiddleSpacing*2, 110)];
        _backView.backgroundColor = DPWhiteColor;
        
        _backView.layer.shadowColor = DPBlackColor.CGColor;
        _backView.layer.shadowOffset = CGSizeMake(0, 3);
        _backView.layer.shadowOpacity = 0.06;
        _backView.layer.shadowRadius = 5;
        
        CAShapeLayer *border = [CAShapeLayer layer];
        
        //虚线的颜色
        border.strokeColor = UIColorFromRGB(0xcccccc).CGColor;
        //填充的颜色
        border.fillColor = [UIColor clearColor].CGColor;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:_backView.bounds cornerRadius:6];
        
        //设置路径
        border.path = path.CGPath;
        
        border.frame = _backView.bounds;
        
        //虚线的宽度
        border.lineWidth = 0.5;
        
        //虚线的间隔
        border.lineDashPattern = @[@5, @3];
        
        [_backView.layer addSublayer:border];
        
    }
    return _backView;
}

- (UIImageView *)addImageView {
    if (!_addImageView) {
        _addImageView = [UIImageView newAutoLayoutView];
        [_addImageView setImage:[UIImage imageNamed:@"card_add"]];
    }
    return _addImageView;
}

- (UILabel *)addLabel {
    if (!_addLabel) {
        _addLabel = [UILabel newAutoLayoutView];
        _addLabel.text = @"添加信用卡";
        _addLabel.textColor = DPDarkGrayColor;
        _addLabel.font = DPFont6;
    }
    return _addLabel;
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
