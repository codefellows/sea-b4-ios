//
//  AVThumbNail.m
//
//
//  Created by John Clem on 10/28/13.
//
//

#import "AVThumbNail.h"

@implementation AVThumbNail

-(void)thumbnailWithSize:(CGSize)size forVideoAtURL:(NSURL *)url atTime:(CMTime)time
{
    AVURLAsset *asset=[[AVURLAsset alloc] initWithURL:url options:nil];
    AVAssetImageGenerator *generator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    generator.appliesPreferredTrackTransform=TRUE;
    
    CMTime thumbTime;
    if (time.value) {
        thumbTime = time;
    } else {
        thumbTime = CMTimeMakeWithSeconds(0,30);
    }
    
    __block UIImage *thumbImage;
    
    if (size.width) {
        generator.maximumSize = size;
    } else {
        generator.maximumSize = CGSizeMake(480.f, 480.f);
    }
    
    [generator generateCGImagesAsynchronouslyForTimes:@[[NSValue valueWithCMTime:thumbTime]]
                                    completionHandler:^(CMTime requestedTime, CGImageRef image, CMTime actualTime, AVAssetImageGeneratorResult result, NSError *error) {
        if (result != AVAssetImageGeneratorSucceeded) {
            NSLog(@"couldn't generate thumbnail, error:%@", error);
        }
        thumbImage = [UIImage imageWithCGImage:image];
        [self.delegate thumbnailIsReady:thumbImage];
    }];
}

@end
