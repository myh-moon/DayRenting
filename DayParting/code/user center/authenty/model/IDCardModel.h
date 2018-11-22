//
//  IDCardModel.h
//  DayParting
//
//  Created by jiamanu on 2018/9/6.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDCardModel : NSObject

//正面内容
@property (nonatomic,copy) NSString *name;  //名字
@property (nonatomic,copy) NSString *sex;  //性别
@property (nonatomic,copy) NSString *nationality;  //民族
@property (nonatomic,copy) NSString *birth;  //生日
@property (nonatomic,copy) NSString *address; //住址
@property (nonatomic,copy) NSString *num;  //身份证号

@property (nonatomic,copy) NSString *success;
@property (nonatomic,copy) NSString *httpCode;
@property (nonatomic,copy) NSString *request_id;
//@property (nonatomic,copy) NSString *config_str;


@end
