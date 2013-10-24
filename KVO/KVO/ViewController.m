//
//  ViewController.m
//  KVO
//
//  Created by John Clem on 10/24/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)switchedSelectedSegment:(UISegmentedControl*)sender;

@property (nonatomic, weak) IBOutlet UILabel *selectedLabel;
@property (nonatomic, weak) IBOutlet UISegmentedControl *mySegmentedControl;

@end

@implementation ViewController

- (IBAction)switchedSelectedSegment:(UISegmentedControl *)sender
{
    NSInteger selectedSegment = [sender selectedSegmentIndex];
    NSNumber *selectedNumber = [NSNumber numberWithInteger:selectedSegment];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"segmentChanged" object:sender userInfo:@{@"newNumber" : selectedNumber}];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(selectedSegmentChanged:)
                                                 name:@"segmentChanged"
                                               object:_mySegmentedControl];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:@"segmentChanged"
                                                  object:_mySegmentedControl];
}

- (void)selectedSegmentChanged:(NSNotification *)notif
{
    
    NSString *selectedSegmentString = [NSString stringWithFormat:@"Selected: %d", [[notif.userInfo objectForKey:@"newNumber"] integerValue]];
    
    [_selectedLabel setText:selectedSegmentString];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
