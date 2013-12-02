//
//  CCSOriginalPoint.m
//  CocoaCharts-Experiment
//
//  Created by lengyc on 2013/11/19.
//  Copyright (c) 2013年 OSC. All rights reserved.
//

#import "CCSOriginalPoint.h"

@implementation CCSOriginalPoint

-(void)initProperty
{
    [super initProperty];
    
    self.radius = 4.0f;
    self.color = [UIColor greenColor].CGColor;
}

- (void)drawRect:(CGRect)rect
{    
    [self layerDrawRect:rect];
}

- (void)layerDrawRect:(CGRect)rect
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
@end
