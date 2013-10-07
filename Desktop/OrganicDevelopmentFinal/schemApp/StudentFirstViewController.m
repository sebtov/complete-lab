//
//  StudentFirstViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-24.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "StudentFirstViewController.h"
#import "DayDetailViewController.h"
#import "Course.h"
#import "Lesson.h"
#import "Student.h"
#import "Storage.h"
#import "StudentFirstViewCell.h"
#import "MainViewController.h"

@interface StudentFirstViewController ()

@end

@implementation StudentFirstViewController
{
    NSArray *values;
    int courseTime;
    int coursesMonday;
    int coursesTuesday;
    int coursesWednesday;
    int coursesThursday;
    int coursesFriday;
}
@synthesize currentStudent;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        values =[[NSArray alloc] initWithObjects:@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday" ,nil];
   
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"CURRENT STUDENT HAS %d COURSES",[currentStudent.courses count]);
    UINib *nib = [UINib nibWithNibName:@"StudentFirstViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"StudentFirstViewCell"];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [values count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StudentFirstViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StudentFirstViewCell"];
    
    if(!cell)
    {
        NSLog(@"\rCREATING NEW CELL\r");
        cell = [[StudentFirstViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"StudentFirstViewCell"];
        
    }
    cell.dayLabel.text = [NSString stringWithFormat:@"%@",[values objectAtIndex:indexPath.row]];
    cell.numberOfCoursesNumberLabel.text = @"0";
    cell.dayTimeStart.text = @"-";
    cell.dayTimeStop.text = @"-";
    
    courseTime = 0;
    coursesMonday = 0;
    coursesTuesday = 0;
    coursesWednesday = 0;
    coursesThursday = 0;
    coursesFriday = 0;
    
    for (Course *course in currentStudent.courses) {
        NSLog(@"CHECKING COURSE %i TIME", ++courseTime);
        if (course.lesson.mondayStart && course.lesson.mondayStop && indexPath.row == 0)
        {
            coursesMonday++;
            cell.numberOfCoursesNumberLabel.text = [NSString stringWithFormat:@"%i",coursesMonday];
            if ([self isFirstLessonOfDay:course.lesson.mondayStart forDay:@"Monday"])
            {
                cell.dayTimeStart.text = course.lesson.mondayStart;
                NSLog(@"\rCHANGING FIRST LESSON TIME TO: %@\r", course.lesson.mondayStart);
            }
            if ([self isLastLessonOfDay:course.lesson.mondayStop forDay:@"Monday"])
            {
                cell.dayTimeStop.text = course.lesson.mondayStop;
                NSLog(@"\rCHANGING LAST LESSON TIME TO: %@\r", course.lesson.mondayStop);
            }
        } else if (course.lesson.tuesdayStart && course.lesson.tuesdayStop && indexPath.row == 1)
        {
            coursesTuesday++;
            cell.numberOfCoursesNumberLabel.text = [NSString stringWithFormat:@"%i",coursesTuesday];
            if ([self isFirstLessonOfDay:course.lesson.tuesdayStart forDay:@"Tuesday"])
            {
                cell.dayTimeStart.text = course.lesson.tuesdayStart;
            }
            if ([self isLastLessonOfDay:course.lesson.tuesdayStop forDay:@"Tuesday"])
            {
                cell.dayTimeStop.text = course.lesson.tuesdayStop;
            }
        } else if (course.lesson.wednesdayStart && course.lesson.wednesdayStop && indexPath.row == 2)
        {
            coursesWednesday++;
            cell.numberOfCoursesNumberLabel.text = [NSString stringWithFormat:@"%i",coursesWednesday];
            if ([self isFirstLessonOfDay:course.lesson.wednesdayStart forDay:@"Wednesday"])
            {
                cell.dayTimeStart.text = course.lesson.wednesdayStart;
            }
            if ([self isLastLessonOfDay:course.lesson.wednesdayStop forDay:@"Wednesday"])
            {
                cell.dayTimeStop.text = course.lesson.wednesdayStop;
            }
        } else if (course.lesson.thursdayStart && course.lesson.thursdayStop && indexPath.row == 3)
        {
            coursesThursday++;
            cell.numberOfCoursesNumberLabel.text = [NSString stringWithFormat:@"%i",coursesThursday];
            if ([self isFirstLessonOfDay:course.lesson.thursdayStart forDay:@"Thursday"])
            {
                cell.dayTimeStart.text = course.lesson.thursdayStart;
            }
            if ([self isLastLessonOfDay:course.lesson.thursdayStop forDay:@"Thursday"])
            {
                cell.dayTimeStop.text = course.lesson.thursdayStop;
            }
        } else if (course.lesson.fridayStart && course.lesson.fridayStop && indexPath.row == 4)
        {
            coursesFriday++;
            cell.numberOfCoursesNumberLabel.text = [NSString stringWithFormat:@"%i",coursesFriday];
            if ([self isFirstLessonOfDay:course.lesson.fridayStart forDay:@"Friday"])
            {
                cell.dayTimeStart.text = course.lesson.fridayStart;
            }
            if ([self isLastLessonOfDay:course.lesson.fridayStop forDay:@"Friday"])
            {
                cell.dayTimeStop.text = course.lesson.fridayStop;
            }
        }
    }
    

    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DayDetailViewController *dvc = [[DayDetailViewController alloc] init];
    dvc.currentStudent = currentStudent;
    switch (indexPath.row) {
        case 0:
            dvc.dayToShow = @"Monday";
            break;
        case 1:
            dvc.dayToShow = @"Tuesday";
            break;
        case 2:
            dvc.dayToShow = @"Wednesday";
            break;
        case 3:
            dvc.dayToShow = @"Thursday";
            break;
        case 4:
            dvc.dayToShow = @"Friday";
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:dvc animated:YES];
    
}

