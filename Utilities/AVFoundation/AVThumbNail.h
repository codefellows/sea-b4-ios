//
//  AVThumbNail.h
//  AVFoundation
//
//  Created by John Clem on 10/28/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@protocol AVThumbNailDelegate <NSObject>

- (void)thumbnailIsReady:(UIImage *)thumbNail;

@end

@interface AVThumbNail : NSObject

@property (nonatomic, weak) id<AVThumbNailDelegate> delegate;

//===================================================================================================
// Creates a thumbnail image with the given CGSize from an image located at the given NSURL
//
// Optionally pass a CMTime to specify the point in the video the thumbnail should be generated from
//
// If no CGSize is given, CGSizeMake(480.f, 480.f) will be used (480x480px)
//
// If no CMTime is given, CMTimeMakeWithSeconds(0,30) will be used (1 second into the video)
-(void)thumbnailWithSize:(CGSize)size forVideoAtURL:(NSURL *)url atTime:(CMTime)time;
//===================================================================================================

@end
