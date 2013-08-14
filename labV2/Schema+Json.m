

#import "Schema+Json.h"

@implementation Schema (Json)

-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc] init];
    
    selfAsJson[@"Måndag"] = self.Monday;
    selfAsJson[@"Tisdag"] = self.Tuesday;
    selfAsJson[@"Onsdag"] = self.Wednesday;
    selfAsJson[@"Torsdag"] = self.Thursday;
    selfAsJson[@"Fredag"] = self.Friday;

    
    return selfAsJson;
}

@end






