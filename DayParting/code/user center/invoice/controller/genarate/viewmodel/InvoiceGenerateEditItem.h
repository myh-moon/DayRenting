//
//  InvoiceGenerateEditItem.h
//  DayParting
//
//  Created by jiamanu on 2018/9/4.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "RETableViewItem.h"

@interface InvoiceGenerateEditItem : RETableViewItem

@property (nonatomic,copy) NSString *titleString;
@property (nonatomic,copy) NSString *placeholderString;

@property (nonatomic,strong) void (^didEditing)(NSString *text);

@end
