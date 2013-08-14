

#import "Schema.h"

@implementation Schema

+(id) dayFromJson:(NSDictionary*) dayAsJson
{
    
    Schema *schema = [[self alloc]init];
    schema.Monday = dayAsJson[@"Mandag"];
    schema.Tuesday = dayAsJson[@"Tisdag"];
    schema.Wednesday = dayAsJson[@"Onsdag"];
    schema.Thursday = dayAsJson[@"Torsdag"];
    schema.Friday = dayAsJson[@"Fredag"];

    
    return schema;
}
-(id) init
{
    return [self initMonday:@"Mandag" InitTuesday:@"Tisdag" InitWednesday:@"Onsdag" InitThursday:@"Torsdag" InitFriday:@"fredag"];
}


-(id) initMonday:(NSString *)Monday InitTuesday:(NSString *)Tuesday InitWednesday:(NSString *)Wednesday InitThursday:(NSString *)Thursday InitFriday:(NSString *)Friday{
    self = [super init];
    
    if(self) {
        self.Monday = Monday;
        self.Tuesday = Tuesday;
        self.Wednesday = Wednesday;
        self.Thursday = Thursday;
        self.Friday = Friday;


    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"Måndag:%@ Tisdag:%@ Onsdag:%@ Torsdag:%@ Fredag:%@", self.Monday, self.Tuesday, self.Wednesday, self.Thursday, self.Friday];
}






    
    
-(NSDictionary*)dictionary
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    dict[@"Mandag"] = self.Monday;
    dict[@"Tisdag"] = self.Tuesday;
    dict[@"Onsdag"] = self.Wednesday;
    dict[@"Torsdag"] = self.Thursday;
    dict[@"Fredag"] = self.Friday;

    return dict;
}
-(NSString*)json
{
    return [Couch jsonValue:[self dictionary]];
}

@end
