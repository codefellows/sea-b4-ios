//
//  MMViewController.m
//  memory
//
//  Created by John Bender on 10/14/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "MMViewController.h"






void functionToCall( int *h, int *s, int *v, int *array )
{
    printf( "in function &h %x &s %x &v %x\n", &h, &s, &v );
    printf( "in function, h %x s %x v %x\n", h, s, v );
    printf( "values: h %d s %d v %d\n", *h, *s, *v );
    *h = 14;
    *s = 15;
    *v = 16;

    *array = 103;
    *(array + 1) = 104;
    *(array + 18) = 109; // yikes! wrote somebody else's memory and didn't crash!!
}

void caller()
{
    int h = 0, s = 1, v = 2;
    printf( "h %d s %d v %d\n", h, s, v );
    printf( "&h %x &s %x &v %x\n", &h, &s, &v );

    int *arr = malloc( 8*sizeof( int ) );
    arr[0] = 5;
    arr[1] = 13;
    *(arr + 2) = 91;
    printf( "arr[0]=%d, arr[1]=%d, arr[2]=%d\n", arr[0], arr[1], arr[2] );

    functionToCall( &h, &s, &v, arr );

    printf( "after: h %d s %d v %d\n", h, s, v );
    printf( "after: arr[0]=%d, arr[1]=%d, arr[2]=%d\n", arr[0], arr[1], arr[2] );

    free( arr );
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
