//
//  PDViewController.m
//  jbpush
//
//  Created by John Bender on 9/24/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "PDViewController.h"
#import "PDMessage.h"
#import "PDMessageCell.h"

@interface PDViewController ()
{
    NSMutableArray *messages;
}
@end

@implementation PDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    messages = [NSMutableArray new];
    PDMessage *message = [PDMessage new];
    message.username = @"test user";
    message.content = @"test post";
    message.timestamp = [NSDate date];
    [messages addObject:message];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [messages count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PDMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell" forIndexPath:indexPath];
    [cell populateWithMessage:messages[indexPath.row]];
    return cell;
}


#pragma mark - Notifications

-(void) receivedRemoteNotification:(NSDictionary*)userInfo
{
    NSDictionary *messageDict = userInfo[@"message"];
    PDMessage *message = [PDMessage new];
    message.username = messageDict[@"userName"];
    message.content = messageDict[@"content"];
    message.timestamp = [NSDate date];

    [messages addObject:message];

    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0]
                  withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
