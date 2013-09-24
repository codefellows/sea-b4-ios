//
//  PNMainViewController.h
//  Push Notifications Demo
//
//  Created by John Clem on 9/23/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface PNMainViewController : UITableViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)handleNotificationWithUserInfo:(NSDictionary *)info;

@end