#pragma mark - Compare Time Methods

-(BOOL)isFirstLessonOfDay: (NSString*)targetTimeStart forDay: (NSString*)targetDayString
{
    BOOL isCourseFirstLessonOfDay = NO;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    
    NSDate *targetCourseStartTime = [formatter dateFromString:targetTimeStart];
    NSLog(@"CHECKING FIRSTLESSONOFDAY ON %@", [formatter stringFromDate:targetCourseStartTime]);
    int time = 0;
    for (Course *course in currentStudent.courses)
    {
        NSLog(@"CHECK FIRST DAY TIME %i", ++time);
        if ([targetDayString isEqualToString:@"Monday"])
        {
            NSDate *courseStartTime = [formatter dateFromString:course.lesson.mondayStart];
            NSLog(@"COMPARING START COURSE TIME %@ WITH OTHERCOURSE START TIME %@", [formatter stringFromDate:targetCourseStartTime], [formatter stringFromDate:courseStartTime]);
            if ([[self compareDate:targetCourseStartTime withOtherDate:courseStartTime] isEqualToString:@"before"] || coursesMonday == 1)
            {
                isCourseFirstLessonOfDay = YES;
                NSLog(@"\r\rTHIS LESSON SEEMS TO BE FIRST LESSON OF DAY\r%@\r-------",targetCourseStartTime);
            } else if ([[self compareDate:targetCourseStartTime withOtherDate:courseStartTime] isEqualToString:@"same"])
            {
                NSLog(@"THIS LESSON IS SAME TIME. WILL NOT CHANGE ISCOURSE FIRST LESSON OF DAY");
            } else
            {
                isCourseFirstLessonOfDay = NO;
                NSLog(@"\r\rTHIS LESSON IS NOT FIRST LESSON OF DAY\r%@\r-------",targetCourseStartTime);
            }
        } else if ([targetDayString isEqualToString:@"Tuesday"])
        {
            NSDate *courseStartTime = [formatter dateFromString:course.lesson.tuesdayStart];
            if ([[self compareDate:targetCourseStartTime withOtherDate:courseStartTime] isEqualToString:@"before"] || coursesTuesday == 1)
            {
                isCourseFirstLessonOfDay = YES;
            } else if ([[self compareDate:targetCourseStartTime withOtherDate:courseStartTime] isEqualToString:@"same"])
            {
                NSLog(@"THIS LESSON IS SAME TIME. WILL NOT CHANGE ISCOURSE FIRST LESSON OF DAY");
            } else
            {
                isCourseFirstLessonOfDay = NO;
                NSLog(@"\r\rTHIS LESSON IS NOT FIRST LESSON OF DAY\r%@\r-------",targetCourseStartTime);
            }
        } else if ([targetDayString isEqualToString:@"Wednesday"])
        {
            NSDate *courseStartTime = [formatter dateFromString:course.lesson.wednesdayStart];
            if ([[self compareDate:targetCourseStartTime withOtherDate:courseStartTime] isEqualToString:@"before"] || coursesWednesday == 1)
            {
                isCourseFirstLessonOfDay = YES;
            } else if ([[self compareDate:targetCourseStartTime withOtherDate:courseStartTime] isEqualToString:@"same"])
            {
                NSLog(@"THIS LESSON IS SAME TIME. WILL NOT CHANGE ISCOURSE FIRST LESSON OF DAY");
            } else
            {
                isCourseFirstLessonOfDay = NO;
                NSLog(@"\r\rTHIS LESSON IS NOT FIRST LESSON OF DAY\r%@\r-------",targetCourseStartTime);
            }
        } else if ([targetDayString isEqualToString:@"Thursday"])
        {
            NSDate *courseStartTime = [formatter dateFromString:course.lesson.thursdayStart];
            if ([[self compareDate:targetCourseStartTime withOtherDate:courseStartTime] isEqualToString:@"before"] || coursesThursday == 1)
            {
                isCourseFirstLessonOfDay = YES;
            } else if ([[self compareDate:targetCourseStartTime withOtherDate:courseStartTime] isEqualToString:@"same"])
            {
                NSLog(@"THIS LESSON IS SAME TIME. WILL NOT CHANGE ISCOURSE FIRST LESSON OF DAY");
            } else
            {
                isCourseFirstLessonOfDay = NO;
                NSLog(@"\r\rTHIS LESSON IS NOT FIRST LESSON OF DAY\r%@\r-------",targetCourseStartTime);
            }
        } else if ([targetDayString isEqualToString:@"Friday"])
        {
            NSDate *courseStartTime = [formatter dateFromString:course.lesson.fridayStart];
            if ([[self compareDate:targetCourseStartTime withOtherDate:courseStartTime] isEqualToString:@"before"] || coursesFriday == 1)
            {
                isCourseFirstLessonOfDay = YES;
            } else if ([[self compareDate:targetCourseStartTime withOtherDate:courseStartTime] isEqualToString:@"same"])
            {
                NSLog(@"THIS LESSON IS SAME TIME. WILL NOT CHANGE ISCOURSE FIRST LESSON OF DAY");
            } else
            {
                isCourseFirstLessonOfDay = NO;
                NSLog(@"\r\rTHIS LESSON IS NOT FIRST LESSON OF DAY\r%@\r-------",targetCourseStartTime);
            }
        }
        
    }
    NSLog(@"RETURNING IS FIRSTCOURSE OF DAY %hhd", isCourseFirstLessonOfDay);
    return isCourseFirstLessonOfDay;
}

