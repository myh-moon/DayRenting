//
//  MANaviPolyline.m
//  DayParting
//
//  Created by jiamanu on 2018/9/26.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import "MANaviPolyline.h"

@implementation MANaviPolyline

@synthesize boundingMapRect;

- (id)initWithPolyline:(MAPolyline *)polyline
{
    self = [super init];
    if (self)
    {
        self.polyline = polyline;
        self.type = MANaviAnnotationTypeDrive;
    }
    return self;
}

- (CLLocationCoordinate2D) coordinate
{
    return [_polyline coordinate];
}

- (MAMapRect) boundingMapRect
{
    return [_polyline boundingMapRect];
}

@end
