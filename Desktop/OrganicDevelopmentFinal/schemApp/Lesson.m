//
//  Lesson.m
//  schemApp
//
//  Created by Patrik Sundbäck on 9/19/13.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "Storage.h"
#import "Lesson.h"
#import "Course.h"


@implementation Lesson

@dynamic mondayStart;
@dynamic mondayStop;
@dynamic tuesdayStart;
@dynamic tuesdayStop;
@dynamic wednesdayStart;
@dynamic wednesdayStop;
@dynamic thursdayStart;
@dynamic thursdayStop;
@dynamic fridayStart;
@dynamic fridayStop;
@dynamic course;

#pragma mark - Return as Dict for JSON
-(NSDictionary*)returnLessonAsNSDictionary
{
    
    NSMutableDictionary *lessonAsDict = [NSMutableDictionary new];
    [lessonAsDict setValue:self.mondayStart forKey:@"mondayStart"];
    [lessonAsDict setValue:self.mondayStop forKey:@"mondayStop"];
    [lessonAsDict setValue:self.tuesdayStart forKey:@"tuesdayStart"];
    [lessonAsDict setValue:self.tuesdayStop forKey:@"tuesdayStop"];
    [lessonAsDict setValue:self.wednesdayStart forKey:@"wednesdayStart"];
    [lessonAsDict setValue:self.wednesdayStop forKey:@"wednesdayStop"];
    [lessonAsDict setValue:self.thursdayStart forKey:@"thursdayStart"];
    [lessonAsDict setValue:self.thursdayStop forKey:@"thursdayStop"];
    [lessonAsDict setValue:self.fridayStart forKey:@"fridayStart"];
    [lessonAsDict setValue:self.fridayStop forKey:@"fridayStop"];
    
    return lessonAsDict;
}

#pragma mark - Return Created Student from Parse

+(id)createLessonFromDictionary:(NSDictionary *)targetStudentAsNSDictionary
{
    Lesson *newLesson = [NSEntityDescription insertNewObjectForEntityForName:@"Lesson" inManagedObjectContext:[Storage sharedStorage].context];
    newLesson.mondayStart = targetStudentAsNSDictionary[@"mondayStart"];
    newLesson.mondayStop = targetStudentAsNSDictionary[@"mondayStop"];
    newLesson.tuesdayStart = targetStudentAsNSDictionary[@"tuesdayStart"];
    newLesson.tuesdayStop = targetStudentAsNSDictionary[@"tuesdayStop"];
    newLesson.wednesdayStart = targetStudentAsNSDictionary[@"wednesdayStart"];
    newLesson.wednesdayStop = targetStudentAsNSDictionary[@"wednesdayStop"];
    newLesson.thursdayStart = targetStudentAsNSDictionary[@"thursdayStart"];
    newLesson.thursdayStop = targetStudentAsNSDictionary[@"thursdayStop"];
    newLesson.fridayStart = targetStudentAsNSDictionary[@"fridayStart"];
    newLesson.fridayStop = targetStudentAsNSDictionary[@"fridayStop"];
    
    return newLesson;
}


@end
