//
//  CCSMask.m
//  E Cocoa-Charts
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 OSC. All rights reserved.
//

#import "CCSMask.h"

@implementation CCSMask


- (void)drawRect:(CGRect)rect
{
    [self layerDrawRect:rect];
}

- (void)layerDrawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0f);
    CGContextSetFillColorWithColor(context,[UIColor redColor].CGColor);
    
    CGContextAddRect(context, CGRectMake(rect.origin.x,
                                         rect.origin.y,
                                         rect.size.width / 2,
                                         rect.size.width / 2));
    
    CGContextClosePath(context);
    CGContextFillPath(context);
}

@end
