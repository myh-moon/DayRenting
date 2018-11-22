//
//  MyBreakDetailPictureCell.m
//  DayParting
//
//  Created by jiamanu on 2018/11/7.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MyBreakDetailPictureCell.h"
#import "OrderResultQuestionPictureCollectionViewCell.h"

@implementation MyBreakDetailPictureCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 320;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPWhiteColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.pictureCollectionView];
    [self.contentView addSubview:self.additionalTextView];

    [self setNeedsUpdateConstraints];
}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPBigSpacing];
    
    [self.pictureCollectionView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.titleLabel];
    [self.pictureCollectionView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:DPBigSpacing];
    [self.pictureCollectionView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
    [self.pictureCollectionView autoSetDimension:ALDimensionHeight toSize:100];
    
    [self.additionalTextView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.pictureCollectionView];
    [self.additionalTextView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:30];
    [self.additionalTextView autoSetDimension:ALDimensionHeight toSize:105];
    [self.additionalTextView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.pictureCollectionView];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.text = @"发票照片";
        _titleLabel.font = DPFont4;
        _titleLabel.textColor = DPDarkGrayColor;
    }
    return _titleLabel;
}

- (UICollectionView *)pictureCollectionView {
    if (!_pictureCollectionView) {
        UICollectionViewLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        
        _pictureCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _pictureCollectionView.backgroundColor = DPWhiteColor;
        _pictureCollectionView.delegate = self;
        _pictureCollectionView.dataSource = self;
        [_pictureCollectionView registerClass:[OrderResultQuestionPictureCollectionViewCell class] forCellWithReuseIdentifier:@"pictures"];
    }
    return _pictureCollectionView;
}

- (CCTextView *)additionalTextView {
    if (!_additionalTextView) {
        _additionalTextView = [CCTextView newAutoLayoutView];
        _additionalTextView.placeholder = @"如需补充详细信息，可在此处输入（选填）";
        _additionalTextView.font = DPFont4;
        _additionalTextView.textColor = DPDarkGrayColor;
        _additionalTextView.backgroundColor = DPBackGroundColor;
        [_additionalTextView setPlaceholderColor:DPLightGrayColor17];
        
        _additionalTextView.layer.cornerRadius = 3;
        _additionalTextView.layer.borderColor = DPLineColor2.CGColor;
        _additionalTextView.layer.borderWidth = 0.5;
    }
    return _additionalTextView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.item.pictureList.count;
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    OrderResultQuestionPictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pictures" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[OrderResultQuestionPictureCollectionViewCell alloc] init];
    }
    
    if ([self.item.pictureList[indexPath.item] isKindOfClass:[NSString class]]) {
        cell.pictureImageView.image = [UIImage imageNamed:self.item.pictureList[indexPath.item]];
        [cell.deleteButton setHidden:YES];
        
    }else if ([self.item.pictureList[indexPath.item] isKindOfClass:[UIImage class]]){
        cell.pictureImageView.image = self.item.pictureList[indexPath.item];
        [cell.deleteButton setHidden:NO];
        cell.deleteButton.tag = indexPath.item+40;
        
        if (self.item.didSelectedBtn) {
            [cell setDidClickBtn:^(NSInteger tag) {
                self.item.didSelectedBtn(tag);
            }];
        }
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 100);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.item.pictureList.count == 1) {
        if (self.item.didSelectedBtn) {
            self.item.didSelectedBtn(indexPath.item);
        }
    }else if (self.item.pictureList.count == 2){
        if (indexPath.item == 1) {
            if (self.item.didSelectedBtn) {
                self.item.didSelectedBtn(indexPath.item);
            }
        }else{//查看大图的item
            if (self.item.didSelectedBtn) {
                self.item.didSelectedBtn(indexPath.item+20);
            }
        }
    }else if(self.item.pictureList.count == 3 && [self.item.pictureList.lastObject isKindOfClass:[NSString class]]){
        if (indexPath.item == 2) {
            if (self.item.didSelectedBtn) {
                self.item.didSelectedBtn(indexPath.item);
            }
        }else{//查看大图的item item+20
            if (self.item.didSelectedBtn) {
                self.item.didSelectedBtn(indexPath.item+20);
            }
        }
    }else{
        if (self.item.didSelectedBtn) {
            self.item.didSelectedBtn(indexPath.item+20);
        }
    }
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    DPWeakSelf;
    [[[RACObserve(self.item, pictureList) distinctUntilChanged] takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSArray *pictures) {
        
        NSLog(@"张数：%lu",(unsigned long)pictures.count);
        
        [weakself.pictureCollectionView reloadData];
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
