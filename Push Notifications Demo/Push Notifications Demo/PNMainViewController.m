//
//  PNMainViewController.m
//  Push Notifications Demo
//
//  Created by John Clem on 9/23/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "PNMainViewController.h"
#import "PNMessageCell.h"
#import "Message.h"

@interface PNMainViewController ()
{
    NSMutableArray *messages;
}
@end

@implementation PNMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    messages = [NSMutableArray new];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Push Notifications

- (void)handleNotificationWithUserInfo:(NSDictionary *)info
{
    NSLog(@"Remote Notif Received: %@", info);
    
    NSDictionary *payload = [info objectForKey:@"message"];
    
    Message *message = [Message messageWithUserName:payload[@"userName"]
                                      andContent:payload[@"content"]
                                        andPhoto:nil
                                    andTimeStamp:[NSDate date]];

    [messages addObject:message];
    NSIndexPath *messageIndexPath = [NSIndexPath indexPathForRow:[messages indexOfObject:message] inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[messageIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
//    [self.tableView reloadRowsAtIndexPaths:@[messageIndexPath] withRowAnimation:UITableViewRowAnimationLeft];

}

#pragma mark - Core Data



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PNMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell" forIndexPath:indexPath];
    Message *cellMessage = messages[indexPath.row];
    [cell setMessage:cellMessage];
    
    return cell;
}

#pragma mark - UITableViewDelegate

@end
