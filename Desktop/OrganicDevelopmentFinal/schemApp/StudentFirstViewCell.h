//
//  StudentFirstViewCell.h
//  schemApp
//
//  Created by Patrik Sundbäck on 9/27/13.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentFirstViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfCoursesTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfCoursesNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayTimeStart;
@property (weak, nonatomic) IBOutlet UILabel *dayTimeStop;

@end
