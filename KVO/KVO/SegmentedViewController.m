//
//  SegmentedViewController.m
//  KVO
//
//  Created by John Clem on 10/24/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "SegmentedViewController.h"

@interface SegmentedViewController ()

- (IBAction)goBack:(id)sender;
- (IBAction)changedSelectedSegment:(UISegmentedControl*)sender;

@end

@implementation SegmentedViewController


- (IBAction)goBack:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)changedSelectedSegment:(UISegmentedControl*)sender
{
    NSInteger selectedSegment = [sender selectedSegmentIndex];
    NSNumber *selectedNumber = [NSNumber numberWithInteger:selectedSegment];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"segmentChanged" object:nil userInfo:@{@"newNumber" : selectedNumber}];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
