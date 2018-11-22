//
//  MainOrderRemindReturnConfirmView.h
//  DayParting
//
//  Created by jiamanu on 2018/8/22.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "BasePopView.h"

@interface MainOrderRemindReturnConfirmView : BasePopView

@property (nonatomic,strong) UIButton *cancelButton;
@property (nonatomic,strong) UIImageView *confirmImageView;
@property (nonatomic,strong) UILabel *remindLabel;
@property (nonatomic,strong) UILabel *attentionLabel;

@property (nonatomic,strong) UIButton *notReturnButton;  //不还车
@property (nonatomic,strong) UIButton *returnButton;  //立即还车

@property (nonatomic,strong) UILabel *horizonLabel;
@property (nonatomic,strong) UILabel *verticalLabel;


@end
