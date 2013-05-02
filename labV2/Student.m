
#import "Student.h"

@implementation Student

+(id) studentFromJson:(NSDictionary*) studentAsJson
{
    Student *student = [[self alloc] init];
    student->_studentId = studentAsJson[@"studentId"];
    student.firstName = studentAsJson[@"firstName"];
    student.lastName = studentAsJson[@"lastName"];
    student.klass = studentAsJson[@"klass"];

 
    
    return student;
}

-(id) init
{
    return [self initWithName:@"" lastName:@"" klass:@""];
}

-(id) initWithName:(NSString *)firstName lastName:(NSString *)lastName klass:(NSString*)klass
{
    self = [super init];
    
    if(self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.klass = klass;
        self->_studentId = [[NSUUID UUID] UUIDString];
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@, %@ %@, %@", self.studentId, self.firstName, self.lastName, self.klass];
}
-(void)ShowStudent
{
//    NSLog(@"%@ %@", self.firstName, self.lastName);
}

-(NSUInteger)hash
{
    return 37 * [self.studentId hash];
}

-(BOOL)isEqual:(id)other
{
    // if other points to self - we are equal
    if(other == self){
        return YES;
    }
    
    // if other is not nil AND is member of same class as we (self)
    if(other && [other isMemberOfClass:[self class]]){
        // comapre animalId
        return [[other studentId] isEqualToString:self.studentId];
    }
    
    // we are not equal
    return NO;
}

-(void)getMessage:(NSString *)message
{
    NSLog(@"%@", message);
}

-(NSDictionary*)dictionary
{
NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];

    dict[@"studentId"] = self.studentId;
    dict[@"firstName"] = self.firstName;
    dict[@"lastName"] = self.lastName;
    dict[@"klass"] = self.klass;
    return dict;
}
-(NSString*)json
{
    return [Couch jsonValue:[self dictionary]];
}

@end
