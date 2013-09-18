//
//  CFCameraViewController.m
//  avfoundation
//
//  Created by John Bender on 9/18/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "CFCameraViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface CFCameraViewController ()
{
    AVCaptureSession *captureSession;
    AVCaptureStillImageOutput *captureOutput;
}
@end

@implementation CFCameraViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self startCapture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) startCapture
{
    NSError *error = nil;

    // create capture session
    captureSession = [AVCaptureSession new];
    captureSession.sessionPreset = AVCaptureSessionPresetPhoto;

    // create capture device
    AVCaptureDevice *cameraDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *cameraInput = [AVCaptureDeviceInput deviceInputWithDevice:cameraDevice error:&error];

    // add input to session
    if( [captureSession canAddInput:cameraInput] )
        [captureSession addInput:cameraInput];

    // create output
    captureOutput = [AVCaptureStillImageOutput new];

    // add output to session
    if( [captureSession canAddOutput:captureOutput] )
        [captureSession addOutput:captureOutput];

    // set up preview layer
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:captureSession];
    previewLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:previewLayer];

    // start session
    if( error != nil ) {
        NSLog( @"error creating camera input" );
    }
    else {
        [captureSession startRunning];
    }
}

@end
