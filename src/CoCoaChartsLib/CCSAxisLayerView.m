//
//  CCSAxisLayerView.m
//  CocoaChartsSample
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 limc. All rights reserved.
//

#import "CCSAxisLayerView.h"
#import "CCSAxis.h"
#import "CCSOriginalPoint.h"
#import "CCSCrossLine.h"

@implementation CCSAxisLayerView

- (void)initProperty
{
    [super initProperty];
    
    _layerLevel = CCSLayerLevelAxis;
    
    [self.arrGraphicsViews addObject:[[[CCSAxis alloc] init] autorelease]];
    [self.arrGraphicsViews addObject:[[[CCSOriginalPoint alloc] init] autorelease]];
    [self.arrGraphicsViews addObject:[[[CCSCrossLine alloc] init] autorelease]];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}

- (void)adjustCoordinate:(CCSCoordinate *)coordinate
{
    for (id<CCSCoordinateDelegate> obj in self.arrGraphicsViews) {
        if([obj isKindOfClass:[CCSAxis class]]){
            [obj adjustCoordinate:coordinate];
        }
    }
}

- (void)setCossLineNeedsDisplay:(CGPoint)singleTouchPoint
{
    for (CCSGraphicsView *graphicsView in self.arrGraphicsViews) {
        
        if ([graphicsView isKindOfClass:[CCSCrossLine class]]) {
            CCSCrossLine *crossLine = (CCSCrossLine *)graphicsView;
            [crossLine updateCossLineWithPoint:singleTouchPoint];
        }
    }
}
@end
