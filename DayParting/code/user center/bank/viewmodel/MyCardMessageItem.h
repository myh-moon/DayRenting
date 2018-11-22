//
//  MyCardMessageItem.h
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "RETableViewItem.h"
#import "WalletModel.h"

@interface MyCardMessageItem : RETableViewItem

@property (nonatomic,copy) NSString *bankImageString;
@property (nonatomic,copy) NSString *bankNameString;
@property (nonatomic,copy) NSString *bankNumberString;

- (instancetype) initWithBankModel:(WalletModel *)model;
@end
