//
//  CFCameraViewController.h
//  avfoundation
//
//  Created by John Bender on 9/18/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CFCameraViewController;

@protocol CFCameraCaptureDelegate <NSObject>

@optional
-(void) cameraViewController:(CFCameraViewController*)cameraVC
             didCaptureImage:(UIImage*)image;
-(void) cameraViewControllerDidCancel:(CFCameraViewController*)cameraVC;

@end


@interface CFCameraViewController : UIViewController

@property (nonatomic, weak) id <CFCameraCaptureDelegate> delegate;

@end
