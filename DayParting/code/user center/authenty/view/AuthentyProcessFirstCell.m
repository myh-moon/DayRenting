//
//  AuthentyProcessFirstCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "AuthentyProcessFirstCell.h"

@implementation AuthentyProcessFirstCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return DPWindowHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.remindLabel];
    [self.contentView addSubview:self.faceButton];
    [self.contentView addSubview:self.oppositeButton];
    [self.contentView addSubview:self.submitButton];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    NSArray *views = @[self.remindLabel,self.faceButton,self.oppositeButton,self.submitButton];
    [views autoAlignViewsToAxis:ALAxisVertical];
    [[views firstObject] autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.remindLabel autoPinEdgeToSuperviewEdge:ALEdgeTop  withInset:5];
    
    //    [self.faceButton autoSetDimensionsToSize:CGSizeMake(294, 200)];
    [self.faceButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.remindLabel withOffset:30];
    [self.faceButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:60];
    [self.faceButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:60];
    [self.faceButton autoMatchDimension:ALDimensionHeight toDimension:ALDimensionWidth ofView:self.faceButton withMultiplier:0.68];
    
    
    //    [self.oppositeButton autoSetDimensionsToSize:CGSizeMake(294, 200)];
    [self.oppositeButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.faceButton withOffset:30];
    [self.oppositeButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.faceButton];
    [self.oppositeButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.faceButton];
    [self.oppositeButton autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.faceButton];
    
    [self.submitButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.oppositeButton withOffset:40];
    [self.submitButton autoSetDimensionsToSize:CGSizeMake(300, DPCommonButtonHeight)];
}

- (UILabel *)remindLabel {
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.text = @"请按照提示，上传有效二代身份证的正反面";
        _remindLabel.textColor = DPDarkGrayColor;
        _remindLabel.font = DPFont6;
    }
    return _remindLabel;
}

- (AuthentyPictureView *)faceButton {
    if (!_faceButton) {
        _faceButton = [AuthentyPictureView newAutoLayoutView];
        [_faceButton setImage:[UIImage imageNamed:@"id_back_bg"] forState:0];
        _faceButton.picLabel.text = @"上传身份证正面";
        [_faceButton.picImage setImage:[UIImage imageNamed:@"driver_camera"]];
        
        DPWeakSelf;
        [_faceButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(3434);
            }
        }];
    }
    return _faceButton;
}

- (AuthentyPictureView *)oppositeButton {
    if (!_oppositeButton) {
        _oppositeButton = [AuthentyPictureView newAutoLayoutView];
        [_oppositeButton setImage:[UIImage imageNamed:@"id_font_bg"] forState:0];
        _oppositeButton.picLabel.text = @"上传身份证反面";
        [_oppositeButton.picImage setImage:[UIImage imageNamed:@"driver_camera"]];

        DPWeakSelf;
        [_oppositeButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(3435);
            }
        }];
    }
    return _oppositeButton;
}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [UIButton newAutoLayoutView];
        [_submitButton setTitle:@"下一步" forState:0];
        [_submitButton setTitleColor:DPWhiteColor forState:0];
        _submitButton.titleLabel.font = DPFont6;
        _submitButton.backgroundColor = DPBlueColor;
        
        _submitButton.layer.cornerRadius = 25;
        
        _submitButton.layer.shadowColor = DPBlueColor.CGColor;
        _submitButton.layer.shadowOffset = CGSizeMake(0, 3);
        _submitButton.layer.shadowOpacity = 0.4;
        _submitButton.layer.shadowRadius = 5;
        
        DPWeakSelf;
        [_submitButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(3436);
            }
        }];
    }
    return _submitButton;
}


- (void)cellWillAppear {
    [super cellWillAppear];
    
    [[[RACObserve(self.item, sideString) skip:1] takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *side) {
        
        self.faceButton.picLabel.text = nil;
        self.faceButton.picImage.image = nil;
        
        [self.faceButton sd_setImageWithURL:[NSURL URLWithString:side] forState:0];
        
    }];
    
    [[[RACObserve(self.item, frontString) skip:1] takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *side) {
        
        self.oppositeButton.picLabel.text = nil;
        self.oppositeButton.picImage.image = nil;
        
        [self.oppositeButton sd_setImageWithURL:[NSURL URLWithString:side] forState:0];
        
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
