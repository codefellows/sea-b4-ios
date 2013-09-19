//
//  D2NewPostViewController.m
//  day2
//
//  Created by John Bender on 9/11/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "D2NewPostViewController.h"
#import "D2Post.h"

@interface D2NewPostViewController () <UIAlertViewDelegate>
{
    __weak IBOutlet UITextField *userNameTextField;
    __weak IBOutlet UITextField *titleTextField;
    __weak IBOutlet UITextView *contentTextView;
}

-(IBAction) pressedSubmitButton;

@end

@implementation D2NewPostViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) pressedSubmitButton
{
    if ([self isFormValid]) {
        [self submitPost];
    } else {
        [self showAlertView];
    }
}

- (void)submitPost
{
    D2Post *post = [D2Post new];
    post.userName = userNameTextField.text;
    post.title = titleTextField.text;
    post.content = contentTextView.text;
    post.timeStamp = [NSDate new];
    
    if( [_delegate respondsToSelector:@selector(newPostViewController:didCreateNewPost:)] )
        [_delegate newPostViewController:self didCreateNewPost:post];
    
}

- (BOOL)isFormValid
{
    return userNameTextField.text.length;
}

#pragma mark - Alert View


- (void)showAlertView
{
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Fields Are Blank"
                                                          message:@"You Didn't Enter Any Text Into The Fields"
                                                         delegate:self
                                                cancelButtonTitle:@"Cancel"
                                                otherButtonTitles:@"Post Anyway", nil];
    [myAlertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Clicked Button: %ld", (long)buttonIndex);
    
    switch (buttonIndex) {
        case 1:
            [self submitPost];
            break;
        default:
            // don't do anything, dismiss
            break;
    }
}

@end
