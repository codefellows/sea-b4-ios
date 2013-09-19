//
//  D2Post.m
//  day2
//
//  Created by John Bender on 9/11/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "D2Post.h"

@implementation D2Post

- (id)activityViewControllerPlaceholderItem:(UIActivityViewController *)activityViewController
{
    NSData *thumb = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.thumbnail]];
    return [UIImage imageWithData:thumb];
}

- (id)activityViewController:(UIActivityViewController *)activityViewController
         itemForActivityType:(NSString *)activityType
{
    NSData *thumb = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.photo]];
    return [UIImage imageWithData:thumb];
}

@end
