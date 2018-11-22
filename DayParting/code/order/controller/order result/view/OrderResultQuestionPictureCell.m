//
//  OrderResultQuestionPictureCell.m
//  DayParting
//
//  Created by jiamanu on 2018/10/29.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "OrderResultQuestionPictureCell.h"
#import "OrderResultQuestionPictureCollectionViewCell.h"


@implementation OrderResultQuestionPictureCell

//+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
//    return 180;
//}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = DPSeperateInsert;
    self.backgroundColor = DPBackGroundColor;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.imageCollectionView];
    
    [self setNeedsUpdateConstraints];
    
   self.heightPictureCollection = [self.imageCollectionView autoSetDimension:ALDimensionHeight toSize:100];

}

- (void)layoutCellConstraints {
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:DPMiddleSpacing];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:DPMiddleSpacing];
    
    [self.imageCollectionView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.titleLabel];
    [self.imageCollectionView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:DPBigSpacing];
    [self.imageCollectionView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:DPMiddleSpacing];
//    [self.imageCollectionView autoSetDimension:ALDimensionHeight toSize:100];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = DPDarkGrayColor;
        _titleLabel.font = DPFont5;
    }
    return _titleLabel;
}

- (UICollectionView *)imageCollectionView {
    if (!_imageCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(100, 100);
        layout.minimumLineSpacing = DPMiddleSpacing;
        
        _imageCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
        _imageCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _imageCollectionView.delegate = self;
        _imageCollectionView.dataSource = self;
        _imageCollectionView.backgroundColor = DPBackGroundColor;
        
        [_imageCollectionView registerClass:[OrderResultQuestionPictureCollectionViewCell class] forCellWithReuseIdentifier:@"GradientCell"];
    }
    return _imageCollectionView;
}

#pragma mark - collectionview delegate and datasource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.item.pictureList.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"GradientCell";
    OrderResultQuestionPictureCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[OrderResultQuestionPictureCollectionViewCell alloc] initWithFrame:CGRectZero];
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

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.item.pictureList.count == 1) {
        if (self.item.didSelectedBtn) {
            self.item.didSelectedBtn(indexPath.item);
        }
    }else if (self.item.pictureList.count >= 2 && self.item.pictureList.count < 6){
        if (indexPath.item == self.item.pictureList.count-1) {
            if (self.item.didSelectedBtn) {
                self.item.didSelectedBtn(indexPath.item);
            }
        }else{//查看大图的item
            if (self.item.didSelectedBtn) {
                self.item.didSelectedBtn(indexPath.item+20);
            }
        }
    }else if(self.item.pictureList.count == 6 && [self.item.pictureList.lastObject isKindOfClass:[NSString class]]){
        if (indexPath.item == 5) {
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
    
    self.titleLabel.text = self.item.titleString;
    
    DPWeakSelf;
    [[[RACObserve(self.item, pictureList) distinctUntilChanged] takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(NSArray *pictures) {
        if (pictures.count > 3) {//180+115
            weakself.heightPictureCollection.constant = 100+115;
        }else {
            weakself.heightPictureCollection.constant = 100;
        }
        [weakself.imageCollectionView reloadData];
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
