//
//  LogOutCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "LogOutCell.h"

@implementation LogOutCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = DPWhiteColor;
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.logoutLabel];
//    [self.contentView addSubview:self.testImageView];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.logoutLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.logoutLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
//    [self.logoutLabel autoPinEdgeToSuperviewEdge:ALEdgeTop];
    
//    [self.testImageView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.logoutLabel];
//    [self.testImageView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
//    [self.testImageView autoSetDimensionsToSize:CGSizeMake(100, 100)];
}

- (UILabel *)logoutLabel {
    if (!_logoutLabel) {
        _logoutLabel = [UILabel newAutoLayoutView];
        _logoutLabel.text = @"退出登录";
        _logoutLabel.textColor = DPBlueColor;
        _logoutLabel.font = DPFont8;
    }
    return _logoutLabel;
}

- (UIImageView *)testImageView {
    if (!_testImageView) {
        _testImageView = [UIImageView newAutoLayoutView];
        
//        //测试gif
//        NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"gif" ofType:@"gif"];
//        NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
//        UIImage *image = [UIImage sd_animatedGIFWithData:imageData];
//
//        _testImageView.image = image;
    }
    return _testImageView;
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
