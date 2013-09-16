//
//  BBBubbleViewController.h
//  bubbles
//
//  Created by John Bender on 9/12/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBBubbleViewController : UIViewController

-(void) contactedBoundaryAtPoint:(CGPoint)p;
-(void) endedBoundaryContact;

-(void) contactedObjectAtPoint:(CGPoint)p;
-(void) endedObjectContact;

@property (nonatomic, strong) UIGravityBehavior *gravity;

@end
