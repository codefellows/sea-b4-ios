//
//  PNFlipsideViewController.m
//  Push Notifications Demo
//
//  Created by John Clem on 9/23/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "PNFlipsideViewController.h"

@interface PNFlipsideViewController ()

@end

@implementation PNFlipsideViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
