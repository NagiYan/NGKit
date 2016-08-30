//
//  DirectionView.m
//  MoveView
//
//  Created by zhaojianguo on 13-12-24.
//  Copyright (c) 2013年 zhaojianguo. All rights reserved.
//

#import "DirectionView.h"

@interface DirectionView ()
{
     CGPoint beginPoint;
}
@end

@implementation DirectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressedLong:)];
        [self addGestureRecognizer:longPress];
    }
    
    return self;
}

- (void) pressedLong:(UILongPressGestureRecognizer *) gestureRecognizer
{
    switch (gestureRecognizer.state)
    {
        case UIGestureRecognizerStateBegan:
            beginPoint = [gestureRecognizer locationInView:self];
            //放大这个item
            [self setAlpha:0.5];
            break;
        case UIGestureRecognizerStateEnded:
            beginPoint = [gestureRecognizer locationInView:self];
            [_delegate toucheDidEndMoved:self withLocation:beginPoint moveGestureRecognizer:gestureRecognizer];
            //变回原来大小
            [self setAlpha:1.0f];
            break;
        case UIGestureRecognizerStateFailed:
            break;
        case UIGestureRecognizerStateChanged:
            //移动
            [_delegate toucheMovedWith:self withLocation:beginPoint moveGestureRecognizer:gestureRecognizer];
            break;
        default:
            break;
    }
}

-(void)setIndex:(NSInteger)index_
{
    if (_index != index_)
    {
        _index = index_;
    }
}

@end
