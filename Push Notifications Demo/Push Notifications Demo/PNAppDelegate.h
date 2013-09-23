//
//  PNAppDelegate.h
//  Push Notifications Demo
//
//  Created by John Clem on 9/23/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PNAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
