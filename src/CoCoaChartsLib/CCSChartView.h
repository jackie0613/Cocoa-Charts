//
//  CCSChartView.h
//  CocoaChartsSample
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 limc. All rights reserved.
//

#import "CCSBaseView.h"
#import "CCSCoordinate.h"
#import "CCSLayerView.h"
#import "CCSTouchLayerDelegate.h"
#import "CCSChartModel.h"

@interface CCSChartView : CCSBaseView <CCSTouchLayerDelegate>

- (void)addLayerView:(CCSLayerView *)layerView;

@property(readonly, nonatomic) CCSCoordinate *coordinate;
@property(strong, nonatomic) CCSChartData *chartData;
@property(strong, nonatomic) CCSChartModel *chartModel;
@end
