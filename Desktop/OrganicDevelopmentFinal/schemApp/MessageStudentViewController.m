//
//  MessageStudentViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-09.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//


#import "MessageStudentViewController.h"
#import "Couch.h"
#import "SendMessage.h"
#import "Student.h"
#import "Storage.h"
#import "MainViewController.h"

@interface MessageStudentViewController ()

@end

@implementation MessageStudentViewController
@synthesize MessageText,MessageFrom,MessageTo,SendActivIndicator,MessageTime,backgroundView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.mySearchBar.delegate = self;
        self.searchDisplayController.delegate = self;
        self.searchDisplayController.searchResultsDataSource = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self timeStamp];
    [self activityStop];
    [self layout];
    self.MessageTime.hidden = YES;
}

- (IBAction)SignOut:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"loginKey"];
    int numViewControllers = self.navigationController.viewControllers.count;
    UIView *nextView = [[self.navigationController.viewControllers objectAtIndex:numViewControllers - 2] view];
    
    [UIView transitionFromView:self.navigationController.topViewController.view toView:nextView duration:0.4 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
        [self.navigationController popViewControllerAnimated:false];
    }];
}

- (IBAction)send:(id)sender
{
    NSString *studentId;
    if ([self.MessageTo.text isEqualToString:@"all"] || [self.MessageTo.text isEqualToString:@"toAll"] || [self.MessageTo.text isEqualToString:@"messageToAll"]) {
        studentId = @"messageToAll";
    } else if (currentStudent){
        studentId = currentStudent.studentSignum;
    }
    
    if (studentId) {
        [self activityStart];
        Couch *couch =[[Couch alloc] init];
        SendMessage *message = [[SendMessage alloc]initWithMessage:self.MessageText.text
                                                              From:self.MessageFrom.text
                                                         StudentId:studentId
                                                              Time:self.MessageTime.text];
        
            [couch reqToUrl:@"https://schemapp.cloudant.com/messages/"
                 HttpMethod:@"POST" body:[message json] onComplete:^(NSURLResponse *response,
                                                                     NSData *data,
                                                                     NSError *error) {
        if(!error) {
            UIAlertView *alertView =
            [[UIAlertView alloc]initWithTitle:[[error userInfo]objectForKey:@"Message"]
                                                   message:@"Message sent successfully!"
                                                  delegate:self
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"Ok", nil];
            [alertView show];
            [self activityStop];
        } else {
            UIAlertView *alertView =
            [[UIAlertView alloc]initWithTitle:[[error userInfo]objectForKey:@"error"]
                                                   message:@"Error, No connection!"
                                                  delegate:self
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"Ok", nil];
            [alertView show];
            [self activityStop];

        }
    }];
        
    }
}

#pragma mark Set time stamp on message

-(void)timeStamp
{
    NSDate *currentDateTime = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, HH:mm \n\n"];
    NSString *dateInStringFormated = [dateFormatter stringFromDate:currentDateTime];
    NSLog(@"%@", dateInStringFormated);
    MessageTime.text = dateInStringFormated;
}

#pragma mark - Searchmethods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [searchResultsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"Cell";
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    cell.textLabel.text = [[searchResultsArray objectAtIndex:[indexPath row]] studentSignum];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    currentStudent = [searchResultsArray objectAtIndex:[indexPath row]];
    self.MessageTo.text = [currentStudent firstName];
    [[self searchDisplayController] setActive:NO animated:YES];
}

-(void)searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView
{
    tableView.frame = CGRectMake(0.0, self.mySearchBar.frame.origin.y, self.mySearchBar.frame.size.width, 400.0);
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *predicateString = @"studentSignum == %@";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString, searchBar.text];
    searchResultsArray = [[Storage sharedStorage] readStudentWithPredicate:predicate];
    
    [[[self searchDisplayController] searchResultsTableView] reloadData];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"ANY studentSignum CONTAINS[c] %@", searchText];
    searchResultsArray = [[Storage sharedStorage] readStudentWithPredicate:searchPredicate];
    [[[self searchDisplayController] searchResultsTableView] reloadData];
}

-(void)layout
{
    MessageText.layer.borderColor = [UIColor grayColor].CGColor;
    MessageText.layer.borderWidth = 0.5f;
    self.searchDisplayController.searchResultsTableView.frame = CGRectMake(0, 60, self.mySearchBar.frame.size.width, 100);
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)Clear:(id)sender {
    [self textViewDidBeginEditing:MessageText];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark reload textfield
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    textView.text = @"";
    [self timeStamp];
}
#pragma mark activity Indicators

-(void)activityStart
{
    [SendActivIndicator startAnimating];
}

-(void)activityStop
{
    [SendActivIndicator stopAnimating];
}

@end
