//
//  D2Post.h
//  day2
//
//  Created by John Bender on 9/11/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import <NSRails/NSRails.h>

@interface Post : NSRRemoteObject

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;

@end
