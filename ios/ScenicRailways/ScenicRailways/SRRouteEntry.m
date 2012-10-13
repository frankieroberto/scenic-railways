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
    NSString *wikiName = self.name;
    if ([self isKindOfClass:[SRStation class]]) {
        wikiName = [NSString stringWithFormat:@"%@ station", wikiName];
    }

    return [NSString stringWithFormat:@"http://en.wikipedia.org/wiki/Special:Search/%@", [wikiName stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
}

@end
