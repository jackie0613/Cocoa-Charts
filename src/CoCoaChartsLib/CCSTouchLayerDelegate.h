//
//  CCSTouchLayerDelegate.h
//  CocoaChartsSample
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 limc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCSTouchLayerDelegate <NSObject>

- (void)setCossLineNeedsDisplay:(CGPoint)singleTouchPoint;
@end
