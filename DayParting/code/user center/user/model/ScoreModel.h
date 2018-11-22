//
//  ScoreModel.h
//  DayParting
//
//  Created by jiamanu on 2018/9/19.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScoreModel : NSObject

@property (nonatomic,copy) NSString *norm;  //使用规则
@property (nonatomic,copy) NSString *money; //抵用券金额
@property (nonatomic,copy) NSString *score;  //所需积分
@property (nonatomic,copy) NSString *ID;  //


//积分明细需要的字段
@property (nonatomic,copy) NSString *addtime;  //
@property (nonatomic,copy) NSString *info;  //
//@property (nonatomic,copy) NSString *score;  //


@end
