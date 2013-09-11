//
//  D2PostViewCell.m
//  day2
//
//  Created by John Bender on 9/11/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "D2PostViewCell.h"
#import "D2Post.h"

@implementation D2PostViewCell

-(void) populateWithPost:(D2Post*)post
{
    userNameLabel.text = post.userName;
    contentLabel.text = post.content;
    titleLabel.text = post.title;
    timeStampLabel.text = [post.timeStamp description];
}

@end
