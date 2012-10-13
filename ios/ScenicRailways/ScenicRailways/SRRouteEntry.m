//
//  SRRouteEntry.m
//  ScenicRailways
//
//  Created by Joe Hughes on 13/10/2012.
//  Copyright (c) 2012 Joe Hughes. All rights reserved.
//

#import "SRRouteEntry.h"
#import "SRStation.h"

@implementation SRRouteEntry

- (NSString *)title {
    return self.name;
}

- (NSString *)wikipediaURL {
    if (_wikipediaURL) {
        return _wikipediaURL;
    }
    
    // Generate a wikipedia query string
    NSString *name = self.name;
    if ([self isKindOfClass:[SRStation class]]) {
        name = [NSString stringWithFormat:@"%@ station", name];
    }

    return [NSString stringWithFormat:@"http://en.wikipedia.org/wiki/Special:Search/%@", [self.name stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
}

@end
