//
//  SRRouteTable.m
//  ScenicRailways
//
//  Created by Joe Hughes on 13/10/2012.
//  Copyright (c) 2012 Joe Hughes. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

#import "SRRouteTableViewController.h"

#import "SRLocationViewController.h"
#import "SRScenicRoute.h"
#import "SRStation.h"
#import "SRViewOfInterest.h"

@interface SRRouteTableViewController () {
    NSMutableArray *_routeEntries;
}
@end

@implementation SRRouteTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _routeEntries = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    [self loadIfNecessary];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadIfNecessary {
    if (_route && _route.segments.count == 0) {
        [self loadData];
    }
}

- (void)loadData {
    if (!_route) {
        return;
    }
    
    [self processLoadedData];
}

- (void)processLoadedData {
    [_routeEntries removeAllObjects];
    
    
    // http://en.wikipedia.org/wiki/Special:Search/Totley_Tunnel
    
    SRStation *sheffield = [[SRStation alloc] init];
    sheffield.name = @"Sheffield";
    sheffield.wikipediaURL = @"http://en.wikipedia.org/wiki/Sheffield_station";
    sheffield.coordinate = CLLocationCoordinate2DMake(53.378, -1.462);
    [_routeEntries addObject:sheffield];
    
    SRViewOfInterest *totleyTunnel = [[SRViewOfInterest alloc] init];
    totleyTunnel.name = @"Totley Tunnel";
    totleyTunnel.coordinate = CLLocationCoordinate2DMake(53.305108, -1.62555);
    [_routeEntries addObject:totleyTunnel];
    
    SRStation *manchester = [[SRStation alloc] init];
    manchester.name = @"Manchester";
    manchester.wikipediaURL = @"http://en.wikipedia.org/wiki/Manchester_Piccadilly_station";
    manchester.coordinate = CLLocationCoordinate2DMake(53.477, -2.23);
    [_routeEntries addObject:manchester];
    
    [self updateView];
}

- (void)setRoute:(SRScenicRoute *)route {
    if (_route != route) {
        _route = route;
    }
    
    [self loadIfNecessary];
    [self updateView];
}

- (void)updateView {
    self.title = self.route.name;
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _routeEntries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *StationCellIdentifier = @"StationCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:StationCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:StationCellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    SRRouteEntry *entry = _routeEntries[indexPath.row];
    cell.textLabel.text = entry.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SRRouteEntry *entry = _routeEntries[indexPath.row];
    if (!CLLocationCoordinate2DIsValid(entry.coordinate) || (entry.coordinate.latitude == 0.0 && entry.coordinate.longitude)) {
        return;
    }
    SRLocationViewController *locationViewController = [[SRLocationViewController alloc] initWithNibName:@"SRLocationViewController" bundle:nil];
    locationViewController.entry = entry;
    [self.navigationController pushViewController:locationViewController animated:YES];
}

@end
