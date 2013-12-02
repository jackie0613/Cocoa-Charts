//
//  CCSChartView.m
//  CocoaChartsSample
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 limc. All rights reserved.
//

#import "CCSChartView.h"
#import "CCSChartDelegate.h"
#import "CCSBackgroundLayerView.h"
#import "CCSAxisLayerView.h"
#import "CCSNormalLayerView.h"
#import "CCSMaskLayerView.h"
#import "CCSTouchLayerView.h"

@interface CCSChartView ()

@property(strong, nonatomic) NSMutableArray *arrLayerViews;

- (void)produceLayers;
- (void)sortLayers;
- (void)adjustCoordinate;
@end

@implementation CCSChartView

- (void)dealloc
{
    [_arrLayerViews release];
    [_chartData release];
    [_chartModel release];
    
    _coordinate = nil;
    
    [super dealloc];
}

- (void)initProperty
{
    [super initProperty];
    
    self.arrLayerViews = [[[NSMutableArray alloc] init] autorelease];
    
    // 不 autorelease
    _coordinate = [[CCSCoordinate alloc] init];
    
    [self produceLayers];
}

- (void)setChartData:(CCSChartData *)chartData
{
    [_chartData autorelease];
    _chartData = [chartData retain];
}

- (void)drawRect:(CGRect)rect
{
    [self sortLayers];
    [self adjustCoordinate];
    
    for (CCSLayerView *layerView in self.arrLayerViews) {
        CGRect rect = self.coordinate.rect;
        rect.origin.x = 0;
        rect.origin.y = 0;
        layerView.frame = rect;
        
        [self addSubview:layerView];
        [layerView setNeedsDisplay];
    }
}

- (void)addLayerView:(CCSLayerView *)layerView
{
    [self.arrLayerViews addObject:layerView];
}

- (void)sortLayers
{
    [self.arrLayerViews sortUsingComparator:
     (NSComparator)^(CCSLayerView *layer1, CCSLayerView *layer2)
     {
         if (layer1.layerLevel < layer2.layerLevel) {
             return NSOrderedAscending;
             
         }else if(layer1.layerLevel > layer2.layerLevel){
             return NSOrderedDescending;
             
         }else{
             return NSOrderedSame;
         }
     }
     ];
}

- (void)adjustCoordinate
{
    _coordinate.rect = CGRectMake(0,
                                  0,
                                  self.frame.size.width,
                                  self.frame.size.height);
    
    for (id<CCSCoordinateDelegate> obj in self.arrLayerViews) {
        if([obj isKindOfClass:[CCSAxisLayerView class]]){
            [obj adjustCoordinate:_coordinate];
        }
    }
    
    for (id<CCSCoordinateDelegate> obj in self.arrLayerViews) {
        [obj coordinateDidAdjust:_coordinate];
    }
}

- (void)produceLayers
{
    [self addLayerView:[[[CCSBackgroundLayerView alloc] init] autorelease]];
    [self addLayerView:[[[CCSAxisLayerView alloc] init] autorelease]];
    [self addLayerView:[[[CCSNormalLayerView alloc] init] autorelease]];
    [self addLayerView:[[[CCSMaskLayerView alloc] init] autorelease]];
    [self addLayerView:[[[CCSTouchLayerView alloc] initWithDelegate:self] autorelease]];
    
    for (CCSLayerView *layerView in self.arrLayerViews) {
        if([layerView isKindOfClass:[CCSBackgroundLayerView class]] && self.backgroundColor != nil){
            layerView.backgroundColor = self.backgroundColor;
        }
    }
}

- (void)setCossLineNeedsDisplay:(CGPoint)singleTouchPoint
{
    for (CCSLayerView *layerView in self.arrLayerViews) {
        if([layerView isKindOfClass:[CCSAxisLayerView class]]){
            CCSAxisLayerView *axisLayerView = (CCSAxisLayerView *)layerView;
            [axisLayerView setCossLineNeedsDisplay:singleTouchPoint];
        }
    }
}
@end
