

#import "Admin.h"
#import "Student.h"
#import "Schema.h"

@implementation Admin

-(void)setStudentId:(NSNotification *)notification
{
//    Student *student = [notification userInfo][studentToMarkKey];
//    NSLog(@"Admin gave student id: %@", student.studentId);
}

-(void) setScheme:(NSNotification*) notification
{
    NSLog(@"Nytt Schema tillagt");
}



@end
