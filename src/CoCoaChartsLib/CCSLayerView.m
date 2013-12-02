//
//  CCSLayerView.m
//  CocoaChartsSample
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 limc. All rights reserved.
//

#import "CCSLayerView.h"
#import "CCSTouchLayerDelegate.h"

@interface CCSLayerView ()

- (void)didDrawWithObject:(id<CCSLayerDeletate>)obj Rect:(CGRect)rect;
@end

@implementation CCSLayerView
@synthesize layerLevel = _layerLevel;

- (void)dealloc
{
    [_arrGraphicsViews release];
    [_coordinate release];
    [super dealloc];
}

- (void)initProperty
{
    [super initProperty];
    
    self.backgroundColor = [UIColor clearColor];
    _arrGraphicsViews = [[NSMutableArray alloc] init];
}

- (void)coordinateDidAdjust:(CCSCoordinate *)coordinate
{
    _coordinate = [coordinate retain];
    
    for (id<CCSCoordinateDelegate> obj in self.arrGraphicsViews) {
        [obj coordinateDidAdjust:coordinate];
    }
}

- (void)drawRect:(CGRect)rect
{
//    for (id<CCSLayerDeletate> graphics in self.arrGraphicsViews) {
//        
//        if([graphics respondsToSelector:@selector(layerDrawRect:)]){
//            [self didDrawWithObject:graphics Rect:rect];
//        }
//    }
    
    for (CCSGraphicsView *graphicsView in self.arrGraphicsViews) {
        graphicsView.frame = [graphicsView getFrame];
        [self addSubview:graphicsView];
    }
}

- (void)didDrawWithObject:(id<CCSLayerDeletate>)obj Rect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    [obj layerDrawRect:rect];
    
    CGContextRestoreGState(context);
}

- (void)addGraphicsView:(CCSGraphicsView *)graphicsView
{
    [self.arrGraphicsViews addObject:graphicsView];
}
@end