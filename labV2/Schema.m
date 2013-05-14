

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
    schema.Lasa = dayAsJson[@"Lasa"];

    
    return schema;
}
-(id) init
{
    return [self initMandag:@"Mandag" InitTisdag:@"Tisdag" InitOnsdag:@"Onsdag" InitTorsdag:@"Torsdag" InitFredag:@"fredag" InitLasa:@"Lasa"];
}


-(id) initMandag:(NSString *)Mandag InitTisdag:(NSString *)Tisdag InitOnsdag:(NSString *)Onsdag InitTorsdag:(NSString *)Torsdag InitFredag:(NSString *)Fredag InitLasa:(NSString *)Lasa{
    self = [super init];
    
    if(self) {
        self.Mandag = Mandag;
        self.Tisdag = Tisdag;
        self.Onsdag = Onsdag;
        self.Torsdag = Torsdag;
        self.Fredag = Fredag;
        self.Lasa = Lasa;


    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"Måndag:%@ Tisdag:%@ Onsdag:%@ Torsdag:%@ Fredag:%@ Läsanvisning:%@", self.Mandag, self.Tisdag, self.Onsdag, self.Torsdag, self.Fredag, self.Lasa];
}


-(void)ShowSchema
{
    NSLog(@"Måndag:%@ Tisdag:%@ Onsdag:%@ Torsdag%@ Fredag:%@ Läsanvisningar:%@", self.Mandag, self.Tisdag, self.Onsdag, self.Torsdag, self.Fredag, self.Lasa);
}
-(void) ShowDay
{
    NSLog(@"%@:",self);
}



    
    
-(NSDictionary*)dictionary
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    dict[@"Mandag"] = self.Mandag;
    dict[@"Tisdag"] = self.Tisdag;
    dict[@"Onsdag"] = self.Onsdag;
    dict[@"Torsdag"] = self.Torsdag;
    dict[@"Fredag"] = self.Fredag;
    dict[@"Lasa"] = self.Lasa;

    return dict;
}
-(NSString*)json
{
    return [Couch jsonValue:[self dictionary]];
}

@end
