//
//  ViewController.m
//  Alert View Validation
//
//  Created by John Clem on 10/1/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate, UITextFieldDelegate>
{
    __weak IBOutlet UILabel *zipCodeLabel;
    UIAlertView *alertView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editZipCode:(id)sender
{
    alertView = [[UIAlertView alloc] initWithTitle:@"Enter Your Zip Code" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Save", nil];
    [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [[alertView textFieldAtIndex:0] setDelegate:self];
    [[alertView textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
    [alertView show];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return ![self alertViewShouldEnableFirstOtherButton:alertView];
}

#pragma mark - UIAlertViewDelegate

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)theAlertView
{
    if ([[[alertView textFieldAtIndex:0] text] length] == 5) {
        return YES;
    }
    return NO;
}

- (void)alertView:(UIAlertView *)theAlertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [zipCodeLabel setText:[NSString stringWithFormat:@"Zip Code: %@", [[alertView textFieldAtIndex:0] text]]];
}

@end
