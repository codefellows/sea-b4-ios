//
//  D2NewPostViewController.m
//  day2
//
//  Created by John Bender on 9/11/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "D2NewPostViewController.h"
#import "Post.h"

@interface D2NewPostViewController ()
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
    Post *post = [Post new];
    post.userName = userNameTextField.text;
    post.title = titleTextField.text;
    post.content = contentTextView.text;

    if( [_delegate respondsToSelector:@selector(newPostViewController:didCreateNewPost:)] )
        [_delegate newPostViewController:self didCreateNewPost:post];
}

@end
