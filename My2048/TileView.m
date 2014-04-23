//
//  TileView.m
//  My2048
//
//  Created by Zhulin on 14-4-23.
//  Copyright (c) 2014年 ios. All rights reserved.
//

#import "TileView.h"

@implementation TileView

@synthesize numberLabel;

- (id)init
{
    self = [super initWithFrame:CGRectMake(0, 0, 60, 60)];
    if (self) {
        // Initialization code
        self.numberLabel = [[UILabel alloc] initWithFrame:self.frame];
        self.numberLabel.text = @"0";
        self.numberLabel.textAlignment = NSTextAlignmentCenter;
        self.numberLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.numberLabel];
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)setNumber:(int)number{
    self.numberLabel.text = [NSString stringWithFormat:@"%d", number];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
