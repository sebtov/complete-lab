

#import "Read.h"

@implementation Read

+(id) readFromJson:(NSDictionary*)readAsJson
{
    Read *read = [[self alloc] init];
    read.readMonday =readAsJson[@"readMondag"];
    read.readTuesday =readAsJson[@"readTuseday"];
    read.readWednesday =readAsJson[@"readWednsday"];
    read.readThursday =readAsJson[@"readThursday"];
    read.readFriday =readAsJson[@"readFriday"];
    read.readWeekend =readAsJson[@"readWeekend"];
    read.classId = readAsJson[@"classId"];
    
    
    return read;
}

-(id) init
{
    return [self initWithReadMonday:@"" readTuesday:@"" readWednesday:@"" readThursday:@"" readFriday:@"" readWeekend:@"" classId:@""];
}

-(id) initWithReadMonday:(NSString *)readMonday readTuesday:(NSString *)readTuesday readWednesday:(NSString *)readWednesday readThursday:(NSString *)readThursday readFriday:(NSString *)readFriday readWeekend:(NSString *)readWeekend classId:(NSString *)classId
{
    self = [super init];
    
    if(self) {
        self.readMonday =readMonday;
        self.readTuesday = readTuesday;
        self.readWednesday = readWednesday;
        self.readThursday = readThursday;
        self.readFriday = readFriday;
        self.readWeekend = readWeekend;
        self.classId =classId;
        
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@, %@, %@, %@, %@, %@, %@", self.readMonday, self.readTuesday,self.readWednesday,self.readThursday,self.readFriday,self.readWeekend,self.classId];
}





-(NSDictionary*)dictionary
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    dict[@"readMonday"] = self.readMonday;
    dict[@"readTuesday"] = self.readTuesday;
    dict[@"readWednesday"] = self.readWednesday;
    dict[@"readThursday"] = self.readThursday;
    dict[@"readFriday"] = self.readFriday;
    dict[@"readWeekend"] = self.readWeekend;
    dict[@"classId"] = self.classId;




    dict[@"classId"] = self.classId;
    
    return dict;
}
-(NSString*)json
{
    return [Couch jsonValue:[self dictionary]];
}


@end
