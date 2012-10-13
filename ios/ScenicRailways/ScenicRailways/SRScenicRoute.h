//
//  SRScenicRoute.h
//  ScenicRailways
//
//  Created by Joe Hughes on 13/10/2012.
//  Copyright (c) 2012 Joe Hughes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRScenicRoute : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *routeId;
@property (strong, nonatomic) NSArray *segments;

@end
