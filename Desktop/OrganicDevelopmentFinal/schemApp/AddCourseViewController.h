//
//  AddCourseViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Course,Lesson;

@interface AddCourseViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSManagedObjectContext *context;
    Lesson *lesson;
    Course *currentCourse;
    Course *newCourse;
    NSSet *currentCourseStudents;
}

- (IBAction)Back:(id)sender;
- (IBAction)SaveCourse:(id)sender;
- (IBAction)deleteCourse:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *CourseName;
@property (weak, nonatomic) IBOutlet UITextView *CourseInformation;
@property (weak, nonatomic) IBOutlet UITextView *ReadingInformation;


@property (strong, nonatomic) IBOutlet UIPickerView *thePickerView;
@property (strong, nonatomic) IBOutlet UITextField *selectedDay;
@property (strong, nonatomic) IBOutlet UITextField *selecteTime;
@property (weak, nonatomic) IBOutlet UITextField *selectedTimeStop;

@property (strong, nonatomic) NSArray *DayArray;
@property (strong, nonatomic) NSArray *TimeArray;
@property (strong, nonatomic) NSArray *TimeArrayStop;


- (id) initWithCourse: (Course *) course;
-(void)setupPicker;
-(void)setupBorders;
@end