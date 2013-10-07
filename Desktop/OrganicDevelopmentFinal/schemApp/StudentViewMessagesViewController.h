//
//  StudentViewMessagesViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-24.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Student;

@interface StudentViewMessagesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) Student *currentStudent;
@property (weak, nonatomic) IBOutlet UITableView *messageTableView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
- (IBAction)LogOut:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *messageLoadIndicatior;

@end