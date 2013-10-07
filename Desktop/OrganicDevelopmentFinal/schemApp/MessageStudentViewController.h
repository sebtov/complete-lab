//
//  MessageStudentViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-09.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Student;
@interface MessageStudentViewController : UIViewController <UISearchBarDelegate, UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
{
    NSMutableArray *searchResultsArray;
    Student *currentStudent;
}


@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;
@property (weak, nonatomic) IBOutlet UITextView *MessageText;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;

@property (weak, nonatomic) IBOutlet UITextField *MessageFrom;
@property (weak, nonatomic) IBOutlet UITextField *MessageTo;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *SendActivIndicator;
@property (weak, nonatomic) IBOutlet UITextField *MessageTime;

- (IBAction)send:(id)sender;
- (IBAction)Clear:(id)sender;
- (IBAction)SignOut:(id)sender;

-(void)activityStart;
-(void)activityStop;
@end
