//
//  PCViewController.m
//  PubCrawl
//
//  Created by John Bender on 9/23/13.
//  Copyright (c) 2013 General UI, LLC. All rights reserved.
//

#import "PCViewController.h"
#import <MapKit/MapKit.h>
#import "PCPubList.h"
#import "PCMapAnnotation.h"

@interface PCViewController ()
{
    __weak IBOutlet MKMapView *mapView;
}

@end

@implementation PCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    MKCoordinateSpan span;
    span.longitudeDelta = 0.005;
    span.latitudeDelta = 0.005;

    CLLocation *currentLocation = [[CLLocation alloc] initWithLatitude:47. longitude:-122.];

    MKCoordinateRegion region;
    region.span = span;
    region.center = currentLocation.coordinate;
    mapView.region = region;

    mapView.centerCoordinate = currentLocation.coordinate;
    mapView.showsUserLocation = TRUE;
    mapView.userTrackingMode = MKUserTrackingModeFollow;

    NSArray *barLocations = [PCPubList barLocations];
    for( NSDictionary *bar in barLocations ) {
        PCMapAnnotation *annotation = [[PCMapAnnotation alloc] initWithBarDict:bar];
        [mapView addAnnotation:annotation];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
