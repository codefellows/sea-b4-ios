//
//  D2NewPostViewController.h
//  day2
//
//  Created by John Bender on 9/11/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class D2NewPostViewController;
@class Post;

@protocol NewPostDelegate <NSObject>
@optional
-(void) newPostViewController:(D2NewPostViewController*)newPostViewController
             didCreateNewPost:(Post*)post;
@end


@interface D2NewPostViewController : UIViewController

@property (nonatomic, weak) id <NewPostDelegate> delegate;

@end
