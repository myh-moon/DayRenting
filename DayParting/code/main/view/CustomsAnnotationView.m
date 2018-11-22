//
//  CustomsAnnotationView.m
//  DayParting
//
//  Created by jiamanu on 2018/11/13.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "CustomsAnnotationView.h"

@implementation CustomsAnnotationView

- (void)dealloc {
    self.image = nil;
//    self.imageView = nil;
//    self.carButton = nil;
//    self.carBackgroundImageView = nil;
}

- (id)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    
    MAPointAnnotation *ann = (MAPointAnnotation *)annotation;
    self = [super initWithAnnotation:ann reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self initializeAnnotation:ann];
    }
    return self;
}

- (void) initializeAnnotation:(MAPointAnnotation *)ann {
    [self setupAnnotation:ann];
}

- (void)setupAnnotation:(MAPointAnnotation *)ann {
    //    NSString *mask = @"";
    CGRect frame = CGRectZero;
    frame = CGRectMake(0, 0, 46, 54);
    //    mask = @"rignt_arrow";
    
    self.bounds = frame;
    self.centerOffset = CGPointMake(0, -self.bounds.size.height*0.5);
    
    //设置背景图片
    //    self.carBackgroundImageView.image = [UIImage imageNamed:mask];
    self.carButton.frame = self.bounds;
    
    //数量
    [self.carButton setTitleColor:DPRedColor forState:0];
    self.carButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
    
    
//    self.carNumberLabel.textColor = DPWhiteColor;
//    self.carNumberLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
//    self.carNumberLabel.frame = CGRectMake(0, 0, 46, 43);
//    //    self.bounds;
//    self.carNumberLabel.backgroundColor = [UIColor clearColor];
}

- (UIButton *)carButton {
    if (!_carButton) {
        _carButton = [UIButton newAutoLayoutView];
    }
    return _carButton;
}

//- (UIImageView *)carBackgroundImageView {
//    if (!_carBackgroundImageView) {
//        _carBackgroundImageView = [[UIImageView alloc] init];
//        [self addSubview:_carBackgroundImageView];
//    }
//    return _carBackgroundImageView;
//}
//
//- (UILabel *)carNumberLabel {
//    if (!_carNumberLabel) {
//        _carNumberLabel = [[UILabel alloc] init];
//        _carNumberLabel.textAlignment = NSTextAlignmentCenter;
//        [self.carBackgroundImageView addSubview:_carNumberLabel];
//    }
//    return _carNumberLabel;
//}

- (void)setAnnotation:(id<MAAnnotation>)annotation {
    [super setAnnotation:annotation];
    
    MAPointAnnotation *ann = (MAPointAnnotation *)self.annotation;
    
    //当annotation滑出地图时候，即ann为nil时，不设置(否则由于枚举的类型会执行不该执行的方法)，只有annotation在地图范围内出现时才设置，可以打断点调试
    if (ann) {
        [self setupAnnotation:ann];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
