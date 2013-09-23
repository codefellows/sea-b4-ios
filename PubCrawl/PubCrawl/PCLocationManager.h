//
//  PCLocationManager.h
//  PubCrawl
//
//  Created by John Bender on 9/23/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface PCLocationManager : NSObject <CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}

+(PCLocationManager*) locationManager;

-(void) startMonitoringRegions;

@end
