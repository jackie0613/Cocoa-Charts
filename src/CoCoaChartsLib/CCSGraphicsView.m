//
//  CCSGraphicsView.m
//  CocoaChartsSample
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 limc. All rights reserved.
//

#import "CCSGraphicsView.h"

@implementation CCSGraphicsView

- (void)dealloc
{
    [_coordinate release];
    [super dealloc];
}

- (void)initProperty
{
    [super initProperty];
    
    self.backgroundColor = [UIColor clearColor];
}

- (void)layerDrawRect:(CGRect)rect
{

}

- (void)coordinateDidAdjust:(CCSCoordinate *)coordinate
{
    _coordinate = [coordinate retain];
}

- (CGRect)getFrame
{
    return self.coordinate.rect;
}
@end
