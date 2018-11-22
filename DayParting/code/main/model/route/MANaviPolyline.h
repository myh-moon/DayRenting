//
//  MANaviPolyline.h
//  DayParting
//
//  Created by jiamanu on 2018/9/26.
//  Copyright © 2018年 easygo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MANaviAnnotation.h"

@interface MANaviPolyline : NSObject<MAOverlay>

@property (nonatomic, assign) MANaviAnnotationType type;
@property (nonatomic, strong) MAPolyline *polyline;

- (id)initWithPolyline:(MAPolyline *)polyline;

@end
