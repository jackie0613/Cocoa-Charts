//
//  CCSCoordinate.h
//  CocoaChartsSample
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 limc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCSCoordinateDelegate.h"

typedef enum {
    CCSCoordinateAxisDirectionUp = 1,
    CCSCoordinateAxisDirectionDown,
    CCSCoordinateAxisDirectionRight,
    CCSCoordinateAxisDirectionLeft
} CCSCoordinateAxisDirection;

@interface CCSCoordinate : NSObject

@property(assign, nonatomic) CGRect rect;
@property(assign, nonatomic) CGRect chartRect;

@property(assign, nonatomic) CGPoint orginalPoint;
@property(assign, nonatomic) CGPoint startPointOfxAxis;
@property(assign, nonatomic) CGPoint endPointOfxAxis;
@property(assign, nonatomic) CGPoint startPointOfyAxis;
@property(assign, nonatomic) CGPoint endPointOfyAxis;

@property(assign, nonatomic) CCSCoordinateAxisDirection xAxisDirection;
@property(assign, nonatomic) CCSCoordinateAxisDirection yAxisDirection;

@end
