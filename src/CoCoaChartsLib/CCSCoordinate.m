//
//  CCSCoordinate.m
//  CocoaChartsSample
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 limc. All rights reserved.
//

#import "CCSCoordinate.h"

@implementation CCSCoordinate

- (id)init{
    self = [super init];
    
    if(self){
        _rect = CGRectZero;
        _chartRect = CGRectZero;
        _orginalPoint = CGPointZero;
        _xAxisDirection = CCSCoordinateAxisDirectionRight;
        _yAxisDirection = CCSCoordinateAxisDirectionUp;
    }
    
    return self;
};
@end
