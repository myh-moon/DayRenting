//
//  OrderResultQuestionPictureCell.h
//  DayParting
//
//  Created by jiamanu on 2018/10/29.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "OrderResultQuestionPictureItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderResultQuestionPictureCell : BaseCell<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UILabel *titleLabel;  

@property (nonatomic,strong) UICollectionView *imageCollectionView;
@property (nonatomic,strong) NSLayoutConstraint *heightPictureCollection;

@property (nonatomic,strong,readwrite) OrderResultQuestionPictureItem *item;

@end

NS_ASSUME_NONNULL_END
