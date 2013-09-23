//
//  PCMapAnnotation.h
//  PubCrawl
//
//  Created by John Bender on 9/23/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface PCMapAnnotation : NSObject <MKAnnotation>
{
    NSDictionary *barDict;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

-(id) initWithBarDict:(NSDictionary*)dict;

@end
