//
//  main.m
//  lifecycle
//
//  Created by John Bender on 10/23/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LCAppDelegate.h"

int main(int argc, char * argv[])
{
    printf( "main.m: %d args\n%s\n", argc, argv[0] );
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([LCAppDelegate class]));
    }
}
