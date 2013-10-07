//
//  ViewStudentsViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-24.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//
#import "ViewStudentsViewController.h"
#import "AddStudentViewController.h"
#import "Storage.h"
#import "Student.h"
#import "Course.h"

@interface ViewStudentsViewController ()

@end

@implementation ViewStudentsViewController

@synthesize searchBarStudents,showAllStudents,backgroundView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        context = [Storage sharedStorage].context;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchBarStudents.delegate = self;
    self.searchDisplayController.delegate = self;
    self.searchDisplayController.searchResultsDataSource = self;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    allStudentsArray = [[Storage sharedStorage] getAllStudents];
    NSMutableArray *testing = [[NSMutableArray alloc] init];
    
    for (Student *s in allStudentsArray) {
        if ([s.firstName length] != 0) {
            [testing addObject:s];
        }
    }
    allStudentsArray = testing;
    [[self showAllStudents]reloadData];
}


#pragma mark - Search-functions

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView == showAllStudents)
    {
        return [allStudentsArray count];
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
    if (tableView == showAllStudents)
    {
        [[cell textLabel] setText:[[allStudentsArray objectAtIndex:indexPath.row]firstName]];
    } else {
        [[cell textLabel] setText:[[searchResultsArray objectAtIndex:indexPath.row] studentSignum]];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == showAllStudents)
    {
        AddStudentViewController *asvc = [[AddStudentViewController alloc]initWithStudent:[allStudentsArray objectAtIndex:indexPath.row]];
        [[self navigationController]pushViewController:asvc animated:YES];
    } else {
        AddStudentViewController *asvc = [[AddStudentViewController alloc]initWithStudent:[searchResultsArray objectAtIndex:indexPath.row]];
        [[self navigationController]pushViewController:asvc animated:YES];
    }
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *predicateString = @"studentSignum == %@";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString, [searchBar text]];
    searchResultsArray = [[Storage sharedStorage] readStudentWithPredicate:predicate];
    
    [[[self searchDisplayController] searchResultsTableView] reloadData];
}

-(void)searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView
{
    tableView.frame = CGRectMake(0.0, self.searchBarStudents.frame.origin.y, self.searchBarStudents.frame.size.width, 400.0);
}

- (IBAction)addNewStudent:(id)sender {
    Student *newStudent = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:context];
    AddStudentViewController *asvc = [[AddStudentViewController alloc] initWithStudent:newStudent];
    asvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:asvc animated:YES completion:nil];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"ANY studentSignum CONTAINS[c] %@", searchText];
    searchResultsArray = [[Storage sharedStorage] readStudentWithPredicate:searchPredicate];
    [[[self searchDisplayController] searchResultsTableView] reloadData];
}

#pragma mark syncWithDb

- (IBAction)syncWithDBOnline:(id)sender
{
    [Storage saveToParseOnline];
}

- (IBAction)LogOut:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"loginKey"];

    int numViewControllers = self.navigationController.viewControllers.count;
    UIView *nextView = [[self.navigationController.viewControllers objectAtIndex:numViewControllers - 2] view];
    
    [UIView transitionFromView:self.navigationController.topViewController.view toView:nextView duration:0.4 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
        [self.navigationController popViewControllerAnimated:false];
    }];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
