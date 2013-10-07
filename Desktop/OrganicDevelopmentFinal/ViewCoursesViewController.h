//
//  ViewCoursesViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-24.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewCoursesViewController : UIViewController <UISearchBarDelegate, UISearchDisplayDelegate, UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *allCourses;
    NSMutableArray *searchResult;
    NSManagedObjectContext *context;
}

@property (weak, nonatomic) IBOutlet UISearchBar *searchBarCourses;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UITableView *showAllTableView;

- (IBAction)addNewCourse:(id)sender;
- (IBAction)syncWithDBOnline:(id)sender;
- (IBAction)SignOut:(id)sender;

@end
