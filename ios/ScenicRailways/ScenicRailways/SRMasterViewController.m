//
//  SRMasterViewController.m
//  ScenicRailways
//
//  Created by Joe Hughes on 13/10/2012.
//  Copyright (c) 2012 Joe Hughes. All rights reserved.
//

#import "SRMasterViewController.h"

#import "AFJSONRequestOperation.h"
#import "SRRouteTableViewController.h"
#import "SRScenicRoute.h"

@interface SRMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation SRMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Scenic Railways", nil);
        _objects = [NSMutableArray array];
    }
    return self;
}

- (void)startDataLoad {
    NSURL *url = [NSURL URLWithString:@"http://www.scenicrailways.org.uk/scenic_routes.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        [self receivedDataUpdate:JSON];
    } failure:nil];
    
    [operation start];
}

- (void)receivedDataUpdate:(id)JSON {
    [_objects removeAllObjects];
    if (JSON) {
        for (NSDictionary *routeDict in JSON) {
            SRScenicRoute *route = [[SRScenicRoute alloc] init];
            route.name = routeDict[@"name"];
            route.routeId = routeDict[@"id"];
            route.description = routeDict[@"description"];
            [_objects addObject:route];
        }
    } else {
        // Sample data
        SRScenicRoute *sampleRoute = [[SRScenicRoute alloc] init];
        sampleRoute.name = @"Hope Valley Line";
        sampleRoute.routeId = @"hvl";
        sampleRoute.description = @"Sheffield - Manchester";
        sampleRoute.segments = [NSMutableArray array];
        [_objects addObject:sampleRoute];
    }
    [self.tableView reloadData];
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Home"
                                                                                style:UIBarButtonItemStylePlain
                                                                               target:nil
                                                                               action:nil]];

    [self startDataLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    SRScenicRoute *route = _objects[indexPath.row];
    cell.textLabel.text = route.name;
    cell.detailTextLabel.text = route.description;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SRRouteTableViewController *routeTableViewController = [[SRRouteTableViewController alloc] initWithNibName:@"SRRouteTableViewController" bundle:nil];
    routeTableViewController.route = _objects[indexPath.row];
    [self.navigationController pushViewController:routeTableViewController animated:YES];
}

@end
