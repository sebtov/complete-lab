//
//  StudentFirstViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-24.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Student;

@interface StudentFirstViewController : UIViewController
@property (strong, nonatomic) Student *currentStudent;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)logOutStudent:(id)sender;


@end