-(BOOL)isLastLessonOfDay: (NSString*)targetTimeStop forDay: (NSString*)targetDayString
{
    BOOL isCourseLastLessonOfDay = NO;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    
    NSDate *targetCourseStopTime = [formatter dateFromString:targetTimeStop];
    NSLog(@"CHECKING LASTLESSONOFDAY ON %@", [formatter stringFromDate:targetCourseStopTime]);
    int time = 0;
    for (Course *course in currentStudent.courses)
    {
        NSLog(@"CHECK LAST DAY TIME %i", ++time);
        if ([targetDayString isEqualToString:@"Monday"])
        {
            NSDate *courseStopTime = [formatter dateFromString:course.lesson.mondayStop];
            NSLog(@"COMPARING STOP COURSE TIME %@ WITH OTHERCOURSE STOP TIME %@", [formatter stringFromDate:targetCourseStopTime], [formatter stringFromDate:courseStopTime]);
            if ([[self compareDate:targetCourseStopTime withOtherDate:courseStopTime] isEqualToString:@"after"] || coursesMonday == 1)
            {
                isCourseLastLessonOfDay = YES;
                NSLog(@"\r\rTHIS LESSON SEEMS TO BE LAST LESSON OF DAY\r%@\r-----------", targetTimeStop);
            } else if ([[self compareDate:targetCourseStopTime withOtherDate:courseStopTime] isEqualToString:@"same"])
            {
                NSLog(@"THIS LESSON IS SAME TIME. WILL NOT CHANGE ISCOURSE LAST LESSON OF DAY");
            } else
            {
                isCourseLastLessonOfDay = NO;
                NSLog(@"\r\rTHIS LESSON IS NOT LAST LESSON OF DAY\r%@\r-------",targetCourseStopTime);
            }
        } else if ([targetDayString isEqualToString:@"Tuesday"])
        {
            NSDate *courseStopTime = [formatter dateFromString:course.lesson.tuesdayStop];
            if ([[self compareDate:targetCourseStopTime withOtherDate:courseStopTime] isEqualToString:@"after"] || coursesTuesday == 1)
            {
                isCourseLastLessonOfDay = YES;
            } else if ([[self compareDate:targetCourseStopTime withOtherDate:courseStopTime] isEqualToString:@"same"])
            {
                NSLog(@"THIS LESSON IS SAME TIME. WILL NOT CHANGE ISCOURSE LAST LESSON OF DAY");
            } else
            {
                isCourseLastLessonOfDay = NO;
                NSLog(@"\r\rTHIS LESSON IS NOT LAST LESSON OF DAY\r%@\r-------",targetCourseStopTime);
            }
        } else if ([targetDayString isEqualToString:@"Wednesday"])
        {
            NSDate *courseStopTime = [formatter dateFromString:course.lesson.wednesdayStop];
            if ([[self compareDate:targetCourseStopTime withOtherDate:courseStopTime] isEqualToString:@"after"] || coursesWednesday == 1)
            {
                isCourseLastLessonOfDay = YES;
            } else if ([[self compareDate:targetCourseStopTime withOtherDate:courseStopTime] isEqualToString:@"same"])
            {
                NSLog(@"THIS LESSON IS SAME TIME. WILL NOT CHANGE ISCOURSE LAST LESSON OF DAY");
            } else
            {
                isCourseLastLessonOfDay = NO;
                NSLog(@"\r\rTHIS LESSON IS NOT LAST LESSON OF DAY\r%@\r-------",targetCourseStopTime);
            }
        } else if ([targetDayString isEqualToString:@"Thursday"])
        {
            NSDate *courseStopTime = [formatter dateFromString:course.lesson.thursdayStop];
            if ([[self compareDate:targetCourseStopTime withOtherDate:courseStopTime] isEqualToString:@"after"] || coursesThursday == 1)
            {
                isCourseLastLessonOfDay = YES;
            } else if ([[self compareDate:targetCourseStopTime withOtherDate:courseStopTime] isEqualToString:@"same"])
            {
                NSLog(@"THIS LESSON IS SAME TIME. WILL NOT CHANGE ISCOURSE LAST LESSON OF DAY");
            } else
            {
                isCourseLastLessonOfDay = NO;
                NSLog(@"\r\rTHIS LESSON IS NOT LAST LESSON OF DAY\r%@\r-------",targetCourseStopTime);
            }
        } else if ([targetDayString isEqualToString:@"Friday"])
        {
            NSDate *courseStopTime = [formatter dateFromString:course.lesson.fridayStop];
            if ([[self compareDate:targetCourseStopTime withOtherDate:courseStopTime] isEqualToString:@"after"] || coursesFriday == 1)
            {
                isCourseLastLessonOfDay = YES;
            } else if ([[self compareDate:targetCourseStopTime withOtherDate:courseStopTime] isEqualToString:@"same"])
            {
                NSLog(@"THIS LESSON IS SAME TIME. WILL NOT CHANGE ISCOURSE LAST LESSON OF DAY");
            } else
            {
                isCourseLastLessonOfDay = NO;
                NSLog(@"\r\rTHIS LESSON IS NOT LAST LESSON OF DAY\r%@\r-------",targetCourseStopTime);
            }
        }
        
    }
    NSLog(@"RETURNING LASTLESSON = %hhd",isCourseLastLessonOfDay);
    return isCourseLastLessonOfDay;
}

