//
//  BBBubbleViewController.m
//  bubbles
//
//  Created by John Bender on 9/12/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "BBBubbleViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "BBSubBubbleView.h"
#import "BBViewController.h"
#import "UIColor+RandomColor.h"



static const NSInteger nSubBubbles = 4;
static const CGFloat subBubbleRelativeSize = 1./5.;
static const CGFloat pushMagnitude = 0.01;


@interface BBBubbleViewController () <UIGestureRecognizerDelegate>
{
    UIDynamicAnimator *animator;

    UICollisionBehavior *collision;

    NSArray *subBubbles;
}
@end


@implementation BBBubbleViewController

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.view.layer.cornerRadius = self.view.frame.size.width/2.;
    self.view.backgroundColor = [UIColor randomColorWithAlpha:0.7];

    [self addSubBubbles];

    [self addDynamics];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) addSubBubbles
{
    NSMutableArray *subs = [NSMutableArray new];

    for( NSInteger i = 0; i < nSubBubbles; i++ ) {
        CGRect frame;

        frame.size.width = self.view.frame.size.width*subBubbleRelativeSize;
        frame.size.height = self.view.frame.size.height*subBubbleRelativeSize;

        if( i < 2 ) {
            frame.origin.x = self.view.frame.size.width/2. - frame.size.width/2.;
            if( i % 2 == 0 )
                frame.origin.y = 0.;
            else
                frame.origin.y = self.view.frame.size.height - frame.size.height;
        }
        else {
            frame.origin.y = self.view.frame.size.height/2. - frame.size.height/2.;
            if( i % 2 == 0 )
                frame.origin.x = 0.;
            else
                frame.origin.x = self.view.frame.size.width - frame.size.width;
        }

        BBSubBubbleView *sub = [[BBSubBubbleView alloc] initWithFrame:frame];
        [self.view addSubview:sub];
        [subs addObject:sub];
    }

    subBubbles = [NSArray arrayWithArray:subs];
}


-(void) addDynamics
{
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

    collision = [[UICollisionBehavior alloc] initWithItems:subBubbles];
    [collision setTranslatesReferenceBoundsIntoBoundaryWithInsets:UIEdgeInsetsZero];

    _gravity = [[UIGravityBehavior alloc] initWithItems:subBubbles];

    [animator addBehavior:_gravity];
    [animator addBehavior:collision];
}


-(void) contactedBoundaryAtPoint:(CGPoint)p
{
    CGPoint point = [self.view convertPoint:p fromView:self.view.superview];

    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:subBubbles
                                                            mode:UIPushBehaviorModeInstantaneous];
    [push setAngle:atan2f( point.y, point.x ) magnitude:pushMagnitude];
    //[animator addBehavior:push];
}

-(void) endedBoundaryContact
{
}

-(void) contactedObjectAtPoint:(CGPoint)p
{
    CGPoint point = [self.view convertPoint:p fromView:self.view.superview];

    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:subBubbles
                                                            mode:UIPushBehaviorModeInstantaneous];
    [push setAngle:atan2f( point.y, point.x ) magnitude:pushMagnitude];
    //[animator addBehavior:push];
}

-(void) endedObjectContact
{
}


-(void) tap
{
    for( BBSubBubbleView *sub in subBubbles )
        sub.backgroundColor = [UIColor grayColor];
    self.view.backgroundColor = [UIColor clearColor];
    [animator removeBehavior:collision];
}

@end
