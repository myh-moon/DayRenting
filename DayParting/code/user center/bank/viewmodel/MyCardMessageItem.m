//
//  MyCardMessageItem.m
//  DayParting
//
//  Created by jiamanu on 2018/9/5.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MyCardMessageItem.h"

@implementation MyCardMessageItem

- (instancetype)initWithBankModel:(WalletModel *)model {
    self = [super init];
    if (self) {
//        self.bankImageString = model
        self.bankNameString = model.name;
        self.bankNumberString = model.card;
    }
    return self;
}

@end
