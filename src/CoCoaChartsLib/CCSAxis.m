//
//  CCSAxis.m
//  E Cocoa-Charts
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 OSC. All rights reserved.
//

#import "CCSAxis.h"

@implementation CCSAxis

#define TRIANGLE_LENGTH (5.0f)


- (void)initProperty
{
    [super initProperty];

    self.margin = 5.0f;
    self.distanceToBottompOfAxisX = 15.0f;
    self.distanceTopLeftOfAxisY = 15.0f;
    
    self.radius = 4.0f;
    self.color = [UIColor whiteColor].CGColor;
}

- (void)drawRect:(CGRect)rect
{
    [self layerDrawRect:rect];
}

- (void)layerDrawRect:(CGRect)rect
{
    [self computAxis:rect];
    [self drawXAxis:rect];
    [self drawYAxis:rect];
}

// X axis
- (void)drawXAxis:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    // x坐标轴
    CGContextMoveToPoint(context,
                         self.xAxis.startPoint.x,
                         self.xAxis.startPoint.y);
    CGContextAddLineToPoint(context,
                            self.xAxis.endPoint.x,
                            self.xAxis.endPoint.y);
    
    // x坐标轴箭头
    CGContextMoveToPoint(context,
                         self.xAxis.endPoint.x,
                         self.xAxis.endPoint.y);
    CGContextAddLineToPoint(context,
                            self.xAxis.endPoint.x - TRIANGLE_LENGTH,
                            self.xAxis.endPoint.y - TRIANGLE_LENGTH);
    
    CGContextMoveToPoint(context,
                         self.xAxis.endPoint.x,
                         self.xAxis.endPoint.y);
    CGContextAddLineToPoint(context,
                            self.xAxis.endPoint.x - TRIANGLE_LENGTH,
                            self.xAxis.endPoint.y + TRIANGLE_LENGTH);
    
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
}

//Y axis
- (void)drawYAxis:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    
    // y坐标轴
    CGContextMoveToPoint(context,
                         self.yAxis.startPoint.x,
                         self.yAxis.startPoint.y);
    CGContextAddLineToPoint(context,
                            self.yAxis.endPoint.x,
                            self.yAxis.endPoint.y);
    
    // y坐标轴箭头
    CGContextMoveToPoint(context,
                         self.yAxis.endPoint.x,
                         self.yAxis.endPoint.y);
    CGContextAddLineToPoint(context,
                            self.yAxis.endPoint.x - TRIANGLE_LENGTH,
                            self.yAxis.endPoint.y + TRIANGLE_LENGTH);
    
    CGContextMoveToPoint(context,
                         self.yAxis.endPoint.x,
                         self.yAxis.endPoint.y);
    CGContextAddLineToPoint(context,
                            self.yAxis.endPoint.x + TRIANGLE_LENGTH,
                            self.yAxis.endPoint.y + TRIANGLE_LENGTH);
    
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
}

- (void)drawOriginalPoint:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextSetLineWidth(context, 1.0f);
    CGContextSetFillColorWithColor(context,self.color);
    
    // 移动到圆心
    CGContextMoveToPoint(context, self.coordinate.orginalPoint.x, self.coordinate.orginalPoint.y);
    
    CGContextAddArc(context, self.coordinate.orginalPoint.x, self.coordinate.orginalPoint.y, self.radius, 0, 2 * M_PI, 0);
    CGContextClosePath(context);
    
    CGContextFillPath(context);
    CGContextRestoreGState(context);
}

- (CGPoint)getOriginalPointWithRect:(CGRect)rect
{
    return CGPointMake(rect.origin.x + self.margin + self.distanceTopLeftOfAxisY,
                       rect.origin.y + rect.size.height - self.margin - self.distanceToBottompOfAxisX);
}

- (void)computAxis:(CGRect)rect
{
    Axis xAxis, yAxis;
    
    xAxis.startPoint = CGPointMake(self.margin,
                                   rect.size.height -  self.margin - self.distanceToBottompOfAxisX);
    xAxis.endPoint = CGPointMake(rect.size.width - self.margin,
                                 rect.size.height -  self.margin - self.distanceToBottompOfAxisX);
    
    yAxis.startPoint = CGPointMake(self.margin + self.distanceTopLeftOfAxisY,
                                   rect.size.height - self.margin);
    yAxis.endPoint = CGPointMake(self.margin + self.distanceTopLeftOfAxisY,
                                 self.margin);
    
    self.xAxis = xAxis;
    self.yAxis = yAxis;
}

- (void)adjustCoordinate:(CCSCoordinate *)coordinate
{
    [self computAxis:coordinate.rect];
    
    coordinate.orginalPoint = [self getOriginalPointWithRect:coordinate.rect];
    coordinate.startPointOfxAxis = self.xAxis.startPoint;
    coordinate.endPointOfxAxis = self.xAxis.endPoint;
    coordinate.startPointOfyAxis = self.yAxis.startPoint;
    coordinate.endPointOfyAxis = self.yAxis.endPoint;
    
    
    CGFloat xAxisLength = fabsf(coordinate.endPointOfxAxis.x - coordinate.orginalPoint.x) -
    TRIANGLE_LENGTH * sqrt(2);
    
    CGFloat yAxisLength = fabsf(coordinate.endPointOfyAxis.y - coordinate.orginalPoint.y) -
                           TRIANGLE_LENGTH * sqrt(2);
    

    coordinate.chartRect = CGRectMake(coordinate.orginalPoint.x,
                                      coordinate.orginalPoint.y - yAxisLength,
                                      xAxisLength,
                                      yAxisLength);
}
@end
