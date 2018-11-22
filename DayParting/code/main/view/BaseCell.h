//
//  BaseCell.h
//  DayParting
//
//  Created by jiamanu on 2018/8/15.
//  Copyright © 2018年 easygo. All rights reserved.
//



@interface BaseCell : RETableViewCell

@property (nonatomic,assign) BOOL didSetupConstraints;

- (void) layoutCellConstraints;

@end
