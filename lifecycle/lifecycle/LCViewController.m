//
//  LCViewController.m
//  lifecycle
//
//  Created by John Bender on 10/23/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "LCViewController.h"

typedef enum {
    Zero = 0,
    One = 1 << 0,
    Two = 1 << 1,
    Four = 1 << 2,
    Eight = 1 << 3
} MyFlags;

enum {
    OneHex = 0x01,
    TwoHex = 0x02,
    EightHex = 0x08,
    FifteenHex = 0x0f,
    SixteenHex = 0x10
};

typedef struct {
    NSInteger x_coord;
    NSInteger y_coord;
    void *myObj;
} MyPoint;

@interface LCViewController ()

@end

@implementation LCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    DLog( @"%d %d %d %d %d", Zero, One, Two, Four, Eight );
    DLog( @"%d (%x); %d (%x); %d (%x); %d (%x)", OneHex, OneHex, TwoHex, TwoHex, EightHex, EightHex, SixteenHex, SixteenHex );
    DLog( @"%@, hex address of self: %x", self, self );

    [self doStuffWithFlags:One|Eight];

    MyPoint myPoint = {1,8};
    myPoint.myObj = (__bridge void *)(self);
    DLog( @"%d %d", myPoint.x_coord, myPoint.y_coord );
    myPoint.y_coord = 3;

    MyPoint *ptr = malloc( sizeof( MyPoint ) );
    ptr->x_coord = 13;
    (*ptr).y_coord = 96;
    free( ptr );
}


-(void) doStuffWithFlags:(MyFlags)flags
{
    DLog( @"%d", flags );
    if( flags & One ) {
        DLog( @"one flag set" );
    }
    if( flags & Two ) {
        DLog( @"two flag set" );
    }
    if( flags & Four ) {
        DLog( @"four flag set" );
    }
    if( flags & Eight ) {
        DLog( @"eight flag set" );
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
