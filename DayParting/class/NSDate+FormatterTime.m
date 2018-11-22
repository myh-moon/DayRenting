//
//  NSDate+FormatterTime.m
//  DayParting
//
//  Created by jiamanu on 2018/8/24.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "NSDate+FormatterTime.h"

@implementation NSDate (FormatterTime)

+ (NSString *)getYMDhmFormatterTime:(NSString *)timeInterval {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //处理模型数据时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    NSString *dateSMS = [dateFormatter stringFromDate:date];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    dateSMS = [dateFormatter stringFromDate:date];
    return dateSMS;
}

+ (NSString *)getMDWhmFormatterTime:(NSString *)timeInterval {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    NSArray *weekdayAry = [NSArray arrayWithObjects:@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    [dateFormatter setShortWeekdaySymbols:weekdayAry];
    
    //处理模型数据时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    NSString *dateSMS = [dateFormatter stringFromDate:date];
//    [dateFormatter setDateFormat:@"MM月dd日 \nEEEE H:mm"];
    [dateFormatter setDateFormat:@"YYYY.MM.dd  EEEE  HH:mm"];
    dateSMS = [dateFormatter stringFromDate:date];
    return dateSMS;
}


+ (NSString *)getYMDhmsFormatterTime:(NSString *)timeInterval {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //处理模型数据时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    NSString *dateSMS = [dateFormatter stringFromDate:date];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    dateSMS = [dateFormatter stringFromDate:date];
    return dateSMS;
}

+ (NSString *)getAnotherYMDhmsFormatterTime:(NSString *)timeInterval {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //处理模型数据时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    NSString *dateSMS = [dateFormatter stringFromDate:date];
    [dateFormatter setDateFormat:@"yyyy.MM.dd H:mm"];
    dateSMS = [dateFormatter stringFromDate:date];
    return dateSMS;
}

+ (NSString *)getHmFormatterTime:(NSString *)timeInterval {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //处理模型数据时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    NSString *dateSMS = [dateFormatter stringFromDate:date];
    [dateFormatter setDateFormat:@"HH:mm"];
    dateSMS = [dateFormatter stringFromDate:date];
    return dateSMS;
}


+ (NSString *)getYMFormatterTime:(NSString *)timeInterval {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //处理模型数据时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    NSString *dateSMS = [dateFormatter stringFromDate:date];
    [dateFormatter setDateFormat:@"yyyy-MM"];
    dateSMS = [dateFormatter stringFromDate:date];
    return dateSMS;
}

+ (NSString *)getMDhmFormatterTime:(NSString *)timeInterval {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //处理模型数据时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    NSString *dateSMS = [dateFormatter stringFromDate:date];
    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    dateSMS = [dateFormatter stringFromDate:date];
    return dateSMS;
}


@end
