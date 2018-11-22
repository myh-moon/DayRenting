//
//  OrderResultQuestionTypeCell.m
//  DayParting
//
//  Created by jiamanu on 2018/9/13.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "OrderResultQuestionTypeCell.h"
#import "OrderresultQuestionTypeCollectionViewCell.h"

@implementation OrderResultQuestionTypeCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
//    return 180+145;
    return 350;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.typeCollectionView];
    [self.contentView addSubview:self.reasonTextView];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:25];
    
    [self.typeCollectionView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.titleLabel];
    [self.typeCollectionView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:DPBigSpacing];
    [self.typeCollectionView autoSetDimensionsToSize:CGSizeMake(285, 145)];
    
    [self.reasonTextView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.self.typeCollectionView];
    [self.reasonTextView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.typeCollectionView];
    [self.reasonTextView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.reasonTextView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:DPMiddleSpacing];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = DPDarkGrayColor;
        _titleLabel.font = DPFont5;
    }
    return _titleLabel;
}

- (UICollectionView *)typeCollectionView {
    if (!_typeCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(80, 32);
        layout.minimumLineSpacing = DPMiddleSpacing;
        
        _typeCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
        _typeCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _typeCollectionView.delegate = self;
        _typeCollectionView.dataSource = self;
        _typeCollectionView.backgroundColor = DPBackGroundColor;
        [_typeCollectionView registerClass:[OrderresultQuestionTypeCollectionViewCell class] forCellWithReuseIdentifier:@"types"];
    }
    return _typeCollectionView;
}

#pragma mark - delegate and datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.item.typeLists.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    OrderresultQuestionTypeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"types" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[OrderresultQuestionTypeCollectionViewCell alloc] initWithFrame:CGRectZero];
    }
    
    cell.typeLabel.text = self.item.typeLists[indexPath.item];
    
    if (indexPath.item == self.item.typeSelected) {
        cell.typeLabel.textColor = DPBlueColor;
        cell.typeLabel.layer.borderColor = DPBlueColor.CGColor;
    }else{
        cell.typeLabel.textColor = DPLightGrayColor;
        cell.typeLabel.layer.borderColor = DPLightGrayColor21.CGColor;
    }
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, DPMiddleSpacing, DPMiddleSpacing);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.item.typeSelected = indexPath.item;
    [self.typeCollectionView reloadData];
}
 
- (CCTextView *)reasonTextView {
    if (!_reasonTextView) {
        _reasonTextView = [CCTextView newAutoLayoutView];
        _reasonTextView.backgroundColor = DPWhiteColor;
        _reasonTextView.textColor = DPDarkGrayColor;
        _reasonTextView.font = DPFont4;
        _reasonTextView.placeholder = @"问题补充…";
        
        DPWeakSelf;
        [_reasonTextView.rac_textSignal subscribeNext:^(NSString *text) {
            if (weakself.item.didEditting) {
                weakself.item.didEditting(text);
            }
        }];
    }
    return _reasonTextView;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.titleLabel.text = self.item.titleString;
    self.reasonTextView.placeholder = self.item.placeholderString;
    
    [self.typeCollectionView reloadData];
    
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
