//
//  BBViewController.m
//  bubbles
//
//  Created by John Bender on 9/12/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "BBViewController.h"
#import "BBBubbleViewController.h"

static const NSInteger nBubbles = 5;
static CGFloat bubbleSize = 150.;
static const CGFloat gravityMagnitude = 0.5;


@interface BBViewController () <UICollisionBehaviorDelegate>
{
    NSArray *bubbles;

    UIDynamicAnimator *animator;

    CMMotionManager *motionManager;
    NSTimer *gravityTimer;
    UIGravityBehavior *gravity;
    NSOperationQueue *gravityQueue;
}
@end


@implementation BBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    gravityQueue = [NSOperationQueue new];

    motionManager = [CMMotionManager new];
    motionManager.accelerometerUpdateInterval = 1./2.;
    [motionManager startAccelerometerUpdatesToQueue:gravityQueue
                                        withHandler:^(CMAccelerometerData *accelerometerData, NSError *error)
     {
         [self performSelectorInBackground:@selector(updateGravity) withObject:nil];
     }];

    [self makeBubbles];

    [self addAnimation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    [motionManager stopAccelerometerUpdates];
    [gravityTimer invalidate];
    animator = nil;
}


-(void) makeBubbles
{
    UIStoryboard *storyboard;
    if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ) {
        storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    }
    else {
        storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        bubbleSize = 75.;
    }

    NSMutableArray *b = [NSMutableArray new];

    for( NSInteger i = 0; i < nBubbles; i++ ) {
        BBBubbleViewController *bubble = [storyboard instantiateViewControllerWithIdentifier:@"BBBubbleViewController"];
        [self addChildViewController:bubble];
        [self.view addSubview:bubble.view];
        bubble.view.frame = CGRectMake( self.view.frame.size.width/2.,
                                        self.view.frame.size.height/2.,
                                        bubbleSize, bubbleSize );
        [bubble didMoveToParentViewController:self];
        [b addObject:bubble];
    }

    bubbles = [NSArray arrayWithArray:b];
}


-(void) addAnimation
{
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

    UIDynamicItemBehavior *objects = [UIDynamicItemBehavior new];
    objects.density = 0.0000001;
    objects.elasticity = 0.5;

    UICollisionBehavior *collision = [UICollisionBehavior new];
    [collision setTranslatesReferenceBoundsIntoBoundaryWithInsets:UIEdgeInsetsZero];
    [objects addChildBehavior:collision];

    gravity = [UIGravityBehavior new];
    gravity.magnitude = gravityMagnitude;

    [animator addBehavior:objects];
    [animator addBehavior:gravity];
    [animator addBehavior:collision];

    for( BBBubbleViewController *bubble in bubbles ) {
        [gravity addItem:bubble.view];
        [objects addItem:bubble.view];
        [collision addItem:bubble.view];
    }

    collision.collisionDelegate = self;
}



-(void) updateGravity
{
    CMAcceleration acc = motionManager.accelerometerData.acceleration;
    gravity.gravityDirection = CGVectorMake( acc.x*gravityMagnitude,
                                             -acc.y*gravityMagnitude );
    for( BBBubbleViewController *bubble in bubbles )
        bubble.gravity.gravityDirection = CGVectorMake( acc.x*gravityMagnitude*gravityMagnitude,
                                                        -acc.y*gravityMagnitude*gravityMagnitude );
}


-(BBBubbleViewController*) bubbleControllerForView:(UIView*)view
{
    for( BBBubbleViewController *bubble in bubbles )
        if( bubble.view == view )
            return bubble;
    return nil;
}


#pragma mark - Collision delegate

-(void) collisionBehavior:(UICollisionBehavior *)behavior
      beganContactForItem:(id<UIDynamicItem>)item
   withBoundaryIdentifier:(id<NSCopying>)identifier
                  atPoint:(CGPoint)p
{
    if( [item isKindOfClass:[UIView class]] ) {
        [[self bubbleControllerForView:(UIView*)item] contactedBoundaryAtPoint:p];
    }
}

-(void) collisionBehavior:(UICollisionBehavior *)behavior
      beganContactForItem:(id<UIDynamicItem>)item1
                 withItem:(id<UIDynamicItem>)item2
                  atPoint:(CGPoint)p
{
    if( [item1 isKindOfClass:[UIView class]] && [item2 isKindOfClass:[UIView class]] ) {
        [[self bubbleControllerForView:(UIView*)item1] contactedObjectAtPoint:p];
    }
}

-(void) collisionBehavior:(UICollisionBehavior *)behavior
      endedContactForItem:(id<UIDynamicItem>)item
   withBoundaryIdentifier:(id<NSCopying>)identifier
{
    if( [item isKindOfClass:[UIView class]] ) {
        [[self bubbleControllerForView:(UIView*)item] endedBoundaryContact];
    }
}

-(void) collisionBehavior:(UICollisionBehavior *)behavior
      endedContactForItem:(id<UIDynamicItem>)item1
                 withItem:(id<UIDynamicItem>)item2
{
    if( [item1 isKindOfClass:[UIView class]] && [item2 isKindOfClass:[UIView class]] ) {
        [[self bubbleControllerForView:(UIView*)item1] endedObjectContact];
    }
}

@end
