//
//  ThreadingTableViewController.m
//  Threading
//
//  Created by John Clem on 10/21/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "ThreadingTableViewController.h"
#import "Puppy.h"

@interface ThreadingTableViewController ()
{
    NSArray *puppyURLs;
}
@end

@implementation ThreadingTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    puppyURLs = [[NSArray alloc] initWithObjects:
                 @"http://puppyice.com/wp-content/uploads/2013/05/Puppies.jpg",
                 @"http://sumasshepherds.files.wordpress.com/2010/09/puppies-034.jpg",
                 @"http://s3.amazonaws.com/content.sitezoogle.com/u/23681/6292b4814f11f9d83a93281581be51a8c1ed3e65/original/Harley_Fatz1.JPG?1362319593",
                 @"http://wallcapture.com/wp-content/uploads/2013/07/Puppies-Picture-Wallpaper-Dekstop.jpg",
                 @"http://pitkrewkennels.com/wp-content/uploads/2011/03/Havoc-Mia-Puppies.jpg",
                 nil];
                 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UIImage *cellImage = [self downloadImageForIndexPath:indexPath];
    
    [cell.textLabel setText:[NSString stringWithFormat:@"Puppy %d", indexPath.row]];
    [cell.imageView setImage:cellImage];
    
    return cell;
}

- (UIImage *)downloadImageForIndexPath:(NSIndexPath *)indexPath
{
    NSURL *imageURL = [NSURL URLWithString:[puppyURLs objectAtIndex:indexPath.row]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    
    return [UIImage imageWithData:imageData];
}

- (IBAction)reloadTable:(id)sender
{
    [self.tableView reloadData];
}
@end
