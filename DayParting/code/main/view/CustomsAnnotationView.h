//
//  CustomsAnnotationView.h
//  DayParting
//
//  Created by jiamanu on 2018/11/13.
//  Copyright © 2018 easygo. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomsAnnotationView : MAAnnotationView

@property (nonatomic, strong) UIButton *carButton;

//重写
- (void)setAnnotation:(id<MAAnnotation>)annotation;

@end

NS_ASSUME_NONNULL_END
