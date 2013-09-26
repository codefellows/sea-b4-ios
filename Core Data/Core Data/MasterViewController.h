//
//  MasterViewController.h
//  Core Data
//
//  Created by John Clem on 9/24/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController, *filteredResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
