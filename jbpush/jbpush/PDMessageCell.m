//
//  PDMessageCell.m
//  jbpush
//
//  Created by John Bender on 9/24/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "PDMessageCell.h"

@implementation PDMessageCell

-(void) populateWithMessage:(PDMessage*)message
{
    contentLabel.text = message.content;
    usernameLabel.text = message.username;
    timestampLabel.text = [message.timestamp description];
}

@end
