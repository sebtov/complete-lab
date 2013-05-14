//
//  Message+Json.m
//  labV2
//
//  Created by sebastian holmqvist on 2013-05-13.
//  Copyright (c) 2013 Jimmy Lidström. All rights reserved.
//

#import "Message+Json.h"

@implementation SendMessage (Json)


-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc] init];
    
 
    selfAsJson[@"Message"] = self.message;
    selfAsJson[@"StudentID"] = self.studentId;

    
    return selfAsJson;
}

@end
