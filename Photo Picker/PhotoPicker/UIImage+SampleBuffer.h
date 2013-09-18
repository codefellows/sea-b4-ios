//
//  UIImage+SampleBuffer.h
//  Day7-PhotoPicker
//
//  Created by John Clem on 9/18/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMedia/CoreMedia.h>

@interface UIImage (SampleBuffer)

+ (UIImage *)imageFromSampleBuffer:(CMSampleBufferRef)sampleBuffer;

@end
