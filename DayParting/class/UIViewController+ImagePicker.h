//
//  UIViewController+ImagePicker.h
//  DayParting
//
//  Created by jiamanu on 2018/10/31.
//  Copyright © 2018 easygo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^SelectedImageHandler)(UIImage *img);

@interface UIViewController (ImagePicker)<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic,strong) SelectedImageHandler imageHandler;

//拍照
//- (void)showAlertOfImageChoiceWith:(SelectedImageHandler)handler;

//查看大图片
//- (void) showImages:(NSArray *)images currentIndex:(NSInteger)currentIndex;

@end

NS_ASSUME_NONNULL_END
