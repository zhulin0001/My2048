//
//  GameViewController.h
//  My2048
//
//  Created by Zhulin on 14-4-23.
//  Copyright (c) 2014年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *gameView;
@property(nonatomic, strong)NSArray *tileArray;
@property(nonatomic, strong)NSMutableArray *numMatrixArray;

@end
