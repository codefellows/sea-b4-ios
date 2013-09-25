//
//  PEObject.m
//  persistence
//
//  Created by John Bender on 9/25/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "PEObject.h"

@implementation PEObject

-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if( self ) {
        // top two are identical, third line is a direct access to my variable
        [self setUsername:[aDecoder decodeObjectForKey:@"username"]];
        self.username = [aDecoder decodeObjectForKey:@"username"];
        _username = [aDecoder decodeObjectForKey:@"username"];

        self.imagePath = [aDecoder decodeObjectForKey:@"imagePath"];
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:_imagePath]];
        self.image = [UIImage imageWithData:imageData];
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeObject:self.imagePath forKey:@"imagePath"];
}


-(NSString*) description
{
    return [_username stringByAppendingFormat:@"...%@ %@", _imagePath, _image];
}

@end
