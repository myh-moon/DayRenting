//
//  MANaviAnnotation.h
//  DayParting
//
//  Created by jiamanu on 2018/9/26.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>

typedef NS_ENUM(NSInteger, MANaviAnnotationType)
{
    MANaviAnnotationTypeDrive = 0,
    MANaviAnnotationTypeWalking = 1,
    MANaviAnnotationTypeBus = 2,
    MANaviAnnotationTypeRailway = 3,
    MANaviAnnotationTypeRiding = 4
};

@interface MANaviAnnotation : MAPointAnnotation

@property (nonatomic,assign) MANaviAnnotationType type;


@end
