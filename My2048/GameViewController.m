//
//  GameViewController.m
//  My2048
//
//  Created by Zhulin on 14-4-23.
//  Copyright (c) 2014年 ios. All rights reserved.
//

#import "GameViewController.h"
#import "TileView.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSMutableArray *array = [NSMutableArray array];
        for (int i=0; i<16; i++) {
            [array addObject:[NSNumber numberWithInt:0]];
        }
        self.numMatrixArray = array;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<16; i++) {
        TileView *theTile = [[TileView alloc] init];
        theTile.center = CGPointMake(35+(i%4)*70, 35+i/4*70);
        [array addObject:theTile];
        [self.gameView addSubview:theTile];
    }
    self.tileArray = array;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
