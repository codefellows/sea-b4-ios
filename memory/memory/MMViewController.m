//
//  MMViewController.m
//  memory
//
//  Created by John Bender on 10/14/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "MMViewController.h"






void functionToCall( int *h, int *s, int *v )
{
    printf( "in function &h %x &s %x &v %x\n", &h, &s, &v );
    printf( "in function, h %x s %x v %x\n", h, s, v );
    printf( "values: h %d s %d v %d\n", *h, *s, *v );
    *h = 14;
    *s = 15;
    *v = 16;
}

void caller()
{
    int h = 0, s = 1, v = 2;
    printf( "h %d s %d v %d\n", h, s, v );
    printf( "&h %x &s %x &v %x\n", &h, &s, &v );
    functionToCall( &h, &s, &v );
    printf( "h %d s %d v %d\n", h, s, v );
}

@interface MMViewController ()

@end

@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    caller();
}

@end
