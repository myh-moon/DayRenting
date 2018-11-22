//
//  MapAreaImageView.m
//  DayParting
//
//  Created by jiamanu on 2018/11/13.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "MapAreaImageView.h"

@implementation MapAreaImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"bgzz"];
//        self.backgroundColor = DPRedColor;
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
