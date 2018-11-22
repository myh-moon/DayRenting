//
//  MyWalletRechargeMoneyCell.h
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BaseCell.h"
#import "MyWalletRechargeMoneyItem.h"

@interface MyWalletRechargeMoneyCell: BaseCell <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *moneyCollectionView;

@property (nonatomic,strong,readwrite) MyWalletRechargeMoneyItem *item;

@end
