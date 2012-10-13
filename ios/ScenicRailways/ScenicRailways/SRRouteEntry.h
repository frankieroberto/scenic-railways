//
//  SRRouteEntry.h
//  ScenicRailways
//
//  Created by Joe Hughes on 13/10/2012.
//  Copyright (c) 2012 Joe Hughes. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>

@interface SRRouteEntry : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *wikipediaURL;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@end
