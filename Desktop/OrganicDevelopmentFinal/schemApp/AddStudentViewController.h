//
//  AddStudentViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Student,Course;
@interface AddStudentViewController : UIViewController <UISearchDisplayDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
{
    NSManagedObjectContext *context;
    Student *newStudent;
    NSArray *searchResultsArray;
    Student *CurrentStudent;
    Course *CurrentCourse;
    NSMutableArray *allCoursesArray;
    
}

- (IBAction)Back:(id)sender;
- (IBAction)SaveStudent:(id)sender;
- (IBAction)deleteStudent:(id)sender;

@property (weak, nonatomic) IBOutlet UISearchBar *searchCourse;
@property (weak, nonatomic) IBOutlet UITextField *FirstNameText;
@property (weak, nonatomic) IBOutlet UITextField *LastNameText;
@property (weak, nonatomic) IBOutlet UITextField *IdText;
@property (weak, nonatomic) IBOutlet UITableView *currentCoursesTableView;
@property (strong,nonatomic) Student *currentStudent;


-(id)initWithStudent: (Student *)student;
@end
