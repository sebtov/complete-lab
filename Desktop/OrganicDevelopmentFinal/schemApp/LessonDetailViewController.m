//
//  LessonDetailViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-24.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "LessonDetailViewController.h"
#import "Course.h"

@interface LessonDetailViewController ()

@end

@implementation LessonDetailViewController
@synthesize currentCourse, courseReadingInfoView, courseDetailInfoView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    courseDetailInfoView.text = currentCourse.courseDescription;
    courseReadingInfoView.text = currentCourse.courseReadingMaterial;
}



- (IBAction)backButton:(id)sender {
          [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:2] animated:YES];
}
@end
