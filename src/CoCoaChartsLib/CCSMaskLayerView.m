//
//  CCSMaskLayerView.m
//  CocoaChartsSample
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 limc. All rights reserved.
//

#import "CCSMaskLayerView.h"
#import "CCSMask.h"

@implementation CCSMaskLayerView

- (void)initProperty
{
    [super initProperty];
    _layerLevel = CCSLayerLevelMask;
    
//    [self.arrGraphicsViews addObject:[[[CCSMask alloc] init] autorelease]];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}
@end
