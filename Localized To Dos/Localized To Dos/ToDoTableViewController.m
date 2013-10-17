//
//  ToDoTableViewController.m
//  Localized To Dos
//
//  Created by John Clem on 10/15/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "ToDoTableViewController.h"

@interface ToDoTableViewController () <UIAlertViewDelegate>

@property (nonatomic, strong) NSMutableArray *toDoItems;

@end

@implementation ToDoTableViewController

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

    _toDoItems = [[NSMutableArray alloc] initWithObjects:@"Localize This App", nil];

     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _toDoItems.count+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ToDoItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == _toDoItems.count) {
        NSAttributedString *toDoString = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Add New ToDo", @"Add New ToDo")
                                          

                                                                         attributes:@{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleNone]}];
        [cell.textLabel setAttributedText:toDoString];
    } else {
        NSAttributedString *toDoString = [[NSAttributedString alloc] initWithString:_toDoItems[indexPath.row]
                                                                         attributes:@{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleNone]}];
        [cell.textLabel setAttributedText:toDoString];
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _toDoItems.count) {
        return NO;
    }
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_toDoItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSString *movingItem = [_toDoItems objectAtIndex:fromIndexPath.row];
    
    [_toDoItems removeObjectAtIndex:fromIndexPath.row];
    [_toDoItems insertObject:movingItem atIndex:toIndexPath.row];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.row == _toDoItems.count) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Add ToDo Item" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
        [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
        [alertView show];
    } else {
        NSAttributedString *toDoString = [[NSAttributedString alloc] initWithString:_toDoItems[indexPath.row]
                                                                         attributes:@{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
        [cell.textLabel setAttributedText:toDoString];
    }
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *newItemString = [[alertView textFieldAtIndex:0] text];
    [_toDoItems addObject:newItemString];
    [self.tableView reloadData];
}

@end
