//
//  D1ViewController.m
//  day1a
//
//  Created by John Bender on 9/9/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "D1ViewController.h"

@interface D1ViewController ()
{
    IBOutlet UIButton *button1;
    IBOutlet UIButton *button2;
}
@end


@implementation D1ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [button1 setBackgroundColor:[UIColor redColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction) switchSwitched:(UISwitch*)theSwitch
{
    NSLog( @"switched to state %d!", theSwitch.on );
    if( theSwitch.on ) {
        self.view.backgroundColor = [UIColor blueColor];
    }
    else {
        self.view.backgroundColor = [UIColor yellowColor];
        [self performSegueWithIdentifier:@"showOrangeSegue" sender:self];
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if( [segue.identifier isEqualToString:@"showOrangeSegue"] ) {
        UIViewController *orangeVC = [segue destinationViewController];
        orangeVC.view.backgroundColor = [UIColor redColor];
    }
}

@end
