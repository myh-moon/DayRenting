//
//  NSString+Attribute.h
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Attribute)

//两部分
+ (NSMutableAttributedString *)setAttributeOfFirstString:(NSString *)firstString firstFont:(UIFont *)firstFont firstColor:(UIColor *)firstColor secondString:(NSString *)secondString secondFont:(UIFont *)secondFont secondColor:(UIColor *)secondColor;

//两部分带间距
+ (NSMutableAttributedString *)setAttributeOfFirstString:(NSString *)firstString firstFont:(UIFont *)firstFont firstColor:(UIColor *)firstColor secondString:(NSString *)secondString secondFont:(UIFont *)secondFont secondColor:(UIColor *)secondColor align:(NSInteger)align space:(CGFloat)space;

//三部分
+ (NSMutableAttributedString *)setAttributeOfFirstString:(NSString *)firstString firstFont:(UIFont *)firstFont firstColor:(UIColor *)firstColor secondString:(NSString *)secondString secondFont:(UIFont *)secondFont secondColor:(UIColor *)secondColor thirdString:(NSString *)thirdString thirdFont:(UIFont *)thirdFont thirdColor:(UIColor *)thirdColor;

//三部分 带间距
+ (NSMutableAttributedString *)setAttributeOfFirstString:(NSString *)firstString firstFont:(UIFont *)firstFont firstColor:(UIColor *)firstColor secondString:(NSString *)secondString secondFont:(UIFont *)secondFont secondColor:(UIColor *)secondColor thirdString:(NSString *)thirdString thirdFont:(UIFont *)thirdFont thirdColor:(UIColor *)thirdColor align:(NSInteger)align space:(CGFloat)space;

//三部分
+ (NSMutableAttributedString *)setAttributeOfFirstString:(NSString *)firstString firstFont:(UIFont *)firstFont firstColor:(UIColor *)firstColor secondString:(NSString *)secondString secondFont:(UIFont *)secondFont secondColor:(UIColor *)secondColor thirdString:(NSString *)thirdString thirdFont:(UIFont *)thirdFont thirdColor:(UIColor *)thirdColor fourString:(NSString *)fourString fourFont:(UIFont *)fourFont fourColor:(UIColor *)fourColor;

@end
