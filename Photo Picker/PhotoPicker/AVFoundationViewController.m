//
//  D7AVFoundationViewController.m
//  Day7-PhotoPicker
//
//  Created by John Clem on 9/17/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "AVFoundationViewController.h"
#import "AVCaptureViewController.h"

@interface AVFoundationViewController () <AVCaptureViewControllerDelegate>
{
    IBOutlet UIImageView *imageView;
    UIImage *avImage;
}
@end

@implementation AVFoundationViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}


- (IBAction)setupAVFoundation:(id)sender
{
    [self performSegueWithIdentifier:@"AVCaptureViewSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[AVCaptureViewController class]]) {
        [(AVCaptureViewController *)segue.destinationViewController setDelegate:self];
    }
}

- (void)didCaptureImage:(UIImage *)image
{
    avImage = image;
    [self.navigationController popToViewController:self animated:YES];
    [imageView setImage:avImage];
}

- (void)didCancel
{
    avImage = nil;
    [self.navigationController popToViewController:self animated:YES];
    [imageView setImage:nil];
}


@end
