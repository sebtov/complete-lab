//
//  Student.h
//  schemApp
//
//  Created by Patrik Sundbäck on 9/17/13.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Course;

@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * studentSignum;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSNumber * isActive;
@property (nonatomic, retain) NSSet *courses;
@end

@interface Student (CoreDataGeneratedAccessors)

- (void)addCoursesObject:(Course *)value;
- (void)removeCoursesObject:(Course *)value;
- (void)addCourses:(NSSet *)values;
- (void)removeCourses:(NSSet *)values;

#pragma mark - Return as Dict for JSON
-(NSDictionary*)returnStudentAsNSDictionary;

#pragma mark - Return Created Student from Parse
+(id)createStudentFromDictionary:(NSDictionary *)targetStudentAsNSDictionary;

@end
