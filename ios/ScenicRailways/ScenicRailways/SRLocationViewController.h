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
    IBOutlet MKMapView *_mapView;
    IBOutlet UISegmentedControl *_segmentedControl;
    IBOutlet UIWebView *_webView;
    IBOutlet UIView *_mapPanel;
    IBOutlet UILabel *_nameLabel;
    IBOutlet UILabel *_distanceLabel;
    IBOutlet UILabel *_descriptionLabel;
}

@property (strong, nonatomic) SRRouteEntry *entry;

- (IBAction)selectionChanged:(id)sender;

@end
