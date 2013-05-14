//
//  CouchTest.m
//  labV2
//
//  Created by sebastian holmqvist on 2013-05-08.
//  Copyright (c) 2013 Jimmy Lidström. All rights reserved.
//

#import "CouchTest.h"
#import "Couch.h"
@implementation CouchTest

{
    Couch *couch;
}

- (void)setUp {
    
    couch = [[Couch alloc]init];
    
}

- (void)tearDown {
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    couch = nil;

}

- (void)testExample
{
    
    [couch reqToUrl:@"Http://localhost:5984/test/1A" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
    
        STAssertNotNil(data, @"data is nil");
    }];
    
    
    
}

@end
