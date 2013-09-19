//
//  D2PostFetcher.h
//  day2
//
//  Created by John Bender on 9/17/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "D2Post.h"

@interface D2PostFetcher : NSObject
{
    NSMutableArray *posts;
}

+(D2PostFetcher*) postFetcher;

-(NSArray*) fetchPostsSync;
-(void) fetchPostsAsync:(void (^)(NSArray* posts))callbackBlock;

-(NSArray*) addPost:(D2Post*)post;

@end
