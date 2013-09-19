//
//  D2PostFetcher.m
//  day2
//
//  Created by John Bender on 9/17/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "D2PostFetcher.h"


static D2PostFetcher *fetcher = nil;

static NSString* const kServer = @"http://10.98.111.21:3000/";
static NSString* const kPostPath = @"posts.json";


@implementation D2PostFetcher

+(D2PostFetcher*) postFetcher
{
    if( !fetcher )
        fetcher = [D2PostFetcher new];
    return fetcher;
}



-(id) init
{
    self = [super init];
    if( self ) {
        posts = [NSMutableArray new];
    }
    return self;
}


-(NSArray*) fetchPostsSync
{
    NSString *call = [kServer stringByAppendingString:kPostPath];
    NSURL *serverUrl = [NSURL URLWithString:call];
    NSURLRequest *serverRequest = [NSURLRequest requestWithURL:serverUrl];
    NSData *postData = [NSURLConnection sendSynchronousRequest:serverRequest
                                             returningResponse:nil
                                                         error:nil];

    if( !postData ) return [NSArray array];

    NSArray *array = [NSJSONSerialization JSONObjectWithData:postData options:0 error:nil];

    for( NSDictionary *dict in array ) {
        D2Post *post = [D2Post new];
        for( NSString *key in [dict allKeys] ) {
            if( [key isEqualToString:@"url"] ) continue;

            [post setValue:dict[key] forKey:key];
        }
        [posts addObject:post];
    }

    return [NSArray arrayWithArray:posts];
}


-(void) fetchPostsAsync:(void (^)(NSArray* posts))callbackBlock
{
    posts = [NSMutableArray new];

    NSString *call = [kServer stringByAppendingString:kPostPath];
    NSURL *serverUrl = [NSURL URLWithString:call];
    NSURLRequest *serverRequest = [NSURLRequest requestWithURL:serverUrl];
    [NSURLConnection sendAsynchronousRequest:serverRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         if( data ) {
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

            for( NSDictionary *dict in array ) {
                D2Post *post = [D2Post new];
                for( NSString *key in [dict allKeys] ) {
                    if( [key isEqualToString:@"url"] ) continue;

                    if( [key isEqualToString:@"id"] ) {
                        post.remoteId = dict[key];
                    }
                    else {
                        [post setValue:dict[key] forKey:key];
                    }
                }
                [posts addObject:post];
            }
         }

         callbackBlock( [NSArray arrayWithArray:posts] );
    }];
}



-(NSArray*) addPost:(D2Post*)post
{
    [posts addObject:post];

    return [NSArray arrayWithArray:posts];
}

@end
