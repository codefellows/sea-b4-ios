//
//  PNMessageCell.m
//  Push Notifications Demo
//
//  Created by John Clem on 9/23/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "PNMessageCell.h"

@interface PNMessageCell ()

@property (nonatomic, weak) IBOutlet UILabel *contentLabel;
@property (nonatomic, weak) IBOutlet UILabel *userNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *timeStampLabel;
@property (nonatomic, weak) IBOutlet UIImageView *photoView;

@end

@implementation PNMessageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMessage:(Message *)message
{
    _message = message;
    [self.contentLabel setText:_message.content];
    [self.userNameLabel setText:_message.userName];
    [self setNeedsDisplay];
}

@end
