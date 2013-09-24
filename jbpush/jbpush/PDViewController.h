//
//  PDViewController.h
//  jbpush
//
//  Created by John Bender on 9/24/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDViewController : UITableViewController

-(void) receivedRemoteNotification:(NSDictionary*)userInfo;

@end
