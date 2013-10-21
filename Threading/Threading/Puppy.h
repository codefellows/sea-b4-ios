//
//  Puppy.h
//  Threading
//
//  Created by John Clem on 10/21/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Puppy : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSString *path;
@property BOOL isDownloading;

- (id)initWithURL:(NSURL*)url;
- (id)initWithPath:(NSString*)thePath;

@end
