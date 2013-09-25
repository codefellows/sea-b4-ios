//
//  Episode.h
//  Core Data
//
//  Created by John Clem on 9/24/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Podcast.h"

@class Podcast;

@interface Episode : Podcast

@property (nonatomic, retain) NSString * audioURL;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) Podcast *podcast;

@end
