//
//  D7ViewController.m
//  Day7-PhotoPicker
//
//  Created by John Clem on 9/17/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "AVImagePickerViewController.h"

@interface AVImagePickerViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    IBOutlet UIImageView *imageView;
}
@end

@implementation AVImagePickerViewController

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

- (IBAction)takePicture:(id)sender
{
    UIImagePickerController *picker = [UIImagePickerController new];
    [picker setDelegate:self];
    [picker setAllowsEditing:YES];
    [self presentViewController:picker animated:YES completion:^{
        
    }];
}

#pragma mark - UIImagePickerController Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"Finished Picking Image");
    [self dismissViewControllerAnimated:YES completion:^{
//        UIImage *pickedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        UIImage *pickedImage = [info objectForKey:UIImagePickerControllerEditedImage];
        [imageView setImage:pickedImage];
    }];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Cancelled Image Picker");
    }];
}

@end
