//
//  SRMasterViewController.h
//  ScenicRailways
//
//  Created by Joe Hughes on 13/10/2012.
//  Copyright (c) 2012 Joe Hughes. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SRDetailViewController;

@interface SRMasterViewController : UITableViewController

@property (strong, nonatomic) SRDetailViewController *detailViewController;

@end
