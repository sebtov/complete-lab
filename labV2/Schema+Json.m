

#import "Schema+Json.h"

@implementation Schema (Json)

-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc] init];
    
    selfAsJson[@"Måndag"] = self.Mandag;
    selfAsJson[@"Tisdag"] = self.Tisdag;
    selfAsJson[@"Onsdag"] = self.Onsdag;
    selfAsJson[@"Torsdag"] = self.Torsdag;
    selfAsJson[@"Fredag"] = self.Fredag;

    
    return selfAsJson;
}

@end






