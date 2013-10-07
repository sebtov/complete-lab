//
//  ViewCoursesViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-24.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "ViewCoursesViewController.h"
#import "AddCourseViewController.h"
#import "Storage.h"
#import "Course.h"

@interface ViewCoursesViewController ()

@end

@implementation ViewCoursesViewController

@synthesize searchBarCourses, showAllTableView,backgroundView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        context = [[Storage sharedStorage] context];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    allCourses = [[Storage sharedStorage] getAllCourses];
    NSMutableArray *testing = [[NSMutableArray alloc] init];
    
    for (Course *c in allCourses) {
        if ([c.courseName length] != 0) {
            [testing addObject:c];
        }
    }
    allCourses = testing;
    [[self showAllTableView]reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchBarCourses.delegate = self;
    self.searchDisplayController.delegate = self;
    self.searchDisplayController.searchResultsDataSource = self;
    self.showAllTableView.dataSource = self;
}

#pragma mark - tableview datasource method implementation

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == showAllTableView) {
        return [allCourses count];
    } else {
        return [searchResult count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *MyIdentifier = @"Cell";
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    if (tableView == showAllTableView) {
        NSString *text = [[allCourses objectAtIndex:indexPath.row] courseName];
        [[cell textLabel] setText:text];
        return cell;
    }
    NSString *text = [[searchResult objectAtIndex:indexPath.row] courseName];
    [[cell textLabel] setText:text];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == [self showAllTableView]) {
        AddCourseViewController *avc = [[AddCourseViewController alloc] initWithCourse:[allCourses objectAtIndex:indexPath.row]];
        avc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:avc animated:YES completion:nil];
    } else {
        AddCourseViewController *avc = [[AddCourseViewController alloc] initWithCourse:[searchResult objectAtIndex:indexPath.row]];
        avc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:avc animated:YES completion:nil];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
  
    cell.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark searchMethods

-(void)searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView
{
    tableView.frame = CGRectMake(0.0, self.searchBarCourses.frame.origin.y, self.searchBarCourses.frame.size.width, 400.0);
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"courseName == %@", [searchBar text]];
    NSArray *searchArray = [[Storage sharedStorage] readCourseWithPredicate:predicate];
    searchResult = [NSMutableArray arrayWithArray:searchArray];
    [[[self searchDisplayController] searchResultsTableView] reloadData];
}

#pragma mark - autocomplete methods

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"ANY courseName CONTAINS[c] %@", searchText];
    NSArray *searchArray = [[Storage sharedStorage] readCourseWithPredicate:searchPredicate];
    searchResult = [NSMutableArray arrayWithArray:searchArray];
    [[[self searchDisplayController] searchResultsTableView] reloadData];
}

- (IBAction)addNewCourse:(id)sender {
    Course *newCourse = [NSEntityDescription insertNewObjectForEntityForName:@"Course" inManagedObjectContext:context];
    
    AddCourseViewController *acvc = [[AddCourseViewController alloc] initWithCourse:newCourse];
    acvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:acvc animated:YES completion:nil];
}

- (IBAction)syncWithDBOnline:(id)sender
{
    [Storage saveToParseOnline];
}

- (IBAction)SignOut:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"loginKey"];
    int numViewControllers = self.navigationController.viewControllers.count;
    UIView *nextView = [[self.navigationController.viewControllers objectAtIndex:numViewControllers - 2] view];
    
    [UIView transitionFromView:self.navigationController.topViewController.view toView:nextView duration:0.4 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
        [self.navigationController popViewControllerAnimated:false];
    }];
}
    

@end