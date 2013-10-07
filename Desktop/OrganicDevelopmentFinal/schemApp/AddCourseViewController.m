//
//  AddCourseViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "AddCourseViewController.h"
#import "Course.h"
#import "Lesson.h"
#import "Storage.h"
#import "Student.h"


@interface AddCourseViewController () <UITextFieldDelegate>

@end

@implementation AddCourseViewController
@synthesize selectedDay,
selecteTime,
selectedTimeStop,
DayArray,
TimeArray,
TimeArrayStop,
thePickerView;

@synthesize CourseInformation,ReadingInformation,CourseName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        context = [Storage sharedStorage].context;
        
    }
    return self;
}
- (id) init
{
    self = [super init];
    if (self) {
        context = [[Storage sharedStorage] context];
        currentCourse = [NSEntityDescription insertNewObjectForEntityForName:@"Course" inManagedObjectContext:context];
    }
    return self;
}

- (id) initWithCourse: (Course *) course
{
    self = [super init];
    if (self) {
        currentCourse = course;
        lesson = currentCourse.lesson;
        context = [[Storage sharedStorage] context];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupBorders];
    [self setupPicker];
    
    newCourse = [NSEntityDescription insertNewObjectForEntityForName:@"Course" inManagedObjectContext:context];
    
    if (currentCourse != nil) {
        [[self CourseName] setText:currentCourse.courseName];
        [[self CourseInformation] setText:currentCourse.courseDescription];
        [[self ReadingInformation] setText:currentCourse.courseReadingMaterial];
        
    }
    
    if(!lesson) {
        lesson = [NSEntityDescription insertNewObjectForEntityForName:@"Lesson" inManagedObjectContext:context];
    }
}

#pragma mark PickerController settings

-(void)setupPicker
{
    thePickerView.showsSelectionIndicator = TRUE;
    self.DayArray=[[NSArray alloc] initWithObjects:@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday" ,nil];
    self.TimeArray=[[NSArray alloc] initWithObjects:@"08:00",@"08:10",@"08:20",@"08:30",@"08:40",@"08:50",@"09:00",@"09:10",@"09:20",@"09:30",@"09:40",@"09:50",@"10:00",@"10:10",@"10:20",@"10:30",@"10:40",@"10:50",@"11:00",@"11:10",@"11:20",@"11:30",@"11:40",@"11:50",@"12:00",@"12:10",@"12:20",@"12:30",@"12:40",@"12:50",@"13:00",@"13:10",@"13:20",@"13:30",@"13:40",@"13:50",@"14:00",@"14:10",@"14:20",@"14:30",@"14:40",@"14:50",@"15:00",@"15:10",@"15:20",@"15:30",@"15:40",@"15:50",@"16:00",@"16:10",@"16:20",@"16:30",@"16:40",@"16:50",@"17:00",nil];
    self.TimeArrayStop=[[NSArray alloc] initWithObjects:@"08:00",@"08:10",@"08:20",@"08:30",@"08:40",@"08:50",@"09:00",@"09:10",@"09:20",@"09:30",@"09:40",@"09:50",@"10:00",@"10:10",@"10:20",@"10:30",@"10:40",@"10:50",@"11:00",@"11:10",@"11:20",@"11:30",@"11:40",@"11:50",@"12:00",@"12:10",@"12:20",@"12:30",@"12:40",@"12:50",@"13:00",@"13:10",@"13:20",@"13:30",@"13:40",@"13:50",@"14:00",@"14:10",@"14:20",@"14:30",@"14:40",@"14:50",@"15:00",@"15:10",@"15:20",@"15:30",@"15:40",@"15:50",@"16:00",@"16:10",@"16:20",@"16:30",@"16:40",@"16:50",@"17:00",nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch(component ) {
        case 0:
            return [DayArray count];
            break;
        case 1:
            return [TimeArray count];
            break;
        default:
        case 2:
            return [TimeArrayStop count];
            break;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    
    if (component == 0) {
        return [DayArray objectAtIndex:row];
    }
    return [TimeArray objectAtIndex:row];
    return [TimeArrayStop objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        self.selectedDay.text=[DayArray objectAtIndex:row];
        return;
    }
    
    if(component == 1)
    {
        self.selecteTime.text =[TimeArray objectAtIndex:row];
        return;
    }
    self.selectedTimeStop.text = [TimeArrayStop objectAtIndex:row];
    /*
     adds new time after scrolled "end time" in pickerview
     */
    if ([self.selectedDay.text isEqualToString:@"Monday"]) {
        lesson.mondayStart = self.selecteTime.text;
        lesson.mondayStop = self.selectedTimeStop.text;
    } else if ([self.selectedDay.text isEqualToString:@"Tuesday"]){
        lesson.tuesdayStart = self.selecteTime.text;
        lesson.tuesdayStop = self.selectedTimeStop.text;
    } else if ([self.selectedDay.text isEqualToString:@"Wednesday"]){
        lesson.wednesdayStart = self.selecteTime.text;
        lesson.wednesdayStop = self.selectedTimeStop.text;
    } else if ([self.selectedDay.text isEqualToString:@"Thursday"]){
        lesson.thursdayStart = self.selecteTime.text;
        lesson.thursdayStop = self.selectedTimeStop.text;
    } else if ([self.selectedDay.text isEqualToString:@"Friday"]){
        lesson.fridayStart = self.selecteTime.text;
        lesson.fridayStop = self.selectedTimeStop.text;
    } else{
        NSLog(@"Did you choose a day?");
    }
}

#pragma mark - Add Course to Storage
- (IBAction)SaveCourse:(id)sender {
    currentCourseStudents = [NSSet setWithArray:[[currentCourse student] allObjects]];
   
    if (currentCourse.courseName != nil) {
        [[Storage sharedStorage] deleteCourseWithCourseName:[currentCourse courseName]];
        newCourse.courseName = self.CourseName.text;
        newCourse.courseId = self.CourseName.text;
        newCourse.courseDescription = self.CourseInformation.text;
        newCourse.courseReadingMaterial = self.ReadingInformation.text;
        newCourse.lesson = lesson;
        newCourse.student = currentCourseStudents;
        [Storage saveManagedContext:context];
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
        
    } else {
        newCourse.courseName = self.CourseName.text;
        newCourse.courseId = self.CourseName.text;
        newCourse.courseDescription = self.CourseInformation.text;
        newCourse.courseReadingMaterial = self.ReadingInformation.text;
        newCourse.lesson = lesson;
        newCourse.student = currentCourseStudents;
        [Storage saveManagedContext:context];
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)deleteCourse:(id)sender
{
    [self alertViewStart];
}

#pragma mark - UI helpers

- (IBAction)Back:(id)sender {

    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)setupBorders
{
    CourseInformation.layer.borderColor = [UIColor lightGrayColor].CGColor;
    CourseInformation.layer.borderWidth = 0.5f;
    ReadingInformation.layer.borderColor = [UIColor lightGrayColor].CGColor;
    ReadingInformation.layer.borderWidth = 0.5f;
}

#pragma mark reload textfield
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    textView.text = @"";
}

-(void)alertViewStart
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Delete"
                                                   message:@"Do you want to delete this Course?"
                                                  delegate:self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK" , nil];
    [alert show];
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1)
    {
        [[Storage sharedStorage] deleteCourseWithCourseName:[currentCourse courseName]];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
