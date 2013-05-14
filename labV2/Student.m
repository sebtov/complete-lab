
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


-(NSUInteger)hash
{
    return 37 * [self.studentId hash];
}

-(BOOL)isEqual:(id)other
{
    if(other == self){
        return YES;
    }
    
    if(other && [other isMemberOfClass:[self class]]){
        return [[other studentId] isEqualToString:self.studentId];
    }
    
    return NO;
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
