//
//  TimeCycleProgress.m
//  DayParting
//
//  Created by jiamanu on 2018/10/18.
//  Copyright © 2018 easygo. All rights reserved.
//

#import "TimeCycleProgress.h"
#import "TimeCycleView.h"

@implementation TimeCycleProgress

{
    TimeCycleView* _circle;
    UILabel *_percentLabel;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}


-(void)initUI
{
    float lineWidth = 0.1*self.bounds.size.width;
    _percentLabel = [[UILabel alloc] initWithFrame:self.bounds];
    _percentLabel.textColor = [UIColor whiteColor];
    _percentLabel.textAlignment = NSTextAlignmentCenter;
    _percentLabel.font = [UIFont boldSystemFontOfSize:50];
    _percentLabel.text = @"0%";
    [self addSubview:_percentLabel];
    
    _circle = [[TimeCycleView alloc] initWithFrame:self.bounds lineWidth:lineWidth];
    [self addSubview:_circle];
}

#pragma mark -
#pragma mark Setter方法
-(void)setProgress:(float)progress
{
    _progress = progress;
    _circle.progress = progress;
    _percentLabel.text = [NSString stringWithFormat:@"%.0f%%",progress*100];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
