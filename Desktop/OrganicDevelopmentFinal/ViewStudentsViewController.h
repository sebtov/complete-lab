//
//  ViewStudentsViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-24.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Student;
@interface ViewStudentsViewController : UIViewController<UISearchDisplayDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
{
    NSManagedObjectContext *context;
    Student *student;
    NSMutableArray *searchResultsArray;
    NSMutableArray *allStudentsArray;
}

- (IBAction)addNewStudent:(id)sender;
- (IBAction)syncWithDBOnline:(id)sender;
- (IBAction)LogOut:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *showAllStudents;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBarStudents;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;

@end
