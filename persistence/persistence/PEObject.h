//
//  PEObject.h
//  persistence
//
//  Created by John Bender on 9/25/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PEObject : NSObject <NSCoding>

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, strong) UIImage *image;

@end
