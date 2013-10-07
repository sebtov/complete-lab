//
//  StudentReadMessageViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-24.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "StudentReadMessageViewController.h"
#import "SendMessage.h"

@interface StudentReadMessageViewController ()

@end

@implementation StudentReadMessageViewController
@synthesize messageField;
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
    
    self.fromLabel.text = self.message.from;
    self.messageField.text = self.message.message;
    self.dateLabel.text = self.message.time;
    
    [self.messageField setEditable:NO];
    [self messageMethod];

    messageField.layer.borderColor = [UIColor grayColor].CGColor;
    messageField.layer.borderWidth = 0.5f;
}




-(void)messageMethod
{
    
    if ([self.message.studentId isEqualToString:@"messageToAll"]) {
        self.toLabel.text = @"To all";
    }else{
        self.toLabel.text = @"Privat";
    }
}



- (IBAction)backButton:(id)sender {
 [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
}
@end
