//
//  CCSAxis.h
//  E Cocoa-Charts
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 OSC. All rights reserved.
//

#import "CCSGraphicsView.h"

typedef struct  {
    CGPoint startPoint;
    CGPoint endPoint;
}Axis;

@interface CCSAxis : CCSGraphicsView

@property(assign, nonatomic) NSUInteger margin;
@property(assign, nonatomic) NSUInteger distanceToBottompOfAxisX;
@property(assign, nonatomic) NSUInteger distanceTopLeftOfAxisY;

@property(assign, nonatomic) CGFloat radius;
@property(assign, nonatomic) CGColorRef color;

@property(assign, nonatomic) Axis xAxis;
@property(assign, nonatomic) Axis yAxis;

- (CGPoint)getOriginalPointWithRect:(CGRect)rect;
- (void)computAxis:(CGRect)rect;
@end
