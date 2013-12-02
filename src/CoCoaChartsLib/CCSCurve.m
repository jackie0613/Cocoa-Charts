//
//  CCSCurve.m
//  E Cocoa-Charts
//
//  Created by lengyc on 2013/11/29.
//  Copyright (c) 2013年 OSC. All rights reserved.
//

#import "CCSCurve.h"

@implementation CCSCurve

- (void)drawRect:(CGRect)rect
{
    [self layerDrawRect:rect];
}

- (void)layerDrawRect:(CGRect)rect
{
    if(nil == self.arrPoints || 0 == [self.arrPoints count]){
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    BOOL isFirstPoint = YES;
    
    for (NSValue *pointValue in self.arrPoints) {
        CGPoint point = [pointValue CGPointValue];
        
        if (isFirstPoint) {
            isFirstPoint = NO;
            CGContextMoveToPoint(context, point.x, point.y);
            
        }else{
            CGContextAddLineToPoint(context, point.x, point.y);
        }
    }
    
    CGContextClosePath(context);
    CGContextFillPath(context);
}
@end
