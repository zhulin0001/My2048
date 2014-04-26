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
    self.gameView.delegate = self;
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
    [self refreshTitles];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshTitles{
    for (int i=0; i<16; i++) {
        TileView *theTile = [self.tileArray objectAtIndex:i];
        NSNumber *number = [self.numMatrixArray objectAtIndex:i];
        [theTile setNumber:[number intValue]];
    }
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

- (void)CaughtDragDirection:(_DIRECTION)direction{
    int map[4][4] = {0};
    for (int i=0; i<4; i++) {
        for (int j=0; j<4; j++) {
            map[i][j] = [[self.numMatrixArray objectAtIndex:4*i+j] intValue];
        }
    }
    
    for (int i=0; i<4; i++) {
        for (int j=0; j<4; j++) {
            printf("%d \t", map[i][j]);
        }
        printf("\n");
    }
    
    printf("\n");

    for (int j=0; j<4; j++) {
        NSMutableArray *array = [NSMutableArray array];
        for (int i=0; i<4; i++) {
            if (map[i][j] != 0) {
                [array addObject:[NSNumber numberWithInt:map[i][j]]];
            }
        }
        array = [NSMutableArray arrayWithArray:[self computeArray:array]];
        for (int k=0; k<4; k++) {
            map[k][j] = k < [array count] ? [[array objectAtIndex:k] intValue] : 0;
        }
    }
    
    NSMutableArray *newArray = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        for (int j=0; j<4; j++) {
            [newArray addObject:[NSNumber numberWithInt:map[i][j]]];
            printf("%d \t", map[i][j]);
        }
        printf("\n");
    }
    self.numMatrixArray = newArray;
    [self generateRandomTile];
    [self refreshTitles];

//    printf("direction is %d\n", direction);

}

- (NSArray*)computeArray:(NSArray*)array{
    NSMutableArray *result = [NSMutableArray array];
    int count = [array count];
    if ([array count] < 2) {
        [result addObjectsFromArray:array];
    }
    else{
        for (int i=0; i<count; i++) {
            int j = i + 1;
            if (j < count) {
                int a = [[array objectAtIndex:i] intValue];
                int b = [[array objectAtIndex:j] intValue];
                if (a == b) {
                    [result addObject:[NSNumber numberWithInt:2*a]];
                    i++, j++;
                }
                else{
                    [result addObject:[NSNumber numberWithInt:a]];
                }
            }
            else{
                [result addObject:[array objectAtIndex:i]];
            }
        }
    }
    return result;
}

- (IBAction)move:(id)sender {
    [self CaughtDragDirection:1];
}
@end
