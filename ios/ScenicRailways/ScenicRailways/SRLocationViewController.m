//
//  SRLocationViewController.m
//  ScenicRailways
//
//  Created by Joe Hughes on 13/10/2012.
//  Copyright (c) 2012 Joe Hughes. All rights reserved.
//

#import "SRLocationViewController.h"

#import "SRRouteEntry.h"
#import "MKMapView+ZoomLevel.h"

@interface SRLocationViewController ()

@end

@implementation SRLocationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self updateView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateView {
    self.title = _entry.name;
    
    NSArray *oldAnnotations = [mapView.annotations copy];
    for (id<MKAnnotation> annotation in oldAnnotations) {
        if (annotation != mapView.userLocation) {
            [mapView removeAnnotation:annotation];
        }
    }
    
    [mapView addAnnotation:_entry];
    [mapView setCenterCoordinate:_entry.coordinate zoomLevel:13 animated:YES];
}

- (void)setEntry:(SRRouteEntry *)entry {
    if (_entry != entry) {
        _entry = entry;
    }
    
    [self updateView];
}

@end
