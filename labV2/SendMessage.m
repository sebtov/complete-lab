

#import "SendMessage.h"

@implementation SendMessage

+(id) messageFromJson:(NSDictionary*)messageAsJson
{
    SendMessage *message = [[self alloc] init];
    message.message = messageAsJson[@"Message"];
    message.message = messageAsJson[@"StudentId"];
    
    
    return message;
}

-(id) init
{
    return [self initWithMessage:@"" StudentId:@""];
}

-(id) initWithMessage:(NSString*) message StudentId:(NSString*)studentId
{
    self = [super init];
    
    if(self) {
        self.message = message;
        self.studentId =studentId;
      
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@, %@", self.message, self.studentId];
}





-(NSDictionary*)dictionary
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];

    dict[@"Message"] = self.message;
    dict[@"StudentId"] = self.studentId;

    return dict;
}
-(NSString*)json
{
    return [Couch jsonValue:[self dictionary]];
}


@end
