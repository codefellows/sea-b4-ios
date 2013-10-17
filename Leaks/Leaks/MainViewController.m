//
//  MainViewController.m
//  Leaks
//
//  Created by John Clem on 10/15/13.
//  Copyright (c) 2013 Code Fellow. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
{
    BOOL stackIsShowing;
}
@property (nonatomic, assign) IBOutlet UILabel *objectLabel;
@property (nonatomic, assign) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) NSNumber *objectCount;

- (IBAction)addObject:(id)sender;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    stackIsShowing = NO;
    _objectCount = [[NSNumber numberWithInt:0] retain];
}

- (IBAction)addObject:(id)sender
{
//    [_objectCount release];
    _objectCount = [[NSNumber numberWithInt:[_objectCount intValue]+1] retain];
    
    NSString *newLabel = [[NSString stringWithFormat:@"%d Object", [_objectCount intValue]] autorelease];
    
    [_objectLabel setText:newLabel];
    
}

- (IBAction)addPhoto:(id)sender
{
    for (int i=0; i<1000; i++) {
        NSData *retainedData = [[[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://upload.wikimedia.org/wikipedia/commons/d/d3/Nelumno_nucifera_open_flower_-_botanic_garden_adelaide2.jpg?%d", i]] options:NSDataReadingUncached error:nil] retain];
        
        [_imageView setImage:[UIImage imageWithData:retainedData]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    NSLog(@"Received Memory Warning");
    [super didReceiveMemoryWarning];
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
