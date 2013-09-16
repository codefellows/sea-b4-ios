//
//  BBSubBubbleView.m
//  bubbles
//
//  Created by John Bender on 9/13/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "BBSubBubbleView.h"
#import <QuartzCore/QuartzCore.h>

@implementation BBSubBubbleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = frame.size.width/2.;
    }
    return self;
}

@end
