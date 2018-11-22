//
//  OrderResultQuestionPictureCollectionViewCell.m
//  DayParting
//
//  Created by jiamanu on 2018/10/30.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "OrderResultQuestionPictureCollectionViewCell.h"

@implementation OrderResultQuestionPictureCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    
    if (self) {
        
        [self.contentView addSubview:self.pictureImageView];
        [self.pictureImageView addSubview:self.deleteButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstarints) {
        
        [self.pictureImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        [self.deleteButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.deleteButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        self.didSetupConstarints = YES;
    }
    [super updateConstraints];
}

- (UIImageView *)pictureImageView {
    if (!_pictureImageView) {
        _pictureImageView = [UIImageView newAutoLayoutView];
        _pictureImageView.layer.cornerRadius = 3;
        _pictureImageView.image = [UIImage imageNamed:@"upload_photos"];
        _pictureImageView.userInteractionEnabled = YES;
        
    }
    return _pictureImageView;
}

- (UIButton *)deleteButton {
    if (!_deleteButton) {
        _deleteButton = [UIButton newAutoLayoutView];
        [_deleteButton setImage:[UIImage imageNamed:@"upload_photos_delete"] forState:0];
        
        DPWeakSelf;
        [_deleteButton addAction:^(UIButton *btn) {
            if (weakself.didClickBtn) {
                weakself.didClickBtn(btn.tag);
            }
        }];
    }
    return _deleteButton;
}

@end
