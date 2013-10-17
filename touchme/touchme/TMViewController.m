//
//  TMViewController.m
//  touchme
//
//  Created by John Bender on 10/17/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "TMViewController.h"
#import "TMTouchView.h"

@interface TMViewController ()
{
    UITapGestureRecognizer *tap;
    UIPanGestureRecognizer *pan;
}

@end

@implementation TMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler)];
    [self.view addGestureRecognizer:tap];

    pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandler)];
    [self.view addGestureRecognizer:pan];
}

-(void) tapHandler
{
    CGPoint tapLocation = [tap locationInView:self.view];
    for( UIView *subview in [self.view.subviews reverseObjectEnumerator] )
        if( [subview isKindOfClass:[TMTouchView class]] &&
            CGRectContainsPoint( subview.frame, tapLocation ) )
        {
            [subview removeFromSuperview];
            break;
        }
}

-(void) panHandler
{
    static CGPoint lastPanLocation = {0.,0.};

    switch( pan.state ) {
        case UIGestureRecognizerStateChanged:
        {
            CGPoint currentPanLocation = [pan locationInView:self.view];
            CGFloat deltaX = currentPanLocation.x - lastPanLocation.x;
            CGFloat deltaY = currentPanLocation.y - lastPanLocation.y;
            for( UIView *subview in self.view.subviews )
                subview.center = CGPointMake( subview.center.x + deltaX,
                                              subview.center.y + deltaY );
            break;
        }
    }

    lastPanLocation = [pan locationInView:self.view];
}

@end
