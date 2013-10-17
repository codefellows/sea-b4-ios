//
//  TMTouchView.m
//  touchme
//
//  Created by John Bender on 10/17/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "TMTouchView.h"
#import "UIColor+RandomColor.h"

@interface TMTouchView ()
{
    BOOL isMoving;
    UITouch *movingTouch;
    CGSize touchOffset;
    CGPoint originalPosition;

    UIColor *originalBackgroundColor;
}
@end

@implementation TMTouchView

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if( self ) {
        [self initialize];
    }
    return self;
}

-(void) awakeFromNib
{
    [super awakeFromNib];

    [self initialize];
}

-(void) initialize
{
    self.backgroundColor = [UIColor randomColor];
    originalBackgroundColor = self.backgroundColor;
}


-(void) pickUp
{
    isMoving = TRUE;

    self.backgroundColor = [UIColor blackColor];

    [self.superview bringSubviewToFront:self];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[super touchesBegan:touches withEvent:event];

    if( isMoving ) return;

    movingTouch = [touches anyObject];

    CGPoint touchPoint = [movingTouch locationInView:self.superview];
    touchOffset = CGSizeMake( self.center.x - touchPoint.x, self.center.y - touchPoint.y );
    originalPosition = self.center;
    [self pickUp];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[super touchesMoved:touches withEvent:event];

    if( [touches containsObject:movingTouch] ) {
        CGPoint touchPoint = [movingTouch locationInView:self.superview];
        self.center = CGPointMake( touchPoint.x + touchOffset.width, touchPoint.y + touchOffset.height );
    }
}

-(void) drop
{
    isMoving = FALSE;

    self.backgroundColor = originalBackgroundColor;
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[super touchesEnded:touches withEvent:event];
    ;

    if( [touches containsObject:movingTouch] ) {
        [self drop];
        movingTouch = nil;
    }
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[super touchesCancelled:touches withEvent:event];
    ;

    if( [touches containsObject:movingTouch] ) {
        self.center = originalPosition;
        [self drop];
        movingTouch = nil;
    }
}

@end
