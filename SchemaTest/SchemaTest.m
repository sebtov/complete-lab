//
//  SchemaTest.m
//  SchemaTest
//
//  Created by sebastian holmqvist on 2013-05-08.
//  Copyright (c) 2013 Jimmy Lidström. All rights reserved.
//

#import "SchemaTest.h"
#import "Schema.h"
@implementation SchemaTest
{
    Schema *schema;
}

- (void)setUp
{
    [super setUp];
    schema = [[Schema alloc]init];
    
}

- (void)tearDown
{
    schema = nil;
    [super tearDown];
}

- (void)testExample
{
    Schema *Newschema =[[Schema alloc]initMandag:@"1" InitTisdag:@"2" InitOnsdag:@"3" InitTorsdag:@"4" InitFredag:@"5"];
    NSArray *scheman = @[Newschema];
    NSLog(@"%@",scheman);
    STAssertEquals(Newschema.Fredag,@"5",@"Should be 5");
    
}

@end
