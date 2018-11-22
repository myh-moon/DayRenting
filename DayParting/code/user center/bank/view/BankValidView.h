//
//  BankValidView.h
//  DayParting
//
//  Created by jiamanu on 2018/11/1.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "BasePopView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BankValidView : BasePopView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,strong) UIView *whiteBackView;
@property (nonatomic,strong) UIButton *cancelButton;
@property (nonatomic,strong) UIButton *okButton;
//@property (nonatomic,strong) UIDatePicker *generateDatePicker;
@property (nonatomic,strong) UIPickerView *validPickerView;

@property (nonatomic,strong) void (^didSelectedBtn)(NSString *idd);

@end

NS_ASSUME_NONNULL_END
