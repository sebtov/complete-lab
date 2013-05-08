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
    couch = nil;
}

- (void)testExample
{
    __block id result1;
    
    [couch reqToUrl:@"Http://localhost:5984/test/1A" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
    
        result1 = [Couch parseData:data];
        STAssertNotNil(data, @"data is nil");


        
        
    }];
    
    
    
}

@end
