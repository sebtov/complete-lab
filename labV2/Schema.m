

#import "Schema.h"

@implementation Schema

+(id) dayFromJson:(NSDictionary*) dayAsJson
{
    
    Schema *schema = [[self alloc]init];
    schema.Mandag = dayAsJson[@"Mandag"];
    schema.Tisdag = dayAsJson[@"Tisdag"];
    schema.Onsdag = dayAsJson[@"Onsdag"];
    schema.Torsdag = dayAsJson[@"Torsdag"];
    schema.Fredag = dayAsJson[@"Fredag"];

    
    return schema;
}
-(id) init
{
    return [self initMandag:@"Mandag" InitTisdag:@"Tisdag" InitOnsdag:@"Onsdag" InitTorsdag:@"Torsdag" InitFredag:@"fredag"];
}


-(id) initMandag:(NSString *)Mandag InitTisdag:(NSString *)Tisdag InitOnsdag:(NSString *)Onsdag InitTorsdag:(NSString *)Torsdag InitFredag:(NSString *)Fredag{
    self = [super init];
    
    if(self) {
        self.Mandag = Mandag;
        self.Tisdag = Tisdag;
        self.Onsdag = Onsdag;
        self.Torsdag = Torsdag;
        self.Fredag = Fredag;


    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"Måndag:%@ Tisdag:%@ Onsdag:%@ Torsdag:%@ Fredag:%@", self.Mandag, self.Tisdag, self.Onsdag, self.Torsdag, self.Fredag];
}






    
    
-(NSDictionary*)dictionary
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    dict[@"Mandag"] = self.Mandag;
    dict[@"Tisdag"] = self.Tisdag;
    dict[@"Onsdag"] = self.Onsdag;
    dict[@"Torsdag"] = self.Torsdag;
    dict[@"Fredag"] = self.Fredag;

    return dict;
}
-(NSString*)json
{
    return [Couch jsonValue:[self dictionary]];
}

@end
