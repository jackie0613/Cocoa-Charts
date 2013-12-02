//
//  CCSGraphicsView.h
//  CocoaChartsSample
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 limc. All rights reserved.
//

#import "CCSBaseView.h"
#import "CCSCoordinate.h"
#import "CCSLayerDeletate.h"

@interface CCSGraphicsView : CCSBaseView <CCSCoordinateDelegate, CCSLayerDeletate>

@property(readonly, nonatomic) CCSCoordinate *coordinate;

- (CGRect)getFrame;
@end
