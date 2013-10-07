//
//  MainViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-24.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "MainViewController.h"
#import "ViewStudentsViewController.h"
#import "ViewCoursesViewController.h"
#import "MessageStudentViewController.h"
#import "StudentFirstViewController.h"
#import "StudentViewMessagesViewController.h"
#import "Student.h"
#import "Course.h"
#import "Storage.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize tabBarController, currentStudent,mainView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        tabBarController = [[UITabBarController alloc] init];
        context = [Storage sharedStorage].context;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    startLogin = [[NSUserDefaults standardUserDefaults]stringForKey:@"loginKey"];
    NSLog(@"%@ USER DEFAULTS %@",startLogin, [[NSUserDefaults standardUserDefaults]valueForKey:@"loginKey" ] );
    if (![startLogin isEqualToString:@""])
    {
        [self loginWithString:startLogin];
    } else {
        [self alertViewStart];
    }
    
}

- (IBAction)ManualLogin:(id)sender
{
    startLogin = nil;
    [self alertViewStart];
}

#pragma mark AlertView settings

-(void)alertViewStart
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please enter your ID"
                                                   message:@""
                                                  delegate:self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"Login" , nil];
    
    alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
    [[alert textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
    [alert show];
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    NSString *inputText = [[alertView textFieldAtIndex:0] text];
    if( [inputText length] == 10 )
    {
        return YES;
    } else {
        return NO;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if(buttonIndex == 0)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } else {
        [self loginWithString:[[alertView textFieldAtIndex:0] text]];
    }
}

-(void)loginWithString: (NSString*) targetString
{
    if ([targetString  isEqualToString: @"1234567890"]) {
        
        [[NSUserDefaults standardUserDefaults] setValue:targetString  forKey:@"loginKey"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        MessageStudentViewController *mvs = [MessageStudentViewController new];
        ViewCoursesViewController *vcvc = [ViewCoursesViewController new];
        ViewStudentsViewController *vsvc = [ViewStudentsViewController new];
        NSArray *tabbarViewControllers = [[NSArray alloc]initWithObjects:mvs,vcvc,vsvc, nil];
        
        [self.tabBarController setViewControllers:tabbarViewControllers];
        [self.navigationController pushViewController:self.tabBarController animated:YES];
        
        self.navigationController.navigationBar.hidden = YES;
        
        
        [mvs setTitle:@"Message"];
        [vcvc setTitle:@"Courses"];
        [vsvc setTitle:@"Students"];
        vcvc.tabBarItem.image = [UIImage imageNamed:@"book.png"];
        vsvc.tabBarItem.image = [UIImage imageNamed:@"contact.png"];
        mvs.tabBarItem.image = [UIImage imageNamed:@"Mail.png"];



        [self.tabBarController.tabBar setTintColor:[UIColor colorWithRed:(53/255.0) green:(77/255.0) blue:(149/255.0) alpha:1.0]]; // selected item color
        [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:(235/255.0) green:(235/255.0) blue:(235/255.0) alpha:1.0]]; // tabbar color
        [self.tabBarController.tabBar setTranslucent:YES];
        
    } else {
        [[NSUserDefaults standardUserDefaults] setValue:targetString  forKey:@"loginKey"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSFetchRequest *studentRequest = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
        NSArray * studentResult = [context executeFetchRequest:studentRequest error:nil];
        
        for (Student *student in studentResult) {
            if ([student.studentSignum isEqualToString:targetString]) {
                currentStudent = student;
                NSLog(@"\r\r\r\r\r\r currentStudent: %@ \r\rstudent:%@\r\r\r\r",currentStudent, student);
                
                
                StudentFirstViewController *sfvc = [[StudentFirstViewController alloc] init];
                sfvc.currentStudent = currentStudent;
                StudentViewMessagesViewController *svmvc = [[StudentViewMessagesViewController alloc] init];
                svmvc.currentStudent = currentStudent;
                
                NSArray *viewControllers = [NSArray arrayWithObjects:sfvc, svmvc, nil];
                [self.tabBarController setViewControllers:nil];
                
                [self.tabBarController setViewControllers:viewControllers];
                [self.navigationController pushViewController:tabBarController animated:YES];
                
                [sfvc setTitle:@"Lessons"];
                [svmvc setTitle:@"Messages"];
                sfvc.tabBarItem.image = [UIImage imageNamed:@"book.png"];
                svmvc.tabBarItem.image = [UIImage imageNamed:@"Mail.png"];

                [self.tabBarController.tabBar setTintColor:[UIColor colorWithRed:(53/255.0) green:(77/255.0) blue:(149/255.0) alpha:1.0]]; // selected item color
                    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:(235/255.0) green:(235/255.0) blue:(235/255.0) alpha:1.0]]; // tabbar color
                [self.tabBarController.tabBar setTranslucent:YES];
                break;
            }
        }
    }
}
@end
