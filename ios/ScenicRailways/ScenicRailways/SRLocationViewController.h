//
//  SRLocationViewController.h
//  ScenicRailways
//
//  Created by Joe Hughes on 13/10/2012.
//  Copyright (c) 2012 Joe Hughes. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

@class SRRouteEntry;

@interface SRLocationViewController : UIViewController {
    IBOutlet MKMapView *mapView;
}

@property (strong, nonatomic) SRRouteEntry *entry;

@end
