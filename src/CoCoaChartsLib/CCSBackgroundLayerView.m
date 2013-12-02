//
//  CCSBackgroundLayerView.m
//  CocoaChartsSample
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 limc. All rights reserved.
//

#import "CCSBackgroundLayerView.h"

@implementation CCSBackgroundLayerView

- (void)initProperty
{
    [super initProperty];
    _layerLevel = CCSLayerLevelBackground;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}
@end
