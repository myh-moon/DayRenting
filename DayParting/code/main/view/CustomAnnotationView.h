//
//  CustomAnnotationView.h
//  DayParting
//
//  Created by jiamanu on 2018/8/16.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>

@interface CustomAnnotationView : MAAnnotationView

@property (nonatomic, strong) UIImageView *carBackgroundImageView;
@property (nonatomic, strong) UILabel *carNumberLabel;


//重写
- (void)setAnnotation:(id<MAAnnotation>)annotation;

@end
