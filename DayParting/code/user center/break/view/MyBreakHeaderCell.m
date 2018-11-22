//
//  MyBreakHeaderCell.m
//  DayParting
//
//  Created by jiamanu on 2018/10/15.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MyBreakHeaderCell.h"

@implementation MyBreakHeaderCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 110;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPBackGroundColor;
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.headerLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.headerLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(DPBigSpacing, DPMiddleSpacing, DPBigSpacing, DPMiddleSpacing)];
}

- (UILabel *)headerLabel {
    if (!_headerLabel) {
        _headerLabel = [UILabel newAutoLayoutView];
        _headerLabel.numberOfLines = 0;
        _headerLabel.backgroundColor = DPWhiteColor;
        _headerLabel.textAlignment = NSTextAlignmentCenter;
        
        _headerLabel.layer.borderColor = DPLineColor2.CGColor;
        _headerLabel.layer.borderWidth = 0.5;
        _headerLabel.layer.cornerRadius = 6;
        
    }
    return _headerLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    NSString *firstString = @"已查询到";
    NSString *secondString = @"2条违章";
    NSString *thirdString = @"信息，发生在您使用\n车辆";
    NSString *fourString = self.item.licenseStr;
    NSString *fifthString = @"期间，请及时处理";
    
    NSString *str = [NSString stringWithFormat:@"%@%@%@%@%@",firstString,secondString,thirdString,fourString,fifthString];
    NSMutableAttributedString *setAttributeString = [[NSMutableAttributedString alloc] initWithString:str];
    
    [setAttributeString addAttributes:@{NSFontAttributeName:DPFont3,NSForegroundColorAttributeName:DPDarkGrayColor} range:NSMakeRange(0, firstString.length)];
    [setAttributeString addAttributes:@{NSFontAttributeName:DPFont3,NSForegroundColorAttributeName:DPBlueColor} range:NSMakeRange(firstString.length, secondString.length)];
    [setAttributeString addAttributes:@{NSFontAttributeName:DPFont3,NSForegroundColorAttributeName:DPDarkGrayColor} range:NSMakeRange(firstString.length+secondString.length, thirdString.length)];
    
    [setAttributeString addAttributes:@{NSFontAttributeName:DPFont3,NSForegroundColorAttributeName:DPBlueColor} range:NSMakeRange(firstString.length+secondString.length+thirdString.length, fourString.length)];
    [setAttributeString addAttributes:@{NSFontAttributeName:DPFont3,NSForegroundColorAttributeName:DPDarkGrayColor} range:NSMakeRange(firstString.length+secondString.length+thirdString.length+fourString.length, fifthString.length)];

    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = DPMiddleSpacing;
    style.alignment = 1;
    
    [setAttributeString addAttributes:@{NSParagraphStyleAttributeName:style} range:NSMakeRange(0, firstString.length+secondString.length+thirdString.length)];
    
    self.headerLabel.attributedText = setAttributeString;
    
    if ([self.item.numberStr isEqualToString:@"0"]) {
        self.headerLabel.attributedText = [NSString setAttributeOfFirstString:@"已查询到" firstFont:DPFont3 firstColor:DPDarkGrayColor secondString:@"0条违章" secondFont:DPFont3 secondColor:DPBlueColor thirdString:@"信息" thirdFont:DPFont3 thirdColor:DPDarkGrayColor];
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
