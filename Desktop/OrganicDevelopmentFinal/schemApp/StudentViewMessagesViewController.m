#import "StudentViewMessagesViewController.h"
#import "StudentReadMessageViewController.h"
#import "SendMessage.h"
#import "AppDelegate.h"
#import "Storage.h"
#import "Student.h"
#import "Couch.h"
#import "MessageCell.h"

@interface StudentViewMessagesViewController ()
{
    NSMutableArray *messages;
    UIRefreshControl *refreshControl;
}
@end


@implementation StudentViewMessagesViewController
@synthesize currentStudent, messageTableView, timeLabel,messageLoadIndicatior;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        messages = [NSMutableArray new];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchMessageToAll];
    
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refreshInvoked:forState:) forControlEvents:UIControlEventValueChanged];
    
    NSString *fetchMessage = @"fetching messages...";
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:fetchMessage attributes:
                                      @{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:11.0]}];
    
    [self.messageTableView addSubview:refreshControl];
    [self refreshFeed];
    
    
    UINib *nib = [UINib nibWithNibName:@"MessageCell" bundle:nil];
    [self.messageTableView registerNib:nib forCellReuseIdentifier:@"MessageCell"];
    [messageLoadIndicatior startAnimating];
}

-(void) refreshFeed
{
    
    timeLabel.text = @"";
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"HH:mm"];
    
    Couch *couch = [[Couch alloc] init];
    [couch reqToUrl:@"https://schemapp.cloudant.com/messages/_design/design/_view/allMessages" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSMutableDictionary *responseAsDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSMutableArray *returnedMessages = [responseAsDict valueForKey:@"rows"];
        NSMutableArray *allRelevantMessages = [[NSMutableArray alloc] init];
        for (int i = 0; i < [returnedMessages count]; i++) {
            if ([[[returnedMessages objectAtIndex:i] valueForKeyPath:@"value.StudentId"] isEqualToString:@"messageToAll"] || [[[returnedMessages objectAtIndex:i] valueForKeyPath:@"value.StudentId"] isEqualToString:currentStudent.studentSignum]) {
                SendMessage *sm = [[SendMessage alloc] init];
                sm.from = [[returnedMessages objectAtIndex:i] valueForKeyPath:@"value.From"];
                sm.message = [[returnedMessages objectAtIndex:i] valueForKeyPath:@"value.Message"];
                sm.studentId = [[returnedMessages objectAtIndex:i] valueForKeyPath:@"value.StudentId"];
                sm.time = [[returnedMessages objectAtIndex:i] valueForKeyPath:@"value.Time"];
                [allRelevantMessages addObject:sm];
            
            }
        }
        [messageLoadIndicatior stopAnimating];
        
        NSDate *now = [NSDate date];
        NSMutableString *timeString = [[NSMutableString alloc] initWithString:@"Last updated "];
        NSString *nowAsString = [dateformatter stringFromDate:now];
        [timeString appendString:nowAsString];
        [[self timeLabel] setText:timeString];
        
        NSArray *sortedAllDataArray = [allRelevantMessages sortedArrayUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"time" ascending:NO]]];
        NSMutableArray *mutableSortArray = [NSMutableArray arrayWithArray:sortedAllDataArray];
        
        messages = mutableSortArray;
        [refreshControl endRefreshing];
        [[self messageTableView] reloadData];
        
    }];
    
}

-(void) refreshInvoked:(id) sender forState: (UIControlState)state
{
    [self refreshFeed];
}

#pragma mark - Message Methods

-(void)fetchMessageToAll
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    for (SendMessage *message in delegate.messages) {
        if ([message.studentId isEqualToString:@"messageToAll"] || [message.studentId isEqualToString:currentStudent.studentSignum]) {
            [messages addObject:message];
            
        }
        
    }
    
    NSArray *sortedArray = [messages sortedArrayUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"time" ascending:NO]]];
    NSMutableArray *mutableSortArray = [NSMutableArray arrayWithArray:sortedArray];
    messages = mutableSortArray;
}

#pragma mark tableViews

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [MessageCell new];
    }
    
    cell.dateLabel.text = [[messages objectAtIndex:[indexPath row]] time];
    cell.fromLabel.text = [[messages objectAtIndex:[indexPath row]] from];
    cell.messageLabel.text = [[messages objectAtIndex:[indexPath row]] message];
    
    if ([[[messages objectAtIndex:[indexPath row]] studentId] isEqualToString:@"messageToAll"]) {
        cell.toLabel.text = @"To all";
    } else {
        cell.toLabel.text = @"Private";
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StudentReadMessageViewController *srmvc = [StudentReadMessageViewController new];
    srmvc.message = [messages objectAtIndex:[indexPath row]];
    [self.navigationController pushViewController:srmvc animated:YES];
}

#pragma mark signOut

- (IBAction)LogOut:(id)sender
{    
    int numViewControllers = self.navigationController.viewControllers.count;
    UIView *nextView = [[self.navigationController.viewControllers objectAtIndex:numViewControllers - 2] view];
    
    [UIView transitionFromView:self.navigationController.topViewController.view toView:nextView duration:0.4 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
        [self.navigationController popViewControllerAnimated:false];
    }];
    
}
@end