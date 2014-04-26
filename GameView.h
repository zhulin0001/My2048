//
//  GameView.h
//  My2048
//
//  Created by Julin on 14-4-26.
//  Copyright (c) 2014年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    DIRECTION_UP = 1,
    DIRECTION_DOWN,
    DIRECTION_LEFT,
    DIRECTION_RIGHT,
} _DIRECTION;

@protocol GameViewDelegate <NSObject>

- (void)CaughtDragDirection:(_DIRECTION)direction;

@end

@interface GameView : UIView

@property(nonatomic)CGPoint startPoint;
@property(nonatomic)BOOL canTouch;
@property(nonatomic, weak)id<GameViewDelegate> delegate;

@end
