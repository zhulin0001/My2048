//
//  GameView.m
//  My2048
//
//  Created by Julin on 14-4-26.
//  Copyright (c) 2014年 ios. All rights reserved.
//

#import "GameView.h"

@implementation GameView

@synthesize startPoint, canTouch;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib{
    self.canTouch = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    self.startPoint = [touch locationInView:self];
}

#define MIN_DRAG_OFFSET 10

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    NSInteger direction = 0;
    CGPoint currentTouchPosition = [touch locationInView:self];
    if(fabsf(self.startPoint.y - currentTouchPosition.y) >=
       MIN_DRAG_OFFSET &&
       fabsf(self.startPoint.x - currentTouchPosition.x) <=
       MIN_DRAG_OFFSET)
    {
        if (self.startPoint.y < currentTouchPosition.y){
            direction = DIRECTION_DOWN;
        }
        else{
            direction = DIRECTION_UP;
        }
    }
    else if (fabsf(self.startPoint.y - currentTouchPosition.y) <=
             MIN_DRAG_OFFSET &&
             fabsf(self.startPoint.x - currentTouchPosition.x) >=
             MIN_DRAG_OFFSET)
    {
        if (self.startPoint.x < currentTouchPosition.x) {
            direction = DIRECTION_RIGHT;
        }
        else{
            direction = DIRECTION_LEFT;
        }
    }
    if (direction != 0 && self.canTouch) {
        self.canTouch = NO;
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(CaughtDragDirection:)]) {
            [self.delegate CaughtDragDirection:direction];
        }
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.canTouch = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    self.canTouch = YES;
}

@end
