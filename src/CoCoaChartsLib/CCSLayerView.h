//
//  CCSLayerView.h
//  CocoaChartsSample
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 limc. All rights reserved.
//

#import "CCSBaseView.h"
#import "CCSCoordinate.h"
#import "CCSGraphicsView.h"

typedef enum{
    CCSLayerLevelBackground = 100,
    CCSLayerLevelAxis = 200,
    CCSLayerLevelNormal = 300,
    CCSLayerLevelMask = 400,
    CCSLayerLevelTouch = 500
}CCSLayerLevel;

@interface CCSLayerView : CCSBaseView <CCSCoordinateDelegate>
{
    NSInteger _layerLevel;
}

@property(readonly, nonatomic) NSInteger layerLevel;
@property(readonly, nonatomic) NSMutableArray *arrGraphicsViews;
@property(readonly, nonatomic) CCSCoordinate *coordinate;

- (void)addGraphicsView:(CCSGraphicsView *)graphicsView;

@end
