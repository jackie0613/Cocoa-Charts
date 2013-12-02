//
//  CCSCrossLine.m
//  E Cocoa-Charts
//
//  Created by lengyc on 2013/11/29.
//  Copyright (c) 2013年 OSC. All rights reserved.
//

#import "CCSCrossLine.h"

@interface CCSCrossLine ()

@property(assign, nonatomic) CGPoint touchedPoint;
@end

@implementation CCSCrossLine

- (void)initProperty
{
    [super initProperty];
    self.touchedPoint = CGPointZero;
}

- (void)drawRect:(CGRect)rect
{
    [self layerDrawRect:rect];
}

- (void)layerDrawRect:(CGRect)rect
{
    if (CGPointEqualToPoint(self.touchedPoint, CGPointZero)) {
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextSetLineWidth(context, 1.0f);
    CGContextSetStrokeColorWithColor(context,[UIColor whiteColor].CGColor);
    
    CGContextMoveToPoint(context,
                         0,
                         self.touchedPoint.y);
    CGContextAddLineToPoint(context,
                            rect.size.width,
                            self.touchedPoint.y);
    
    CGContextMoveToPoint(context,
                         self.touchedPoint.x,
                         0);
    CGContextAddLineToPoint(context,
                            self.touchedPoint.x,
                            rect.size.height);
    
    CGContextStrokePath(context);
}

- (void)updateCossLineWithPoint:(CGPoint)point
{
    self.touchedPoint = [self convertPoint:point fromView:self.superview];
    [self setNeedsDisplay];
}

- (CGRect)getFrame
{
    return self.coordinate.chartRect;
}
@end
