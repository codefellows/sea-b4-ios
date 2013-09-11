//
//  UIView+CloseKeyboard.m
//  day2
//
//  Created by John Bender on 9/11/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "UIView+CloseKeyboard.h"

@implementation UIView (CloseKeyboard)

-(void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    [self endEditing:NO];
    [super touchesBegan:touches withEvent:event];
}

@end