//
//  D2PostViewCell.h
//  day2
//
//  Created by John Bender on 9/11/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Post;

@interface D2PostViewCell : UITableViewCell
{
    IBOutlet UILabel *userNameLabel;
    IBOutlet UILabel *contentLabel;
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *timeStampLabel;
}

-(void) populateWithPost:(Post*)post;

@end
