//
//  Storage.h
//  schemApp
//
//  Created by Jimmy Lidström on 2013-09-16.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Course,Student;

@interface Storage : NSObject

@property (nonatomic, readonly, strong)NSManagedObjectContext *context;

#pragma mark - Shared Storage
+(Storage*) sharedStorage;

#pragma mark - Manage Database CRUD Methods
+(void) saveManagedContext:(NSManagedObjectContext*) targetContext;
-(void) updateCourseWithCourseName: (NSString *) courseName withNewInfo: (Course *) newCourse;
-(void) deleteCourseWithCourseName: (NSString *) courseName;
-(void) deleteStudentWithStudentName: (NSString *) studentSignum;
-(void) deleteStudentWithStudentSignum: (NSString *) targetStudentSignum;

#pragma mark - Return Methods
- (NSArray *) readCourseWithPredicate: (NSPredicate *) predicate;
- (NSMutableArray *) readStudentWithPredicate: (NSPredicate *) predicate;
- (NSMutableArray *) getAllStudents;
- (NSMutableArray *) getAllCourses;
+(Course*) returnCourseByName: (NSString*)tagetCourseName;
+(Student *)returnStudentBySignum: (NSString *)targetStudentSignum;


#pragma mark - Parse Database Online Save&Load Methods
+(void) saveToParseOnline;
+(void) loadFromParseOnline;

@end
