

#import <Foundation/Foundation.h>
#import "Couch.h"

@interface Read : NSObject
@property (nonatomic, copy) NSString *readMonday;
@property (nonatomic, copy) NSString *readTuesday;
@property (nonatomic, copy) NSString *readWednesday;
@property (nonatomic, copy) NSString *readThursday;
@property (nonatomic, copy) NSString *readFriday;
@property (nonatomic, copy) NSString *readWeekend;

@property (nonatomic, copy) NSString *classId;


-(id) initWithReadMonday:(NSString*) readMonday readTuesday:(NSString*)readTuesday readWednesday:(NSString*)readWednesday readThursday:(NSString*)readThursday readFriday:(NSString*)readFriday readWeekend:(NSString*)readWeekend classId:(NSString*)classId;

+(id) readFromJson:(NSDictionary*) readAsJson;


-(NSString*)json;
-(NSDictionary*)dictionary;

@end
