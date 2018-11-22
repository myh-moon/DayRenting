//
//  MineUserMessageCell.m
//  DayParting
//
//  Created by jiamanu on 2018/8/28.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MineUserMessageCell.h"

@implementation MineUserMessageCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 214;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = UIColorFromRGB(0x22242e);
    self.separatorInset = DPSeperateInsert;
    
    [self.contentView addSubview:self.messageBackImageView];
    
    [self.messageBackImageView addSubview:self.headerButton];
    [self.messageBackImageView addSubview:self.nameButton];
    [self.messageBackImageView addSubview:self.scoreButton];
    
    [self.messageBackImageView addSubview:self.lowGradeImageView];
    [self.messageBackImageView addSubview:self.gradeProgressView];
    [self.messageBackImageView addSubview:self.highGradeImageView];
    
    [self.messageBackImageView addSubview:self.lowGradeLabel];
    [self.messageBackImageView addSubview:self.remindLabel];
    [self.messageBackImageView addSubview:self.highGradeLabel];
    
    [self.contentView addSubview:self.messageRadianImageView];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.messageBackImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(DPMiddleSpacing, DPMiddleSpacing, DPSmallSpacing, DPMiddleSpacing)];
    
    NSArray *views = @[self.headerButton,self.nameButton,self.scoreButton];
    [views autoAlignViewsToAxis:ALAxisHorizontal];
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
    
    [self.headerButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.headerButton autoSetDimensionsToSize:CGSizeMake(50, 50)];
    
    [self.nameButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.headerButton withOffset:DPMiddleSpacing];
    
    [self.scoreButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.scoreButton autoSetDimension:ALDimensionHeight toSize:25];
    
    NSArray *views1 = @[self.lowGradeImageView,self.gradeProgressView,self.highGradeImageView];
    [views1 autoAlignViewsToAxis:ALAxisHorizontal];
    [[views1 firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headerButton withOffset:25];
    
    [self.lowGradeImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40];

    [self.gradeProgressView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.lowGradeImageView withOffset:DPMiddleSpacing];
    [self.gradeProgressView autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.highGradeImageView withOffset:-DPMiddleSpacing];
    [self.gradeProgressView autoSetDimension:ALDimensionHeight toSize:3];
    
    [self.highGradeImageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40];
    
    
    NSArray *views2 = @[self.lowGradeLabel,self.remindLabel,self.highGradeLabel];
    [views2 autoAlignViewsToAxis:ALAxisHorizontal];
    [[views2 firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lowGradeImageView withOffset:DPMiddleSpacing];
    
    [self.lowGradeLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.lowGradeImageView];

    [self.remindLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.gradeProgressView];
    
    [self.highGradeLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.highGradeImageView];

    [self.messageRadianImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, -1, 0) excludingEdge:ALEdgeTop];
}

- (UIImageView *)messageBackImageView {
    if (!_messageBackImageView) {
        _messageBackImageView = [UIImageView newAutoLayoutView];
        _messageBackImageView.image  = [UIImage imageNamed:@"center_backImage"];
        _messageBackImageView.userInteractionEnabled = YES;
    }
    return _messageBackImageView;
}

- (UIButton *)headerButton {
    if (!_headerButton) {
        _headerButton = [UIButton newAutoLayoutView];
        _headerButton.layer.cornerRadius = 25;
        _headerButton.layer.masksToBounds = YES;
    }
    return _headerButton;
}

- (UIButton *)nameButton {
    if (!_nameButton) {
        _nameButton = [UIButton newAutoLayoutView];
        _nameButton.titleLabel.font = DPFont4;
        [_nameButton setTitleColor:DPLightGrayColor14 forState:0];
    }
    return _nameButton;
}

- (UIButton *)scoreButton {
    if (!_scoreButton) {
        _scoreButton = [UIButton newAutoLayoutView];
        [_scoreButton setTitleColor:DPWhiteColor forState:0];
        _scoreButton.titleLabel.font = DPFont3;
        
        _scoreButton.layer.cornerRadius = 3;
        _scoreButton.layer.borderColor = DPWhiteColor.CGColor;
        _scoreButton.layer.borderWidth = 0.5;
        
        DPWeakSelf;
        [_scoreButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(32);
            }
        }];
    }
    return _scoreButton;
}

- (UIImageView *)lowGradeImageView {
    if (!_lowGradeImageView) {
        _lowGradeImageView = [UIImageView newAutoLayoutView];
    }
    return _lowGradeImageView;
}

- (UIProgressView *)gradeProgressView {
    if (!_gradeProgressView) {
        _gradeProgressView = [UIProgressView newAutoLayoutView];
        _gradeProgressView.progress = 0.2;
        _gradeProgressView.progressTintColor = DPLightGrayColor16;
        _gradeProgressView.trackTintColor = DPLightGrayColor15;
        
        _gradeProgressView.layer.cornerRadius = 4;
    }
    return _gradeProgressView;
}

