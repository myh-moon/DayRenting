//
//  MyWalletRechargeMoneyCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/20.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyWalletRechargeMoneyCell.h"
#import "MyWalletRechargeMoneyCollectionViewCell.h"

@implementation MyWalletRechargeMoneyCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 130;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.moneyCollectionView];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    
    [self.moneyCollectionView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(DPBigSpacing, DPMiddleSpacing, 0, DPMiddleSpacing)];
}

- (UICollectionView *)moneyCollectionView {
    if (!_moneyCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 7.5;
        layout.minimumInteritemSpacing = 0.1;
        layout.itemSize = CGSizeMake((DPWindowWidth-DPMiddleSpacing*3)/3, 50);
        
        _moneyCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
        _moneyCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _moneyCollectionView.backgroundColor = DPWhiteColor;
        _moneyCollectionView.delegate = self;
        _moneyCollectionView.dataSource = self;
        [_moneyCollectionView registerClass:[MyWalletRechargeMoneyCollectionViewCell class] forCellWithReuseIdentifier:@"money"];
        
    }
    return _moneyCollectionView;
}

#pragma  mark - delegate and datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"money";
    MyWalletRechargeMoneyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[MyWalletRechargeMoneyCollectionViewCell alloc] initWithFrame:CGRectZero];
    }
    
    NSArray *wpwpw = @[@"50元",@"100元",@"200元",@"500元",@"800元",@"1000元"];
    cell.moneyLabel.text = wpwpw[indexPath.item];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MyWalletRechargeMoneyCollectionViewCell *cell = (MyWalletRechargeMoneyCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    cell.moneyLabel.backgroundColor = DPBlueColor;
    cell.moneyLabel.textColor = DPWhiteColor;
    
    if (indexPath.item != 0) {
        MyWalletRechargeMoneyCollectionViewCell *cell1 = (MyWalletRechargeMoneyCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
        cell1.moneyLabel.backgroundColor = DPWhiteColor;
        cell1.moneyLabel.textColor = DPLightGrayColor;
    }
    
    if (self.item.didSelectedBtn) {
        self.item.didSelectedBtn(indexPath.item + 10);
    }
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    MyWalletRechargeMoneyCollectionViewCell *cell = (MyWalletRechargeMoneyCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.moneyLabel.backgroundColor = DPWhiteColor;
    cell.moneyLabel.textColor = DPLightGrayColor;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSIndexPath *indexPaths = [NSIndexPath indexPathForItem:0 inSection:0];
            [self collectionView:self.moneyCollectionView didSelectItemAtIndexPath:indexPaths];
    });
    
    [[[RACObserve(self.item, rechargeMoney) skip:1] takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSString *money) {
        NSArray *ppp = @[@"50",@"100",@"200",@"500",@"800",@"1000"];
        NSInteger indexConstant = [ppp indexOfObject:money];
        if (indexConstant >= 0 && indexConstant <= 5) {
            for (NSInteger i = 0; i<6; i++) {
                if (i != indexConstant) {
                    //2.取消其他cell的选中
                    [self collectionView:self.moneyCollectionView didDeselectItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
                }else{
                    //1.先匹配到指定cell
                    [self collectionView:self.moneyCollectionView didSelectItemAtIndexPath:[NSIndexPath indexPathForItem:indexConstant inSection:0]];
                }
            }
        }else{
            //为匹配到
            for (NSInteger j=0; j<6; j++) {
                [self collectionView:self.moneyCollectionView didDeselectItemAtIndexPath:[NSIndexPath indexPathForItem:j inSection:0]];
            }
        }
        
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
