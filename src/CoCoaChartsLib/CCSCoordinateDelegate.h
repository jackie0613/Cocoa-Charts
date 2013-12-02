//
//  CCSCoordinateDelegate.h
//  E Cocoa-Charts
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 OSC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCSCoordinate;

@protocol CCSCoordinateDelegate <NSObject>

- (void)coordinateDidAdjust:(CCSCoordinate *)coordinate;

@optional
- (void)adjustCoordinate:(CCSCoordinate *)coordinate;
@end
