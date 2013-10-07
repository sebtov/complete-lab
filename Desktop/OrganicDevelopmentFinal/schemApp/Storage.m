//
//  Storage.m
//  schemApp
//
//  Created by Jimmy Lidström on 2013-09-16.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//
#import <Parse/Parse.h>
#import "Storage.h"
#import "Course.h"
#import "Student.h"

@interface Storage ()

@property (nonatomic, readwrite, strong)NSManagedObjectContext *context;
@property (nonatomic, strong)NSManagedObjectModel *model;
@property (nonatomic, strong)NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation Storage

#pragma mark - Shared Storage

+(Storage*)sharedStorage
{
    
    static Storage *sharedInstance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [Storage new];
    });
    
    return sharedInstance;
}

#pragma mark - Public context

-(NSManagedObjectContext*)context
{
    if (!_context) {
        _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _context.persistentStoreCoordinator = [self persistentStoreCoordinator];
    }
    return _context;
}


#pragma mark - Public CRUD helpers

+(void) saveManagedContext:(NSManagedObjectContext*) targetContext
{
    NSError *error;
    
    if ([targetContext save:&error]) {
        NSLog(@"Context saved");
    } else {
        NSLog(@"Could not save context. Error: %@", [error localizedDescription]);
    }
}

- (void) updateCourseWithCourseName: (NSString *) courseName withNewInfo: (Course *) newCourse
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"courseName == %@", courseName];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Course" inManagedObjectContext:[self context]];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDesc];
    [fetchRequest setPredicate:predicate];
    
    Course *courseToDelete = [[[self context] executeFetchRequest:fetchRequest error:nil] lastObject];
    [[self context] deleteObject:courseToDelete];
    
    NSError *error = nil;
    [[self context] save:&error];
    
}

- (void) deleteCourseWithCourseName: (NSString *) courseName
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"courseName == %@", courseName];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Course" inManagedObjectContext:[self context]];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDesc];
    [fetchRequest setPredicate:predicate];
    
    Course *courseToDelete = [[[self context] executeFetchRequest:fetchRequest error:nil] lastObject];
    [[self context] deleteObject:courseToDelete];
    
    NSError *error = nil;
    [[self context] save:&error];
    
}

-(void) deleteStudentWithStudentName: (NSString *) studentSignum
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstName == %@",studentSignum];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:[self context]];
    
    NSFetchRequest *fetchRequst = [[NSFetchRequest alloc]init];
    [fetchRequst setEntity:entityDesc];
    [fetchRequst setPredicate:predicate];
    
    Student *studentToDelete = [[[self context]executeFetchRequest:fetchRequst error:nil] lastObject];
    [[self context] deleteObject:studentToDelete];
    
    NSError *error = nil;
    [[self context] save:&error];
    
}

-(void) deleteStudentWithStudentSignum: (NSString *) targetStudentSignum
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"studentSignum == %@",targetStudentSignum];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:[self context]];
    
    NSFetchRequest *fetchRequst = [[NSFetchRequest alloc]init];
    [fetchRequst setEntity:entityDesc];
    [fetchRequst setPredicate:predicate];
    
    Student *studentToDelete = [[[self context]executeFetchRequest:fetchRequst error:nil] lastObject];
    [[self context] deleteObject:studentToDelete];
    
    NSError *error = nil;
    [[self context] save:&error];
}

#pragma mark - Return Methods

- (NSArray *) readCourseWithPredicate: (NSPredicate *) predicate
{
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Course" inManagedObjectContext:[self context]];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDesc];
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;

    NSArray *fetchResultArray = [[self context] executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"Couldn't fetch, reason: %@", [error localizedDescription]);
    }
    
    return fetchResultArray;
    
}

- (NSMutableArray *) readStudentWithPredicate: (NSPredicate *) predicate
{
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:[self context]];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDesc];
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    
    NSArray *fetchResult = [[self context] executeFetchRequest:fetchRequest error:&error];
    NSMutableArray *result = [NSMutableArray arrayWithArray:fetchResult];
    if (error) {
        NSLog(@"Couldn't fetch, reason: %@", [error localizedDescription]);
    }
    
    return result;
}

- (NSMutableArray *) getAllStudents
{
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:[self context]];
    NSFetchRequest *fetchReq = [[NSFetchRequest alloc] init];
    
    [fetchReq setEntity:entityDesc];
    NSError *error;
    NSArray *fetchResult = [[self context] executeFetchRequest:fetchReq error:&error];
    NSMutableArray *result = [NSMutableArray arrayWithArray:fetchResult];
    
    return result;
}

+(Course *) returnCourseByName:(NSString *)targetCourseName
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"courseName == %@", targetCourseName];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Course" inManagedObjectContext:[Storage sharedStorage].context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDesc];
    [fetchRequest setPredicate:predicate];
    
    Course *courseToReturn = [[[Storage sharedStorage].context executeFetchRequest:fetchRequest error:nil] lastObject];
    return courseToReturn;
}

+(Student *) returnStudentBySignum: (NSString *)targetStudentSignum
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"studentSignum == %@", targetStudentSignum];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:[self sharedStorage].context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDesc];
    [fetchRequest setPredicate:predicate];
    
    Student *studentToReturn = [[[[self sharedStorage] context] executeFetchRequest:fetchRequest error:nil] lastObject];
    return studentToReturn;
}

#pragma mark - Parse Database Online Save & Load Methods

