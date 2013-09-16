//
//  VHBlueView.m
//  viewhierarchy
//
//  Created by John Bender on 9/12/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "VHBlueView.h"

@implementation VHBlueView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
