//
//  Message.h
//  Push Notifications Demo
//
//  Created by John Clem on 9/23/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property (nonatomic, strong) NSString * userName;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSDate * timeStamp;
@property (nonatomic, strong) NSData * photo;

+ (instancetype)messageWithUserName:(NSString *)userName andContent:(NSString *)content andPhoto:(NSData *)photo andTimeStamp:(NSDate *)timeStamp;

@end
