//
//  PCLocationManager.m
//  PubCrawl
//
//  Created by John Bender on 9/23/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "PCLocationManager.h"
#import "PCPubList.h"
#import "PCPubList.h"

static const CGFloat barLocationRadiusMeters = 25.;

static PCLocationManager *instance = nil;

@implementation PCLocationManager

+(PCLocationManager*) locationManager
{
    if( instance == nil )
        instance = [PCLocationManager new];
    return instance;
}


-(id) init
{
    self = [super init];
    if( self ) {
        locationManager = [CLLocationManager new];
        locationManager.delegate = self;

        [self startLocationServices];
    }
    return self;
}

-(void) startLocationServices
{
	BOOL result = YES;

	if (locationManager.location == nil)
	{
		NSLog(@"location is nil");
		result = NO;
	}
	else if (![CLLocationManager locationServicesEnabled])
	{
		NSLog(@"location services not enabled");
		result = NO;
	}
	else if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorized)
	{
		NSLog(@"location services not authorized");
		result = NO;
	}

	if (!result)
	{
		[locationManager startUpdatingLocation];
	}
}

-(void) startMonitoringRegions
{
    // see whether this is going to work
    BOOL monitoring = NO;
//    if ( [CLLocationManager regionMonitoringAvailable] ) {
//        if ( [CLLocationManager regionMonitoringEnabled] ) {
            if( [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized ) {
                monitoring = YES;
            } else {
                NSLog( @"app is not authorized for location monitoring" );
            }
//        } else {
//            NSLog( @"region monitoring is not enabled" );
//        }
//    } else {
//        NSLog( @"region monitoring is not available" );
//    }
    if( !monitoring ) return;
    NSLog( @"starting region monitoring" );

    NSArray *barLocations = [PCPubList barLocations];
    for( NSDictionary *bar in barLocations ) {
        CLLocation *barLocation = bar[@"location"];
        NSString *barName = bar[@"name"];

        CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:barLocation.coordinate
                                                                   radius:barLocationRadiusMeters
                                                               identifier:barName];

        [locationManager startMonitoringForRegion:region];
    }
}


#pragma mark - Location Manager delegate

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog( @"location updated" );
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog( @"location manager failed: %@", error );
}


-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLCircularRegion *)region
{
    NSLog( @"entered region %@", region );
    NSDictionary *barDict = [PCPubList barDictNearestCoordinate:region.center];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"barNearby" object:barDict];
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
}

- (void)   locationManager:(CLLocationManager *)manager
monitoringDidFailForRegion:(CLRegion *)region
                 withError:(NSError *)error
{
    NSLog( @"region monitoring failed for region %@: %@", region, error );
    [locationManager stopMonitoringForRegion:region];
}

@end
