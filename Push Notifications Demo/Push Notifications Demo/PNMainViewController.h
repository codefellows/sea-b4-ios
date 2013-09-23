//
//  PNMainViewController.h
//  Push Notifications Demo
//
//  Created by John Clem on 9/23/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "PNFlipsideViewController.h"

#import <CoreData/CoreData.h>

@interface PNMainViewController : UIViewController <PNFlipsideViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