+(void) saveToParseOnline
{
    /*
     Create a ParseObject with set ID.
     */
    PFObject *schemaObject = [PFObject objectWithClassName:@"Schema"];
    schemaObject.objectId = @"K7sUcYPNkr";
    
    /*
     Fetch all courses from Context and convert them into NSDicts.
     Insert the array with Dicts into ParseObject forKey Courses.
     */
    NSFetchRequest *courseRequest = [NSFetchRequest fetchRequestWithEntityName:@"Course"];
    NSArray * coursesFetch = [[Storage sharedStorage].context executeFetchRequest:courseRequest error:nil];
    NSMutableArray *coursesArray = [NSMutableArray new];
    for (Course *course in coursesFetch) {
        [coursesArray addObject:[course returnCourseAsNSDictionary]];
    }
    [schemaObject setObject:coursesArray forKey:@"Courses"];
    
    /*
     Fetch all students from Context and convert them into NSDicts.
     Insert the array with Dicts into ParseObject forKey Students.
     */
    NSFetchRequest *studentRequest = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    NSArray * studentsFetch = [[Storage sharedStorage].context executeFetchRequest:studentRequest error:nil];
    NSMutableArray * studentsArray = [NSMutableArray new];
    for (Student *student in studentsFetch) {
        [studentsArray addObject:[student returnStudentAsNSDictionary]];
    }
    [schemaObject setObject:studentsArray forKey:@"Students"];
    
    /*
     saveEventually will try to save once and if it does not succeed
     it will retry when internet is available.
     */
    [schemaObject saveEventually:^(BOOL succeeded, NSError *error) {
        if (error)
        {
            UIAlertView *alertView =
            [[UIAlertView alloc]initWithTitle:[[error userInfo]objectForKey:@"error"]
                                      message:@"Could not save to database online!"
                                     delegate:self
                            cancelButtonTitle:nil
                            otherButtonTitles:@"Ok", nil];
            [alertView show];
            return;
        }
        if (succeeded)
        {
            NSLog(@"\r\r---Succesfully saved DB Online!---\r\r");
            UIAlertView *alertView =
            [[UIAlertView alloc]initWithTitle:@"Syncronized To DB"
                                      message:@"Successfully saved to Parse Online"
                                     delegate:self
                            cancelButtonTitle:nil
                            otherButtonTitles:@"Ok", nil];
            [alertView show];
            return;
        }
    }];
}
+(void) loadFromParseOnline
{
    /*
     Get PFObject named Schema with set ID.
     */
    PFQuery *query = [PFQuery queryWithClassName:@"Schema"];
    [query getObjectInBackgroundWithId:@"K7sUcYPNkr" block:^(PFObject *object, NSError *error) {
        if (error) {
            NSLog(@"\r\r ERROR: \r\r");
            UIAlertView *alertView =
            [[UIAlertView alloc]initWithTitle:[[error userInfo]objectForKey:@"error"]
                                      message:@"Could not load from database online!"
                                     delegate:self
                            cancelButtonTitle:nil
                            otherButtonTitles:@"Ok", nil];
            [alertView show];
            return;
        }
        
        /*
         Run through dictionarys in Courses and if dictionary is not empty
         check if course already exists to delete the old course and create
         a new. Same thing for Students.
         OBS! You need to create the courses first since Students add
         courses. Then save to context.
         */
        for (NSDictionary *courseAsDict in object[@"Courses"]) {
            if (courseAsDict && ![courseAsDict isEqualToDictionary:@{}]) {
                
                Course *courseToDelete = [self returnCourseByName:courseAsDict[@"courseName"]];
                
                if (courseToDelete) {
                    NSLog(@"Deleting Course!");
                    [[Storage sharedStorage] deleteCourseWithCourseName:courseAsDict[@"courseName"]];
                }
                [Course createCourseFromDictionary:courseAsDict];
            }
        }
        
        for (NSMutableDictionary *studentAsDict in object[@"Students"]) {
            if (studentAsDict && ![studentAsDict isEqualToDictionary:@{}]) {
                
                Student *studentToDelete = [self returnStudentBySignum:studentAsDict[@"studentSignum"]];
                
                if (studentToDelete) {
                    NSLog(@"Deleting Student!");
                    [[Storage sharedStorage] deleteStudentWithStudentSignum:studentAsDict[@"studentSignum"]];
                }
                [Student createStudentFromDictionary:studentAsDict];
            }
        }
        [self saveManagedContext:[self sharedStorage].context];
    }];
}

#pragma mark - Private model and PersistentStoreCoordinator

-(NSManagedObjectModel *)model
{
    if (!_model) {
        _model = [[NSManagedObjectModel alloc] initWithContentsOfURL:[self modelPath]];
    }
    return _model;
}

- (NSMutableArray *)getAllCourses
{
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Course" inManagedObjectContext:[self context]];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDesc];
    
    NSError *error = nil;
    
    NSArray *results = [[self context] executeFetchRequest:fetchRequest error:&error];
    NSMutableArray *mutableResultArray = [NSMutableArray arrayWithArray:results];
    if (error) {
        NSLog(@"Error in fetching all courses. Reason: %@", [error localizedDescription]);
    }
    
    return mutableResultArray;
}


-(NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (!_persistentStoreCoordinator) {
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.model];
        NSError *error;
        
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[self storeURL] options:nil error:&error]) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Could not create persistant store" userInfo:error.userInfo];
        }
        _persistentStoreCoordinator = psc;
    }
    return _persistentStoreCoordinator;
}

#pragma mark - Private Path Helpers

-(NSString*)modelName
{
    return @"schemApp";
}

-(NSURL*)modelPath
{
    return [[NSBundle mainBundle] URLForResource:[self modelName] withExtension:@"momd"];
}
-(NSString*) storeFileName
{
    return [[self modelName]stringByAppendingPathExtension:@"sqlite"];
}

-(NSURL*)storeURL
{
    return [[self documentDirectory] URLByAppendingPathComponent: [self storeFileName]];
}

-(NSURL*) documentDirectory
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentDirectoryURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
    return documentDirectoryURL;
}


@end
