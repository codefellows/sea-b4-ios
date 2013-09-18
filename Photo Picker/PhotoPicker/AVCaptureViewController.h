//
//  D7AVCaptureViewController.h
//  Day7-PhotoPicker
//
//  Created by John Clem on 9/18/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AVCaptureViewControllerDelegate <NSObject>

- (void)didCaptureImage:(UIImage *)image;

- (void)didCancel;

@end

@class AVCaptureViewControllerDelegate;

@interface AVCaptureViewController : UIViewController

@property (nonatomic, unsafe_unretained) id<AVCaptureViewControllerDelegate> delegate;

@end
