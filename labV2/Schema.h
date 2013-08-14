

#import <Foundation/Foundation.h>
#import "Couch.h"
@interface Schema : NSObject



@property (nonatomic, copy) NSString *Monday;
@property (nonatomic, copy) NSString *Tuesday;
@property (nonatomic, copy) NSString *Wednesday;
@property (nonatomic, copy) NSString *Thursday;
@property (nonatomic, copy) NSString *Friday;

@property (nonatomic, copy, readonly) NSString *studentId;

-(id) initMonday:(NSString*) Monday InitTuesday:(NSString*) Tuesday InitWednesday:(NSString*) Wednesday InitThursday:(NSString*) Thursday InitFriday:(NSString*) Friday;


+(id) dayFromJson:(NSDictionary*) dayAsJson;




-(NSDictionary*)dictionary;
-(NSString*)json;
@end
