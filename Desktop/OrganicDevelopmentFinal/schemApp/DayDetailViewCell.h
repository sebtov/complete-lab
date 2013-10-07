//
//  DayDetailViewCell.h
//  schemApp
//
//  Created by Patrik Sundbäck on 9/29/13.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayDetailViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *courseNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *courseInformationLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayTimeStartLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayTimeStopLabel;

@end
