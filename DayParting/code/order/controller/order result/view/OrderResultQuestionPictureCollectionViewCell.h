//
//  OrderResultQuestionPictureCollectionViewCell.h
//  DayParting
//
//  Created by jiamanu on 2018/10/30.
//  Copyright © 2018 easygo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderResultQuestionPictureCollectionViewCell : UICollectionViewCell

@property (nonatomic,assign) BOOL didSetupConstarints;

@property (nonatomic,strong) UIImageView *pictureImageView;
@property (nonatomic,strong) UIButton *deleteButton;

@property (nonatomic,strong) void (^didClickBtn)(NSInteger tag);

@end

NS_ASSUME_NONNULL_END
