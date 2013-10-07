//
//  Course.m
//  schemApp
//
//  Created by Patrik Sundbäck on 9/19/13.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "Storage.h"
#import "Course.h"
#import "Lesson.h"
#import "Student.h"


@implementation Course

@dynamic courseDescription;
@dynamic courseId;
@dynamic courseName;
@dynamic courseReadingMaterial;
@dynamic student;
@dynamic lesson;

#pragma mark - Return as Dict for JSON
-(NSDictionary*)returnCourseAsNSDictionary
{
    /*
     This method converts all the Courses properties to a NSMutableDictionary.
     We need this method to save courses as data.
     The entire dictionary will look like this:
     {
     courseName: coursetNameValue,
     courseId: courseIdValue,
     courseReadingMaterial: courseReadingMaterialValue,
     courseDescription: courseDescriptionValue,
     lesson: {
                    mondayStart: mondayStartValue
                    tue...
            }
     }
     */
    NSMutableDictionary *courseAsDict = [NSMutableDictionary new];
    [courseAsDict setValue:self.courseName forKey:@"courseName"];
    [courseAsDict setValue:self.courseId forKey:@"courseId"];
    [courseAsDict setValue:self.courseReadingMaterial forKey:@"courseReadingMaterial"];
    [courseAsDict setValue:self.courseDescription forKey:@"courseDescription"];
    [courseAsDict setValue:[self.lesson returnLessonAsNSDictionary] forKey:@"lesson"];

    return courseAsDict;
}

#pragma mark - Return Created Course From Parse

+(id)createCourseFromDictionary:(NSDictionary *)targetCourseAsNSDictionary
{
    Course *newCourse = [NSEntityDescription insertNewObjectForEntityForName:@"Course" inManagedObjectContext:[Storage sharedStorage].context];
    newCourse.courseName = targetCourseAsNSDictionary[@"courseName"];
    newCourse.courseId = targetCourseAsNSDictionary[@"courseId"];
    newCourse.courseReadingMaterial = targetCourseAsNSDictionary[@"courseReadingMaterial"];
    newCourse.courseDescription = targetCourseAsNSDictionary[@"courseDescription"];
    newCourse.lesson = [Lesson createLessonFromDictionary:targetCourseAsNSDictionary[@"lesson"]];
    
    return newCourse;
}


@end
