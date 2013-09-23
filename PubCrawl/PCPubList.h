//
//  PCPubList.h
//  PubCrawl
//
//  Created by John Bender on 9/23/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

@interface PCPubList : NSObject

+(NSArray*) barLocations;

+(NSDictionary*) barDictNearestCoordinate:(CLLocationCoordinate2D)coordinate;

@end
