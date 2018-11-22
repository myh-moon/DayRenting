//
//  OrderResultQuestionTypeCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/13.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "OrderResultQuestionTypeItem.h"
#import "CCTextView.h"


@interface OrderResultQuestionTypeCell : BaseCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UILabel *titleLabel;


@property (nonatomic,strong) UICollectionView *typeCollectionView;
@property (nonatomic,strong) CCTextView *reasonTextView;

@property (nonatomic,strong,readwrite) OrderResultQuestionTypeItem *item;

@end
