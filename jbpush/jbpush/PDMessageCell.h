//
//  PDMessageCell.h
//  jbpush
//
//  Created by John Bender on 9/24/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDMessage.h"

@interface PDMessageCell : UITableViewCell
{
    __weak IBOutlet UILabel *usernameLabel, *contentLabel, *timestampLabel;
}

-(void) populateWithMessage:(PDMessage*)message;

@end
