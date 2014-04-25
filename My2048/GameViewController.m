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
    [self generateRandomTile];
    [self generateRandomTile];
}

- (void)generateRandomTile{
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<[self.numMatrixArray count]; i++) {
        NSNumber *number = [self.numMatrixArray objectAtIndex:i];
        if ([number intValue] == 0) {
            [array addObject:[NSNumber numberWithInteger:i]];
        }
    }
    int magicNum = arc4random_uniform(2) ? 2 : 4;
    int randomIndex = arc4random_uniform([array count]);
    NSNumber *number = [array objectAtIndex:randomIndex];
    [self.numMatrixArray replaceObjectAtIndex:[number intValue] withObject:[NSNumber numberWithInteger:magicNum]];
    
    NSLog([NSString stringWithFormat:@"%@", self.numMatrixArray], @"");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
