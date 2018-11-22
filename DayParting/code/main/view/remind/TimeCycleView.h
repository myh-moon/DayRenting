//
//  TimeCycleView.h
//  DayParting
//
//  Created by jiamanu on 2018/10/18.
//  Copyright © 2018 easygo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimeCycleView : UIView

-(instancetype)initWithFrame:(CGRect)frame lineWidth:(float)lineWidth;

@property (assign,nonatomic) float progress;

@property (assign,nonatomic) CGFloat lineWidth;


@end

NS_ASSUME_NONNULL_END
