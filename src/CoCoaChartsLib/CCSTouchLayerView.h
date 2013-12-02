//
//  CCSTouchLayerView.h
//  CocoaChartsSample
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 limc. All rights reserved.
//

#import "CCSLayerView.h"
#import "CCSCoordinate.h"
#import "CCSTouchLayerDelegate.h"

@interface CCSTouchLayerView : CCSLayerView

@property(assign, nonatomic) id<CCSTouchLayerDelegate> touchLayerDelegate;

- (id)initWithDelegate:(id<CCSTouchLayerDelegate>)delegate;
@end
