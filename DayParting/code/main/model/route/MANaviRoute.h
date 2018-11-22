//
//  MANaviRoute.h
//  DayParting
//
//  Created by jiamanu on 2018/9/26.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>
#import "MANaviAnnotation.h"
#import "MANaviPolyline.h"
#import "LineDashPolyline.h"
#import "CommonUtility.h"

@interface MANaviRoute : NSObject

/// 是否显示annotation, 显示路况的情况下无效。
@property (nonatomic, assign) BOOL anntationVisible;

@property (nonatomic, strong) NSArray *routePolylines;
@property (nonatomic, strong) NSArray *naviAnnotations;

/// 步行路线颜色
@property (nonatomic, strong) UIColor *walkingColor;

/// 多彩线颜色
@property (nonatomic, strong) NSArray<UIColor *> *multiPolylineColors;

- (void)addToMapView:(MAMapView *)mapView;

- (void)removeFromMapView;

- (void)setNaviAnnotationVisibility:(BOOL)visible;

//+ (instancetype)naviRouteForTransit:(AMapTransit *)transit startPoint:(AMapGeoPoint *)start endPoint:(AMapGeoPoint *)end;
//
+ (instancetype)naviRouteForPath:(AMapPath *)path withNaviType:(MANaviAnnotationType)type showTraffic:(BOOL)showTraffic startPoint:(AMapGeoPoint *)start endPoint:(AMapGeoPoint *)end;
//
//+ (instancetype)naviRouteForPolylines:(NSArray *)polylines andAnnotations:(NSArray *)annotations;
//
////
//- (instancetype)initWithTransit:(AMapTransit *)transit startPoint:(AMapGeoPoint *)start endPoint:(AMapGeoPoint *)end;
//- (instancetype)initWithPath:(AMapPath *)path withNaviType:(MANaviAnnotationType)type showTraffic:(BOOL)showTraffic startPoint:(AMapGeoPoint *)start endPoint:(AMapGeoPoint *)end;
//- (instancetype)initWithPolylines:(NSArray *)polylines andAnnotations:(NSArray *)annotations;


- (instancetype)initWithPath:(AMapPath *)path withNaviType:(MANaviAnnotationType)type showTraffic:(BOOL)showTraffic startPoint:(AMapGeoPoint *)start endPoint:(AMapGeoPoint *)end;


@end
