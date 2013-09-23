//
//  PNFlipsideViewController.h
//  Push Notifications Demo
//
//  Created by John Clem on 9/23/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PNFlipsideViewController;

@protocol PNFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(PNFlipsideViewController *)controller;
@end

@interface PNFlipsideViewController : UIViewController

@property (weak, nonatomic) id <PNFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
