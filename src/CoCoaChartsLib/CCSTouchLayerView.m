//
//  CCSTouchLayerView.m
//  CocoaChartsSample
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 limc. All rights reserved.
//

#import "CCSTouchLayerView.h"

@interface CCSTouchLayerView ()

@property(assign, nonatomic) CGPoint singleTouchPoint;
@end

@implementation CCSTouchLayerView

- (id)initWithDelegate:(id<CCSTouchLayerDelegate>)delegate
{
    self = [super init];
    
    if(self){
        self.touchLayerDelegate = delegate;
    }
    
    return self;
}

- (void)initProperty
{
    [super initProperty];
    _layerLevel = CCSLayerLevelMask;
    self.singleTouchPoint = CGPointZero;
}

- (void)drawRect:(CGRect)rect
{
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    NSArray *allTouches = [touches allObjects];
    
    if(1 == [allTouches count]){
        self.singleTouchPoint = [[allTouches objectAtIndex:0] locationInView:self];
        
        if(self.touchLayerDelegate && [self.touchLayerDelegate respondsToSelector:@selector(setCossLineNeedsDisplay:)]){
            [self.touchLayerDelegate setCossLineNeedsDisplay:self.singleTouchPoint];
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    NSArray *allTouches = [touches allObjects];
    
    if(1 == [allTouches count]){
        self.singleTouchPoint = [[allTouches objectAtIndex:0] locationInView:self];
        
        if(self.touchLayerDelegate && [self.touchLayerDelegate respondsToSelector:@selector(setCossLineNeedsDisplay:)]){
            [self.touchLayerDelegate setCossLineNeedsDisplay:self.singleTouchPoint];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    NSArray *allTouches = [touches allObjects];
    
    if(1 == [allTouches count]){
        self.singleTouchPoint = CGPointZero;
        
        if(self.touchLayerDelegate && [self.touchLayerDelegate respondsToSelector:@selector(setCossLineNeedsDisplay:)]){
            [self.touchLayerDelegate setCossLineNeedsDisplay:self.singleTouchPoint];
        }
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
}
@end
