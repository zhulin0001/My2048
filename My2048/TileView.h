//
//  TileView.h
//  My2048
//
//  Created by Zhulin on 14-4-23.
//  Copyright (c) 2014年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TileView : UIView

@property(nonatomic, strong)UILabel * numberLabel;

- (void)setNumber:(int)number;

@end
