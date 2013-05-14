

#import <Foundation/Foundation.h>
#import "Couch.h"
@interface Schema : NSObject



@property (nonatomic, copy) NSString *Mandag;
@property (nonatomic, copy) NSString *Tisdag;
@property (nonatomic, copy) NSString *Onsdag;
@property (nonatomic, copy) NSString *Torsdag;
@property (nonatomic, copy) NSString *Fredag;

@property (nonatomic, copy, readonly) NSString *studentId;

-(id) initMandag:(NSString*) Mandag InitTisdag:(NSString*) Tisdag InitOnsdag:(NSString*) Onsdag InitTorsdag:(NSString*) Torsdag InitFredag:(NSString*) Fredag;


+(id) dayFromJson:(NSDictionary*) dayAsJson;




-(NSDictionary*)dictionary;
-(NSString*)json;
@end