- (UIImageView *)highGradeImageView {
    if (!_highGradeImageView) {
        _highGradeImageView = [UIImageView newAutoLayoutView];
    }
    return _highGradeImageView;
}

- (UILabel *)lowGradeLabel {
    if (!_lowGradeLabel) {
        _lowGradeLabel = [UILabel newAutoLayoutView];
//        _lowGradeLabel.text = @"普卡会员";
        _lowGradeLabel.font = DPFont3;
        _lowGradeLabel.textColor = DPLightGrayColor16;
    }
    return _lowGradeLabel;
}

- (UILabel *)highGradeLabel {
    if (!_highGradeLabel) {
        _highGradeLabel = [UILabel newAutoLayoutView];
//        _highGradeLabel.text = @"白银会员";
        _highGradeLabel.font = DPFont3;
        _highGradeLabel.textColor = DPLightGrayColor15;
    }
    return _highGradeLabel;
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.textColor = DPBackGroundColor;
        _remindLabel.font = DPFont3;
    }
    return _remindLabel;
}

- (UIImageView *)messageRadianImageView {
    if (!_messageRadianImageView) {
        _messageRadianImageView = [UIImageView newAutoLayoutView];
        _messageRadianImageView.image = [UIImage imageNamed:@"center_radian"];
    }
    return _messageRadianImageView;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.headerButton sd_setImageWithURL:[NSURL URLWithString:self.item.userImgString] forState:0 placeholderImage:[UIImage imageNamed:@"default_img"]];
    
    [self.nameButton setTitle:self.item.userNameString forState:0];
    
    NSString *ssss = [NSString stringWithFormat:@"  积分%@  ",self.item.scoreString];
    [self.scoreButton setTitle:ssss forState:0];
    
    //level1  level1_nofull  普卡会员
    //level2 level2_nofull  白银
    //level3 level3_nofull。黄金
    //level4 level4_nofull。铂金

    //level5 level5_nofull。钻石

    //level6 level6_nofull 皇冠
    
    NSInteger scores = [self.item.scoreString integerValue];
    if (scores < 300) {//普卡会员
        self.lowGradeLabel.text = @"普卡会员";
        [self.lowGradeImageView setImage:[UIImage imageNamed:@"level1"]];
        
        self.highGradeLabel.text = @"白银会员";
        [self.highGradeImageView setImage:[UIImage imageNamed:@"level2_nofull"]];
        
        self.gradeProgressView.progress = scores /300;
        self.remindLabel.text = [NSString stringWithFormat:@"距下一等级还需%ld积分",300 - scores];

    }else if (scores < 900){
        self.lowGradeLabel.text = @"白银会员";
        [self.lowGradeImageView setImage:[UIImage imageNamed:@"level2"]];
        
        self.highGradeLabel.text = @"黄金会员";
        [self.highGradeImageView setImage:[UIImage imageNamed:@"level3_nofull"]];
        
        self.gradeProgressView.progress = scores /900;
        self.remindLabel.text = [NSString stringWithFormat:@"距下一等级还需%ld积分",900 - scores];
        
    }else if (scores < 1800){
        self.lowGradeLabel.text = @"黄金会员";
        [self.lowGradeImageView setImage:[UIImage imageNamed:@"level3"]];
        
        self.highGradeLabel.text = @"铂金会员";
        [self.highGradeImageView setImage:[UIImage imageNamed:@"level4_nofull"]];
        
        self.gradeProgressView.progress = scores /1800;
        self.remindLabel.text = [NSString stringWithFormat:@"距下一等级还需%ld积分",1800 - scores];

    }else if(scores < 3000){
        self.lowGradeLabel.text = @"铂金会员";
        [self.lowGradeImageView setImage:[UIImage imageNamed:@"level4"]];
        
        self.highGradeLabel.text = @"钻石会员";
        [self.highGradeImageView setImage:[UIImage imageNamed:@"level5_nofull"]];
        
        self.gradeProgressView.progress = scores /3000;
        self.remindLabel.text = [NSString stringWithFormat:@"距下一等级还需%ld积分",3000 - scores];
        
    }else if(scores < 4500){
        self.lowGradeLabel.text = @"钻石会员";
        [self.lowGradeImageView setImage:[UIImage imageNamed:@"level5"]];
        
        self.highGradeLabel.text = @"皇冠会员";
        [self.highGradeImageView setImage:[UIImage imageNamed:@"level6_nofull"]];
        
        self.gradeProgressView.progress = scores /4500;
        self.remindLabel.text = [NSString stringWithFormat:@"距下一等级还需%ld积分",4500 - scores];

    }else{
        self.lowGradeLabel.text = @"钻石会员";
        [self.lowGradeImageView setImage:[UIImage imageNamed:@"level5"]];
        
        self.highGradeLabel.text = @"皇冠会员";
        [self.highGradeImageView setImage:[UIImage imageNamed:@"level6"]];
        self.highGradeLabel.textColor = DPLightGrayColor16;
        
        self.gradeProgressView.progress = 1.0;
        self.remindLabel.text = [NSString stringWithFormat:@"距下一等级还需%d积分",999];
        
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
