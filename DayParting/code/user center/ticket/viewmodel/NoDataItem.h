//
//  NoDataItem.h
//  DayParting
//
//  Created by jiamanu on 2018/10/23.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BaseItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface NoDataItem : BaseItem

@property (nonatomic,copy) NSString *imageString; //提示图片
@property (nonatomic,copy) NSString *buttonString; //提示文字

@end

NS_ASSUME_NONNULL_END
