//
//  VHViewController.m
//  viewhierarchy
//
//  Created by John Bender on 9/12/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "VHViewController.h"
#import "VHOrangeView.h"

@interface VHViewController ()
{
    NSArray *orangeViews;
}

-(IBAction) pressedMoveButton;
@end

@implementation VHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSMutableArray *ovs = [NSMutableArray new];
    for( UIView *view in self.view.subviews ) {
        if( [view isKindOfClass:[VHOrangeView class]] ) {
            [ovs addObject:view];
        }
    }
    orangeViews = [NSArray arrayWithArray:ovs];

    for( VHOrangeView *v in orangeViews ) {
        NSLog( @"%@", NSStringFromCGRect( v.frame ) );
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction) pressedMoveButton
{
    [UIView animateWithDuration:0.3 animations:^{
        for( VHOrangeView *ov in orangeViews ) {
            CGRect frame = ov.frame;
            frame.origin.x += 100.;
            frame.origin.y += 100.;
            ov.frame = frame;
        }
    }];
}

@end
