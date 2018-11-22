//
//  MyBreakDetailPictureCell.h
//  DayParting
//
//  Created by jiamanu on 2018/11/7.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyBreakDetailPictureItem.h"
#import "CCTextView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyBreakDetailPictureCell : BaseCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UICollectionView *pictureCollectionView;
@property (nonatomic,strong) CCTextView *additionalTextView;

@property (nonatomic,strong,readwrite) MyBreakDetailPictureItem *item;

@end

NS_ASSUME_NONNULL_END
