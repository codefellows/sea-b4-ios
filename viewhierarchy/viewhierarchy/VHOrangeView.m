//
//  VHOrangeView.m
//  viewhierarchy
//
//  Created by John Bender on 9/12/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "VHOrangeView.h"
#import "VHBlueView.h"

@implementation VHOrangeView

-(void) awakeFromNib
{
    [super awakeFromNib];

    for( NSInteger i = 0; i < 4; i++ ) {
        CGRect frame;
        frame.origin.x = -10.*i;
        frame.origin.y = -10.*i;
        frame.size.width = 10.;
        frame.size.height = 10.;
        VHBlueView *v = [[VHBlueView alloc] initWithFrame:frame];
        [self addSubview:v];
    }
}

@end
