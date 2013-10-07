//
//  AppDelegate.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-09.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "Storage.h"
#import "MainViewController.h"
#import "Couch.h"
#import "SendMessage.h"
#import "ViewCoursesViewController.h"
#import "ViewStudentsViewController.h"
#import "MessageStudentViewController.h"

@implementation AppDelegate

@synthesize messages;
@synthesize arrayCourses;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    sleep(1);
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MainViewController *mvc = [MainViewController new];
    UINavigationController *nva = [[UINavigationController alloc]initWithRootViewController:mvc];
    self.window.rootViewController = nva;
    
    [Parse setApplicationId:@"vEmS5x1BPBEzLmPQEmrYIkokHuSytp6THXddpdgP"
                  clientKey:@"UZ0NrTgLtJFNI2rLpaASFLuBxzWc6GvkjyAMl5F1"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    [Storage loadFromParseOnline];
    
    [self loadMessages];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - Message Methods

-(void)loadMessages
{
    Couch *couch = [[Couch alloc] init];
    self.messages = [NSMutableArray new];
    [couch reqToUrl:@"https://schemapp.cloudant.com/messages/_design/design/_view/allMessages" HttpMethod:@"GET" body:@"" onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (data) {
            for (NSDictionary *dic in [[Couch parseData:data] objectForKey:@"rows"]) {
                NSDictionary *asDic = [dic valueForKey:@"value"];
                [messages addObject:[[SendMessage alloc] initWithMessage:[asDic valueForKey:@"Message"] From:[asDic valueForKey:@"From"] StudentId:[asDic valueForKey:@"StudentId"]Time:[asDic valueForKey:@"Time"]]];
            }
        } else {
            [messages addObject:[[SendMessage alloc]initWithMessage:@"No Connection" From:@"Master" StudentId:@"messageToAll" Time:@"no time"]];
            NSLog(@"Could not find data!");
        }
    }];
}

@end
