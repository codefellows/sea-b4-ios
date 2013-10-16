//
//  PSAppDelegate.m
//  Frame Grabber
//
//  Created by John Clem on 10/15/13.
//  Copyright (c) 2013 Mind Diaper. All rights reserved.
//

#import "PSAppDelegate.h"
#import <QTKit/QTKit.h>

@interface PSAppDelegate ()
{
    CVImageBufferRef currentImage;
    QTCaptureDevice *video;
    QTCaptureDecompressedVideoOutput *output;
    QTCaptureInput *input;
    QTCaptureSession *session;
}

@property (nonatomic, strong) IBOutlet NSImageView *imageView;

@end

@implementation PSAppDelegate

- (IBAction)startCapture:(id)sender
{
    [session startRunning];
}

- (IBAction)stopCapture:(id)sender
{
    if ([session isRunning]) {
        [session stopRunning];
    }
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    video = [QTCaptureDevice defaultInputDeviceWithMediaType:QTMediaTypeVideo];
    NSError *error = nil;
    
    BOOL success = [video open:&error];
    
    if ( ! success || error )
    {
        NSLog(@"Did not succeed in acquire: %d", success);
        NSLog(@"Error: %@", [error localizedDescription]);
    }
    
    // QTCaptureDeviceInput is the object that will use the
    // device as input, i.e. handle the photo-taking
    input = [[QTCaptureDeviceInput alloc] initWithDevice:video];
    
    // Session handles the input and output of both objects
    session = [[QTCaptureSession alloc] init];
    
    // Add our input object as input for this particular session
    // (the code is pretty self-explanatory)
    success = [session addInput:input error:&error];
    
    if ( ! success || error )
    {
        NSLog(@"Did not succeed in connecting input to session: %d", success);
        NSLog(@"Error: %@", [error localizedDescription]);
    }
    
    // Create an object for outputing the video
    // The input will tell the session object that it has taken
    // some data, which will in turn send this to the output
    // object, which has a delegate that you defined
    output = [[QTCaptureDecompressedVideoOutput alloc] init];
    
    // This is the delegate. Note the
    // captureOutput:didOutputVideoFrame...-method of this
    // object. That is the method which will be called when
    // a photo has been taken.
    [output setDelegate:self];
    
    // Add the output-object for the session
    success = [session addOutput:output error:&error];
    
    if ( ! success || error )
    {
        NSLog(@"Did succeed in connecting output to session: %d", success);
        NSLog(@"Error: %@", [error localizedDescription]);
    }
    
    // Because the input stream is video we will be getting
    // many frames after each other, we take the first one
    // we get and store it, and don't accept any more after
    // we already have one
    currentImage = nil;

}

// QTCapture delegate method, called when a frame has been loaded by the camera
- (void)captureOutput:(QTCaptureOutput *)captureOutput didOutputVideoFrame:(CVImageBufferRef)videoFrame withSampleBuffer:(QTSampleBuffer *)sampleBuffer fromConnection:(QTCaptureConnection *)connection
{
    // If we already have an image we should use that instead
    if ( currentImage ) return;
    
    CVBufferRetain(videoFrame);
    NSCIImageRep *imageRep = [NSCIImageRep imageRepWithCIImage:[CIImage imageWithCVImageBuffer:videoFrame]];
    NSImage *image = [[NSImage alloc] initWithSize:[imageRep size]];
    [image addRepresentation:imageRep];
    NSData *bitmapData = [image TIFFRepresentation];
    NSBitmapImageRep *bitmapRep = [NSBitmapImageRep imageRepWithData:bitmapData];
    NSData *imageData = [bitmapRep representationUsingType:NSJPEGFileType properties:nil];
    image = [[NSImage alloc] initWithData:imageData];
    [_imageView setImage:image];
    CVBufferRelease(videoFrame);
    
//    @synchronized (self) {
//        currentImage = videoFrame;
//    }
//    [self performSelectorOnMainThread:@selector(saveImage) withObject:nil waitUntilDone:NO];
}

// Called from QTCapture delegate method
- (void)saveImage
{
    NSCIImageRep *imageRep = [NSCIImageRep imageRepWithCIImage:[CIImage imageWithCVImageBuffer:currentImage]];
    
    NSImage *image = [[NSImage alloc] initWithSize:[imageRep size]];
    [image addRepresentation:imageRep];
    
    NSData *bitmapData = [image TIFFRepresentation];
    NSBitmapImageRep *bitmapRep = [NSBitmapImageRep imageRepWithData:bitmapData];
    NSData *imageData = [bitmapRep representationUsingType:NSJPEGFileType properties:nil];
    
    image = [[NSImage alloc] initWithData:imageData];
    
    [_imageView setImage:image];
    
    CVBufferRelease(currentImage);
    currentImage = nil;
}


@end
