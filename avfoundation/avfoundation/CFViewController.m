//
//  CFViewController.m
//  avfoundation
//
//  Created by John Bender on 9/18/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "CFViewController.h"
#import "CFCameraViewController.h"

@interface CFViewController () <CFCameraCaptureDelegate>
{
    __weak IBOutlet UIImageView *imageView;
}
@end

@implementation CFViewController

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


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if( [segue.destinationViewController isKindOfClass:[CFCameraViewController class]] ) {
        ((CFCameraViewController*)segue.destinationViewController).delegate = self;
    }
}


#pragma mark - Camera delegate

-(void) cameraViewController:(CFCameraViewController*)cameraVC
             didCaptureImage:(UIImage*)image
{
    imageView.image = image;
    [self.navigationController popToViewController:self animated:YES];
}

@end
