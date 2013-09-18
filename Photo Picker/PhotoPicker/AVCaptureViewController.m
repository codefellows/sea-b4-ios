//
//  D7AVCaptureViewController.m
//  Day7-PhotoPicker
//
//  Created by John Clem on 9/18/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "AVCaptureViewController.h"
#import "AVFoundationViewController.h"
#import "UIImage+SampleBuffer.h"
#import <AVFoundation/AVFoundation.h>
#import <ImageIO/ImageIO.h>

@interface AVCaptureViewController () <AVCaptureVideoDataOutputSampleBufferDelegate>
{
    AVCaptureStillImageOutput *stillImageOutput;
    AVCaptureSession *session;
}

@end

@implementation AVCaptureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupCaptureSession];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self startSessionAndAddPreviewToLayer:self.view.layer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AVFoundation

- (void)setupCaptureSession
{
    NSError *error = nil;
    
    // Create the capture session
    session = [[AVCaptureSession alloc] init];
    session.sessionPreset = AVCaptureSessionPresetPhoto;
    
    // Create the capture device
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (!input) {
        NSLog(@"No Device Input Available");
    }
    
    // Add the device input to the session
    if ([session canAddInput:input]) {
        [session addInput:input];
    }
    
    // Create a still image output for capturing photos
    stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = @{ AVVideoCodecKey : AVVideoCodecJPEG};
    [session addOutput:stillImageOutput];
    [stillImageOutput setOutputSettings:outputSettings];
    
    // Configure the data output
    //    AVCaptureVideoDataOutput *output = [[AVCaptureVideoDataOutput alloc] init];
    //    [session addOutput:output];
    //    output.videoSettings = @{ (NSString *)kCVPixelBufferPixelFormatTypeKey : @(kCVPixelFormatType_32BGRA) };
    
    
    // Create a dispatch queue for handling the sample buffer outside of the main thread
    //    dispatch_queue_t queue = dispatch_queue_create("com.clem.avqueue", NULL);
    //    [output setSampleBufferDelegate:self queue:queue];
    
}

- (void)startSessionAndAddPreviewToLayer:(CALayer *)layer
{
    // Create the video preview
    AVCaptureVideoPreviewLayer *captureVideoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    [captureVideoPreviewLayer setFrame:self.view.frame];
    [layer addSublayer:captureVideoPreviewLayer];
    
    [session startRunning];
}

- (IBAction)takePicture:(id)sender
{
    AVCaptureConnection *videoConnection = nil;
    for (AVCaptureConnection *connection in stillImageOutput.connections)
    {
        for (AVCaptureInputPort *port in [connection inputPorts])
        {
            if ([[port mediaType] isEqual:AVMediaTypeVideo] )
            {
                videoConnection = connection;
                break;
            }
        }
        if (videoConnection) { break; }
    }
    
    NSLog(@"about to request a capture from: %@", stillImageOutput);
    [stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler: ^(CMSampleBufferRef imageSampleBuffer, NSError *error)
     {
         CFDictionaryRef exifAttachments = CMGetAttachment( imageSampleBuffer, kCGImagePropertyExifDictionary, NULL);
         if (exifAttachments)
         {
             // Do something with the attachments.
             NSLog(@"attachements: %@", exifAttachments);
         }
         else
             NSLog(@"no attachments");
         
         NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageSampleBuffer];
         UIImage *image = [[UIImage alloc] initWithData:imageData];
         [_delegate didCaptureImage:image];

     }];
}

@end