-(NSString*)compareDate: (NSDate*)targetDate withOtherDate: (NSDate*) targetOtherDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    NSComparisonResult result = [targetDate compare:targetOtherDate];
    
    switch (result)
    {
        case NSOrderedAscending:
            NSLog(@"%@ IS BEFORE %@", [formatter stringFromDate:targetDate], [formatter stringFromDate:targetOtherDate]);
            return @"before";
        case NSOrderedDescending:
            NSLog(@"%@ IS AFTER %@", [formatter stringFromDate:targetDate], [formatter stringFromDate:targetOtherDate]);
            return @"after";
        case NSOrderedSame:
            NSLog(@"%@ IS THE SAME AS %@", [formatter stringFromDate:targetDate], [formatter stringFromDate:targetOtherDate]);
            return @"same";
        default:
            NSLog(@"erorr dates %@, %@", [formatter stringFromDate:targetDate], [formatter stringFromDate:targetOtherDate]);
            return @"error";
    }
}

- (IBAction)logOutStudent:(id)sender
{
  
    
    int numViewControllers = self.navigationController.viewControllers.count;
    UIView *nextView = [[self.navigationController.viewControllers objectAtIndex:numViewControllers - 2] view];
    
    [UIView transitionFromView:self.navigationController.topViewController.view toView:nextView duration:0.4 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
        [self.navigationController popViewControllerAnimated:false];
    }];
    
}
@end
