//
//  Date.m
//  labV2
//
//  Created by sebastian holmqvist on 2013-04-24.
//  Copyright (c) 2013 Jimmy Lidström. All rights reserved.
//

#import "Date.h"

@implementation Date

NSDate *today = [NSDate date];
NSCalendar *gregorian = [[NSCalendar alloc]
                         initWithCalendarIdentifier:NSGregorianCalendar];
NSDateComponents *weekdayComponents =
[gregorian components:(NSDayCalendarUnit | NSWeekdayCalendarUnit) fromDate:today];
NSInteger day = [weekdayComponents day];
NSInteger weekday = [weekdayComponents weekday];




@end
