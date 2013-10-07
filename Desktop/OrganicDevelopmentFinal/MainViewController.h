//
//  MainViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-24.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Student;

@interface MainViewController : UIViewController
{
    NSManagedObjectContext *context;
    NSString *startLogin;
}

@property (nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) Student *currentStudent;

@property (strong, nonatomic) IBOutlet UIView *mainView;

@end
