//
//  DeleteCourseFromStudentViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-10-01.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "DeleteCourseFromStudentViewController.h"
#import "Course.h"
#import "Lesson.h"
#import "Storage.h"
#import "Student.h"

@interface DeleteCourseFromStudentViewController ()
@end

@implementation DeleteCourseFromStudentViewController
@synthesize currentStudent,CourseLabel,DoYoulabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.CourseLabel.text = currentCourse.courseName;

}

- (id) initWithCourse: (Course *) course
{
    self = [super init];
    if (self) {
        currentCourse = course;
        context = [[Storage sharedStorage] context];
    }
    return self;
}

- (IBAction)Cancel:(id)sender
{
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:2] animated:YES];
}

- (IBAction)DeleteCourse:(id)sender
{
    [currentStudent removeCoursesObject:currentCourse];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:2] animated:YES];
}
@end
