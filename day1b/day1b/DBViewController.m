//
//  DBViewController.m
//  day1b
//
//  Created by John Clem on 9/9/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "DBViewController.h"
#import "DBShoeSalesPerson.h"

@interface DBViewController ()

@end

@implementation DBViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    NSLog(@"View Did Load");

    DBShoeSalesPerson *salesPerson = [DBShoeSalesPerson new];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"View Did Appear");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"View Will Appear");

}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"View Will Layout Subviews");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
