//
//  AuthentyPictureView.h
//  DayParting
//
//  Created by jiamanu on 2018/9/13.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthentyPictureView : UIButton

@property (nonatomic,strong) UIImageView *picImage;
@property (nonatomic,strong) UILabel *picLabel;

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) NSLayoutConstraint *imageTopConstraints;
@property (nonatomic,strong) NSLayoutConstraint *labelBottomConstraints;


@end
