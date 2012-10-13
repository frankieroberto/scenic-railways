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
#import "TTTLocationFormatter.h"

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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateView];
}

- (void)viewDidAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(locationUpdate:) name:@"LocationUpdate" object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)locationUpdate:(id)update {
    CLLocation *location = [update userInfo][@"location"];
    if (_entry) {
        CLLocation *entryLocation = [[CLLocation alloc] initWithLatitude:_entry.coordinate.latitude longitude:_entry.coordinate.longitude];
        TTTLocationFormatter *formatter = [[TTTLocationFormatter alloc] init];
        formatter.unitSystem = TTTImperialSystem;
        _distanceLabel.text = [formatter stringFromDistanceAndBearingFromLocation:location toLocation:entryLocation];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateView {
    self.title = _entry.name;
    _nameLabel.text = _entry.name;
    
    NSArray *oldAnnotations = [_mapView.annotations copy];
    for (id<MKAnnotation> annotation in oldAnnotations) {
        if (annotation != _mapView.userLocation) {
            [_mapView removeAnnotation:annotation];
        }
    }
    
    [_mapView addAnnotation:_entry];
    [_mapView setCenterCoordinate:_entry.coordinate zoomLevel:13 animated:YES];

    NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL URLWithString:_entry.wikipediaURL]];
    [_webView loadRequest:requestObj];
}

- (void)setEntry:(SRRouteEntry *)entry {
    if (_entry != entry) {
        _entry = entry;
    }
    
    [self updateView];
}

- (IBAction)selectionChanged:(id)sender {
    int selection = _segmentedControl.selectedSegmentIndex;
    if (selection == 0) {
        _mapPanel.hidden = NO;
        _webView.hidden = YES;
    } else {
        _mapPanel.hidden = YES;
        _webView.hidden = NO;
    }
}

@end
