

#import "Message+Json.h"

@implementation SendMessage (Json)


-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc] init];
    
 
    selfAsJson[@"Message"] = self.message;
    selfAsJson[@"StudentID"] = self.studentId;

    
    return selfAsJson;
}

@end
