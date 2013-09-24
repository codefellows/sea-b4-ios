//
//  Message.m
//  Push Notifications Demo
//
//  Created by John Clem on 9/23/13.
//  Copyright (c) 2013 Code Fellows. All rights reserved.
//

#import "Message.h"


@implementation Message

+ (instancetype)messageWithUserName:(NSString *)userName andContent:(NSString *)content andPhoto:(NSData *)photo andTimeStamp:(NSDate *)timeStamp
{
    Message *message = [Message new];
    
    message.userName = userName;
    message.content = content;
    message.photo = photo;
    message.timeStamp = timeStamp;
    
    return message;
}

@end
