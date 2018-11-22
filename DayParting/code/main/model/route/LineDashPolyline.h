//
//  LineDashPolyline.h
//  DayParting
//
//  Created by jiamanu on 2018/9/26.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAPolyline.h>
#import <MAMapKit/MAOverlay.h>

@interface LineDashPolyline : NSObject<MAOverlay>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@property (nonatomic, readonly) MAMapRect boundingMapRect;

@property (nonatomic, retain)  MAPolyline *polyline;

- (id)initWithPolyline:(MAPolyline *)polyline;

@end
