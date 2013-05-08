//
//  StudentsTest.m
//  labV2
//
//  Created by sebastian holmqvist on 2013-05-08.
//  Copyright (c) 2013 Jimmy Lidström. All rights reserved.
//

#import "StudentsTest.h"
#import "Student.h"
@implementation StudentsTest
{
    Student *student;
}

- (void)setUp {
    
    student = [[Student alloc]init];
    
}

- (void)tearDown {
    student = nil;
}

- (void)testExample
{
    Student *student1 = [[Student alloc] initWithName:@"seb" lastName:@"seb" klass:@"1a"];
    NSArray *students = @[student1];
    NSLog(@"%@",students);
    STAssertEquals(student1.firstName,@"seb", @"should be seb");
}

@end


