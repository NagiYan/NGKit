//
//  DirectionView.h
//  MoveView
//  用于拖动交换位置的视图
//  Created by zhaojianguo on 13-12-24.
//  Copyright (c) 2013年 zhaojianguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DirectionView;

@protocol DirectionDelegate <NSObject>

- (void)toucheMovedWith:(DirectionView *)view withLocation:(CGPoint)point moveGestureRecognizer:(UILongPressGestureRecognizer *)recognizer;

- (void)toucheDidEndMoved:(DirectionView *)view withLocation:(CGPoint)point moveGestureRecognizer:(UILongPressGestureRecognizer*) recognizer;

@end

@interface DirectionView : UIView

@property(nonatomic,assign) NSInteger index;

@property (nonatomic,assign) id<DirectionDelegate>delegate;

@end
