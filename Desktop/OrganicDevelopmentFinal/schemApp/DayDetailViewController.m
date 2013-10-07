#import "DayDetailViewController.h"
#import "LessonDetailViewController.h"
#import "Course.h"
#import "Lesson.h"
#import "Student.h"
#import "Storage.h"
#import "DayDetailViewCell.h"

@interface DayDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;

@end

@implementation DayDetailViewController
{
    NSMutableArray *values;
    NSArray *sortedArray;
}
@synthesize currentStudent, dayToShow, dayLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        sortedArray = [[NSArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    dayLabel.text = dayToShow;
    values = [NSMutableArray new];
    UINib *nib = [UINib nibWithNibName:@"DayDetailViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"DayDetailViewCell"];
    for (Course *course in currentStudent.courses) {
        if ([dayToShow isEqualToString:@"Monday"] && course.lesson.mondayStart && course.lesson.mondayStop)
        {
            [values addObject:course];
            sortedArray = [values sortedArrayUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"lesson.mondayStart" ascending:YES]]];
            
        } else if ([dayToShow isEqualToString:@"Tuesday"] && course.lesson.tuesdayStart && course.lesson.tuesdayStop)
        {
            [values addObject:course];
            sortedArray = [values sortedArrayUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"lesson.tuesdayStart" ascending:YES]]];
            
        } else if ([dayToShow isEqualToString:@"Wednesday"] && course.lesson.wednesdayStart && course.lesson.wednesdayStop)
        {
            [values addObject:course];
            sortedArray = [values sortedArrayUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"lesson.wednesdayStart" ascending:YES]]];
            
        } else if ([dayToShow isEqualToString:@"Thursday"] && course.lesson.thursdayStart && course.lesson.thursdayStop)
        {
            [values addObject:course];
            sortedArray = [values sortedArrayUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"lesson.thursdayStart" ascending:YES]]];
            
        } else if ([dayToShow isEqualToString:@"Friday"] && course.lesson.fridayStart && course.lesson.fridayStop)
        {
            [values addObject:course];
            
            sortedArray = [values sortedArrayUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"lesson.fridayStart" ascending:YES]]];
        }
        
    }
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:sortedArray];
    values = array;
    
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
    DayDetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DayDetailViewCell"];
    
    if(!cell)
    {
        cell = [[DayDetailViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"DayDetailViewCell"];
    }
    
    if ([dayToShow isEqualToString:@"Monday"]) {
        Course *forCellText = [values objectAtIndex:indexPath.row];
        cell.courseNameLabel.text = [NSString stringWithFormat:@"%@",forCellText.courseName];
        cell.courseInformationLabel.text = [NSString stringWithFormat:@"%@",forCellText.courseDescription];
        cell.dayTimeStartLabel.text = [NSString stringWithFormat:@"%@", forCellText.lesson.mondayStart];
        cell.dayTimeStopLabel.text = [NSString stringWithFormat:@"%@", forCellText.lesson.mondayStop];
    } else if ([dayToShow isEqualToString:@"Tuesday"])
    {
        Course *forCellText = [values objectAtIndex:indexPath.row];
        cell.courseNameLabel.text = [NSString stringWithFormat:@"%@",forCellText.courseName];
        cell.courseInformationLabel.text = [NSString stringWithFormat:@"%@",forCellText.courseDescription];
        cell.dayTimeStartLabel.text = [NSString stringWithFormat:@"%@", forCellText.lesson.tuesdayStart];
        cell.dayTimeStopLabel.text = [NSString stringWithFormat:@"%@", forCellText.lesson.tuesdayStop];
        
    } else if ([dayToShow isEqualToString:@"Wednesday"])
    {
        Course *forCellText = [values objectAtIndex:indexPath.row];
        cell.courseNameLabel.text = [NSString stringWithFormat:@"%@",forCellText.courseName];
        cell.courseInformationLabel.text = [NSString stringWithFormat:@"%@",forCellText.courseDescription];
        cell.dayTimeStartLabel.text = [NSString stringWithFormat:@"%@", forCellText.lesson.wednesdayStart];
        cell.dayTimeStopLabel.text = [NSString stringWithFormat:@"%@", forCellText.lesson.wednesdayStop];
        
    } else if ([dayToShow isEqualToString:@"Thursday"])
    {
        Course *forCellText = [values objectAtIndex:indexPath.row];
        cell.courseNameLabel.text = [NSString stringWithFormat:@"%@",forCellText.courseName];
        cell.courseInformationLabel.text = [NSString stringWithFormat:@"%@",forCellText.courseDescription];
        cell.dayTimeStartLabel.text = [NSString stringWithFormat:@"%@", forCellText.lesson.thursdayStart];
        cell.dayTimeStopLabel.text = [NSString stringWithFormat:@"%@", forCellText.lesson.thursdayStop];
        
    } else if ([dayToShow isEqualToString:@"Friday"])
    {
        Course *forCellText = [values objectAtIndex:indexPath.row];
        cell.courseNameLabel.text = [NSString stringWithFormat:@"%@",forCellText.courseName];
        cell.courseInformationLabel.text = [NSString stringWithFormat:@"%@",forCellText.courseDescription];
        cell.dayTimeStartLabel.text = [NSString stringWithFormat:@"%@", forCellText.lesson.fridayStart];
        cell.dayTimeStopLabel.text = [NSString stringWithFormat:@"%@", forCellText.lesson.fridayStop];
        
    } else
    {
        cell.courseNameLabel.text = @"Unable to see day.";
    }
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LessonDetailViewController *ldvc = [LessonDetailViewController new];
    ldvc.currentCourse = [values objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:ldvc animated:YES];
    
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
}
@end