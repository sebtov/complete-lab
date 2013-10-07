//
//  Student.m
//  schemApp
//
//  Created by Patrik Sundbäck on 9/17/13.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "Storage.h"
#import "Student.h"
#import "Course.h"


@implementation Student

@dynamic studentSignum;
@dynamic firstName;
@dynamic lastName;
@dynamic isActive;
@dynamic courses;

#pragma mark - Return as Dict for JSON

-(NSDictionary*)returnStudentAsNSDictionary
{
    /*
     This method converts all the Student properties to a NSMutableDictionary.
     We need this method to save lesson as data.
     The entire dictionary will look like this:
     {
     firstName: firstNameValue,
     lastName: lastNameValue,
     studentSignum: studentSignumValue,
     isActive: isActiveValue,
     courses: [
                {
                    courseName: coursetNameValue,
                    courseId: courseIdValue,
                    courseReadingMaterial: courseReadingMaterialValue,
                    courseDescription: courseDescriptionValue,
                    lesson: {
                        mondayStart: mondayStartValue
                        tue...
                            }
                },
                {
                    course...
                }
                ]
     }
     */
    
    NSMutableDictionary *studentAsDict = [NSMutableDictionary new];
    [studentAsDict setValue:self.firstName forKey:@"firstName"];
    [studentAsDict setValue:self.lastName forKey:@"lastName"];
    [studentAsDict setValue:self.studentSignum forKey:@"studentSignum"];
    [studentAsDict setValue:self.isActive forKey:@"isActive"];
    
    NSMutableArray *coursesArray = [NSMutableArray new];
    for (Course *course in self.courses) {
        [coursesArray addObject:[course returnCourseAsNSDictionary]];
    }
    [studentAsDict setValue:coursesArray forKey:@"courses"];
    
    return studentAsDict;
}

#pragma mark - Return Created Student from Parse

+(id)createStudentFromDictionary:(NSDictionary *)targetStudentAsNSDictionary
{
    Student *newStudent = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:[Storage sharedStorage].context];
    newStudent.firstName = targetStudentAsNSDictionary[@"firstName"];
    newStudent.lastName = targetStudentAsNSDictionary[@"lastName"];
    newStudent.studentSignum = targetStudentAsNSDictionary[@"studentSignum"];
    newStudent.isActive = targetStudentAsNSDictionary[@"isActive"];
    
    for (NSMutableDictionary *course in targetStudentAsNSDictionary[@"courses"]) {
        
        [newStudent addCoursesObject: [Storage returnCourseByName:course[@"courseName"]]];
    }
    
    return newStudent;
}


@end
