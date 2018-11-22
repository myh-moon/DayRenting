//
//  AuthentyProcessCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "AuthentyProcessCell.h"

@implementation AuthentyProcessCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 100;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset  =DPSeperateInsert;
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.pointImageView1];
    [self.contentView addSubview:self.pointImageView2];
    [self.contentView addSubview:self.pointImageView3];
    
    [self.contentView addSubview:self.lineLabel1];
    [self.contentView addSubview:self.lineLabel2];
    [self.contentView addSubview:self.lineLabel3];
    [self.contentView addSubview:self.lineLabel4];
    
    [self.contentView addSubview:self.pointTextLabel1];
    [self.contentView addSubview:self.pointTextLabel2];
    [self.contentView addSubview:self.pointTextLabel3];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.pointImageView1,self.pointImageView2,self.pointImageView3];
    [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSize:17 insetSpacing:NO];
    [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:25];
//    [views autoSetViewsDimension:ALDimensionHeight toSize:17];
    [views autoSetViewsDimensionsToSize:CGSizeMake(17, 17)];
    
    [self.pointImageView1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:45];
    
    [self.pointImageView3 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:45];
    
    NSArray *views1 = @[self.lineLabel1,self.lineLabel2,self.lineLabel3,self.lineLabel4];
    [views1 autoAlignViewsToAxis:ALAxisHorizontal];
    [[views1 firstObject] autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.pointImageView1];
    [views1 autoSetViewsDimensionsToSize:CGSizeMake((DPWindowWidth-171)/4, 2)];//(DPWindowWidth-45*2-17*3-5*6)/4
    
    [self.lineLabel1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.pointImageView1 withOffset:5];
    [self.lineLabel2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.lineLabel1 withOffset:5];
    
    [self.lineLabel3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.pointImageView2 withOffset:5];
    [self.lineLabel4 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.lineLabel3 withOffset:5];
    
    
    NSArray *views2 = @[self.pointTextLabel1,self.pointTextLabel2,self.pointTextLabel3];
    [views2 autoAlignViewsToAxis:ALAxisHorizontal];
    [[views2 firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.pointImageView1 withOffset:DPBigSpacing];
    
    [self.pointTextLabel1 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.pointImageView1];
    [self.pointTextLabel2 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.pointImageView2];
    [self.pointTextLabel3 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.pointImageView3];

}

- (UIImageView *)pointImageView1 {
    if (!_pointImageView1) {
        _pointImageView1 = [UIImageView newAutoLayoutView];
//        _pointImageView1.layer.cornerRadius = 8.5;
//        _pointImageView1.layer.masksToBounds = YES;
    }
    return _pointImageView1;
}

- (UIImageView *)pointImageView2 {
    if (!_pointImageView2) {
        _pointImageView2 = [UIImageView newAutoLayoutView];
//        _pointImageView2.layer.cornerRadius = 8.5;
//        _pointImageView2.layer.masksToBounds = YES;
    }
    return _pointImageView2;
}

- (UIImageView *)pointImageView3 {
    if (!_pointImageView3) {
        _pointImageView3 = [UIImageView newAutoLayoutView];
//        _pointImageView3.backgroundColor = DPLightGrayColor20;
//        _pointImageView3.layer.cornerRadius = 8.5;
//        _pointImageView3.layer.masksToBounds = YES;
    }
    return _pointImageView3;
}

- (UILabel *)lineLabel1 {
    if (!_lineLabel1) {
        _lineLabel1 = [UILabel newAutoLayoutView];
    }
    return _lineLabel1;
}

- (UILabel *)lineLabel2 {
    if (!_lineLabel2) {
        _lineLabel2 = [UILabel newAutoLayoutView];
    }
    return _lineLabel2;
}

- (UILabel *)lineLabel3 {
    if (!_lineLabel3) {
        _lineLabel3 = [UILabel newAutoLayoutView];
    }
    return _lineLabel3;
}

- (UILabel *)lineLabel4 {
    if (!_lineLabel4) {
        _lineLabel4 = [UILabel newAutoLayoutView];
    }
    return _lineLabel4;
}

- (UILabel *)pointTextLabel1 {
    if (!_pointTextLabel1) {
        _pointTextLabel1 = [UILabel newAutoLayoutView];
        _pointTextLabel1.text = @"身份认证";
        _pointTextLabel1.font = DPFont4;
    }
    return _pointTextLabel1;
}

- (UILabel *)pointTextLabel2 {
    if (!_pointTextLabel2) {
        _pointTextLabel2 = [UILabel newAutoLayoutView];
        _pointTextLabel2.text = @"脸部识别";
        _pointTextLabel2.font = DPFont4;
    }
    return _pointTextLabel2;
}

- (UILabel *)pointTextLabel3 {
    if (!_pointTextLabel3) {
        _pointTextLabel3 = [UILabel newAutoLayoutView];
        _pointTextLabel3.text = @"认证完成";
        _pointTextLabel3.font = DPFont4;
    }
    return _pointTextLabel3;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    if ([self.item.stepString isEqualToString:@"1"]) {
        self.pointImageView1.image = [UIImage imageNamed:@"authenty_blue"];
        self.pointImageView2.image = [UIImage imageNamed:@"authenty_hollow"];
        self.pointImageView3.image = [UIImage imageNamed:@"authenty_hollow"];
        
        self.lineLabel1.backgroundColor = DPBlueColor;
        self.pointTextLabel1.textColor = DPBlueColor;
        
        self.lineLabel2.backgroundColor = DPLightGrayColor20;
        self.lineLabel3.backgroundColor = DPLightGrayColor20;
        self.pointTextLabel2.textColor = DPLightGrayColor;
        
        self.lineLabel4.backgroundColor = DPLightGrayColor20;
        self.pointTextLabel3.textColor = DPLightGrayColor;
        

    }else if ([self.item.stepString isEqualToString:@"2"]){
        self.pointImageView1.image = [UIImage imageNamed:@"authenty_gray"];
        self.pointImageView2.image = [UIImage imageNamed:@"authenty_blue"];
        self.pointImageView3.image = [UIImage imageNamed:@"authenty_hollow"];
        
        
        self.lineLabel1.backgroundColor = DPBlueColor;
        self.pointTextLabel1.textColor = DPBlueColor;
        
        self.lineLabel2.backgroundColor = DPBlueColor;
        self.lineLabel3.backgroundColor = DPBlueColor;
        self.pointTextLabel2.textColor = DPBlueColor;
        
        self.lineLabel4.backgroundColor = DPLightGrayColor20;
        self.pointTextLabel3.textColor = DPLightGrayColor;
        
    }else{
        
        self.pointImageView1.image = [UIImage imageNamed:@"authenty_gray"];
        self.pointImageView2.image = [UIImage imageNamed:@"authenty_gray"];
        self.pointImageView3.image = [UIImage imageNamed:@"authenty_gray"];
        
        self.lineLabel1.backgroundColor = DPBlueColor;
        self.pointTextLabel1.textColor = DPBlueColor;
        
        self.lineLabel2.backgroundColor = DPBlueColor;
        self.lineLabel3.backgroundColor = DPBlueColor;
        self.pointTextLabel2.textColor = DPBlueColor;
        
        self.lineLabel4.backgroundColor = DPBlueColor;
        self.pointTextLabel3.textColor = DPBlueColor;
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
