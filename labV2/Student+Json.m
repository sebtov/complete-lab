

#import "Student+Json.h"

@implementation Student (Json)

-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc] init];
    
    selfAsJson[@"studentId"] = self.studentId;
    selfAsJson[@"firstName"] = self.firstName;
    selfAsJson[@"lastName"] = self.lastName;
    selfAsJson[@"klass"] = self.klass;
    
    return selfAsJson;
}

@end
