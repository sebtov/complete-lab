//
//  MessageTest.m
//  labV2
//
//  Created by sebastian holmqvist on 2013-05-14.
//  Copyright (c) 2013 Jimmy Lidström. All rights reserved.
//

#import "MessageTest.h"
#import "SendMessage.h"
#import "Couch.h"
@implementation MessageTest
{
    SendMessage *message;
    Couch *couch;

}
- (void)setUp
{
    [super setUp];
    message = [[SendMessage alloc]init];
     couch = [[Couch alloc]init];
}
- (void)tearDown
{
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    couch = nil;
    [super tearDown];
}

-(void)testExample
{
    SendMessage *NewMessage = [[SendMessage alloc]initWithMessage:@"hello" StudentId:@"1"];{
    [couch reqToUrl:@"http://seb.iriscouch.com/messages" HttpMethod:@"POST" body:[message json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
            STAssertNotNil(data, @"data is nil");
            NSLog(@"%@",NewMessage);
        
    }];
    }
}



@end
