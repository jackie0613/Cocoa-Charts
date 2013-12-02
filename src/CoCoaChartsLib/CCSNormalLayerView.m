//
//  CCSNormalLayerView.m
//  CocoaChartsSample
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 limc. All rights reserved.
//

#import "CCSNormalLayerView.h"
#import "CCSCurve.h"

@implementation CCSNormalLayerView

- (void)initProperty
{
    [super initProperty];
    _layerLevel = CCSLayerLevelNormal;
    
    
    CCSCurve *curve = [[[CCSCurve alloc] init] autorelease];
    
    [curve.arrPoints addObject:@""];
    
    [self.arrGraphicsViews addObject:curve];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}
@end
