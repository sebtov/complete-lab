

#import "Read+Json.h"

@implementation Read (Json)

-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc] init];
    
    
    selfAsJson[@"readMonday"] = self.readMonday;
    selfAsJson[@"readTuesday"] = self.readTuesday;
    selfAsJson[@"readWednesday"] = self.readWednesday;
    selfAsJson[@"readThursday"] = self.readThursday;
    selfAsJson[@"readFriday"] = self.readFriday;
    selfAsJson[@"readWeekend"] = self.readWeekend;

    selfAsJson[@"classId"] = self.classId;
    
    
    return selfAsJson;
}
@end

