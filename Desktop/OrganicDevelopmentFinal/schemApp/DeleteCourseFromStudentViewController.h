//
//  DeleteCourseFromStudentViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-10-01.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Student,Course,Lesson;
@interface DeleteCourseFromStudentViewController : UIViewController
{
    NSManagedObjectContext *context;
    Lesson *lesson;
    Course *currentCourse;
    Course *newCourse;
    NSSet *currentCourseStudents;
    
}

@property (strong,nonatomic) Student *currentStudent;
@property (weak, nonatomic) IBOutlet UILabel *DoYoulabel;
@property (weak, nonatomic) IBOutlet UILabel *CourseLabel;

- (id) initWithCourse: (Course *) course;
- (IBAction)Cancel:(id)sender;
- (IBAction)DeleteCourse:(id)sender;

@end
