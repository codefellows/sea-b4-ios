//
//  D2PostViewCell.h
//  day2
//
//  Created by John Bender on 9/11/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class D2Post;

@interface D2PostViewCell : UITableViewCell
{
    IBOutlet UILabel *userNameLabel;
    IBOutlet UILabel *contentLabel;
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *timeStampLabel;
    IBOutlet UIImageView *imageView;
}

-(void) populateWithPost:(D2Post*)post;

@end
