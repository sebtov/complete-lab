//
//  Schema+Json.m
//  labV2
//
//  Created by sebastian holmqvist on 2013-04-22.
//  Copyright (c) 2013 Jimmy Lidström. All rights reserved.
//

#import "Schema+Json.h"

@implementation Schema (Json)

-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc] init];
    
    selfAsJson[@"Måndag"] = self.Mandag;
    selfAsJson[@"Tisdag"] = self.Tisdag;
    selfAsJson[@"Onsdag"] = self.Onsdag;
    selfAsJson[@"Torsdag"] = self.Torsdag;
    selfAsJson[@"Fredag"] = self.Fredag;

    
    return selfAsJson;
}

@end






