//
//  JCViewController.m
//  scratch
//
//  Created by John Clem on 10/17/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "JCViewController.h"

@class Blame;

@interface JCViewController ()
{
    BOOL youStillWantMe;
    BOOL yellowRibbonIsTiedAroundOlOakTree;
}
@end

@implementation JCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (yellowRibbonIsTiedAroundOlOakTree) {
        youStillWantMe = TRUE;
    } else {
        [self stayOnBus];
        [self forgetAboutUs];
        [[JCViewController new] putBlameOn:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)stayOnBus
{
    
}

- (void)forgetAboutUs
{
    
}

- (void)putBlameOn:(id)blamed
{
    
}

@end
