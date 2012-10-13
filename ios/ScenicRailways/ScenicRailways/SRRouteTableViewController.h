//
//  SRRouteTable.h
//  ScenicRailways
//
//  Created by Joe Hughes on 13/10/2012.
//  Copyright (c) 2012 Joe Hughes. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SRScenicRoute;

@interface SRRouteTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UITableView *_tableView;
}

@property (strong, nonatomic) SRScenicRoute *route;

@end
