
//
//  AddStudentViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//
#import "AddStudentViewController.h"
#import "ViewStudentsViewController.h"
#import "DeleteCourseFromStudentViewController.h"
#import "Storage.h"
#import "Student.h"
#import "Course.h"

@interface AddStudentViewController ()

@end

@implementation AddStudentViewController
@synthesize searchCourse,currentCoursesTableView,currentStudent;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        context = [Storage sharedStorage].context;
  
    }
    return self;
}

-(id)initWithStudent: (Student *)student
{
    self = [super init];
    if(self)
    {
        CurrentStudent = student;
        allCoursesArray = [NSMutableArray arrayWithArray:[[CurrentStudent courses] allObjects]];
        context = [[Storage sharedStorage]context];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.searchCourse.delegate = self;
    self.searchDisplayController.delegate = self;
    self.searchDisplayController.searchResultsDataSource = self;
    
    if(CurrentStudent != nil)
    {
        [[self FirstNameText]setText:CurrentStudent.firstName];
        [[self LastNameText]setText:CurrentStudent.lastName];
        [[self IdText]setText:CurrentStudent.studentSignum];
    }
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    allCoursesArray = [NSMutableArray arrayWithArray:[[CurrentStudent courses] allObjects]];
    [[self currentCoursesTableView] reloadData];
}

- (IBAction)Back:(id)sender {
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Save student.

- (IBAction)SaveStudent:(id)sender
{
    if (CurrentStudent != nil)
    {
        NSSet *currentStudentCourses = [NSSet setWithArray:[[CurrentStudent courses] allObjects]];
        [[Storage sharedStorage]deleteStudentWithStudentName:CurrentStudent.firstName];
        newStudent = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:context];
        newStudent.firstName = self.FirstNameText.text;
        newStudent.lastName = self.LastNameText.text;
        newStudent.studentSignum = self.IdText.text;
        newStudent.courses = currentStudentCourses;
        newStudent.isActive = [NSNumber numberWithBool:YES];
        [Storage saveManagedContext:context];

        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } else {
        newStudent.firstName = self.FirstNameText.text;
        newStudent.lastName = self.LastNameText.text;
        newStudent.studentSignum = self.IdText.text;
        newStudent.isActive = [NSNumber numberWithBool:YES];
        [Storage saveManagedContext:context];
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    [[self currentCoursesTableView] reloadData];
}

#pragma mark - Search-functions

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == [self currentCoursesTableView]) {
        return [allCoursesArray count];
    } else {
        return [searchResultsArray count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"Cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    
    if (tableView == [self currentCoursesTableView]) {
        [[cell textLabel] setText:[[allCoursesArray objectAtIndex:indexPath.row] courseName]];
        return cell;
    } else {
        [[cell textLabel] setText:[[searchResultsArray objectAtIndex:indexPath.row] courseName]];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == [self currentCoursesTableView]) {
        DeleteCourseFromStudentViewController *avc = [[DeleteCourseFromStudentViewController alloc]initWithCourse:[allCoursesArray objectAtIndex:indexPath.row]];
        avc.currentStudent = CurrentStudent;
        [[self navigationController] pushViewController:avc animated:YES];
    } else {
        NSSet *currentStudentPreviousCourses = [CurrentStudent valueForKey:@"courses"];
        NSMutableSet *currentStudentNewCourses = [NSMutableSet setWithSet:currentStudentPreviousCourses];
        
        [currentStudentNewCourses addObject:[searchResultsArray objectAtIndex:indexPath.row]];
        CurrentStudent.courses = currentStudentNewCourses;
        newStudent.courses = currentStudentNewCourses;
        
        [allCoursesArray addObject:[searchResultsArray objectAtIndex:indexPath.row]];
        [Storage saveManagedContext:context];
        [[self currentCoursesTableView] reloadData];
        [[self searchDisplayController] setActive:NO animated:YES];
        self.navigationController.navigationBar.hidden = YES;
    }
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *predicateString = @"courseName == %@";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString, [searchBar text]];
    searchResultsArray = [[Storage sharedStorage] readCourseWithPredicate:predicate];
    [[[self searchDisplayController] searchResultsTableView] reloadData];
}

-(void)alertViewStart
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Delete"
                                                   message:@"Do you want to delete this student? \r Don't forget to sync with db when you are done."
                                                  delegate:self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK" , nil];
    
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1)
    {
        [[Storage sharedStorage]deleteStudentWithStudentName:CurrentStudent.firstName];
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    }
}

#pragma mark - autocomplete methods

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText) {
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"ANY courseName CONTAINS[c] %@", searchText];
        searchResultsArray = [[Storage sharedStorage] readCourseWithPredicate:searchPredicate];
    }
    
    [[[self searchDisplayController] searchResultsTableView] reloadData];
}

-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    self.navigationController.navigationBar.hidden = YES;
    return YES;
}

- (IBAction)deleteStudent:(id)sender
{
    [self alertViewStart];
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

@end

