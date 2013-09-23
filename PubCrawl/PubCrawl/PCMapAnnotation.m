//
//  PCMapAnnotation.m
//  PubCrawl
//
//  Created by John Bender on 9/23/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "PCMapAnnotation.h"

@implementation PCMapAnnotation

-(id) initWithBarDict:(NSDictionary*)dict
{
    self = [super init];
    if( self ) {
        barDict = dict;
    }
    return self;
}


-(NSString*)title
{
    return [barDict objectForKey:@"name"];
}


-(NSString*)subtitle
{
    return @"a bar";
}


-(CLLocationCoordinate2D) coordinate
{
    return ((CLLocation*)[barDict objectForKey:@"location"]).coordinate;
}

@end
