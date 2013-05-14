
#import <Foundation/Foundation.h>
#import "Couch.h"
@interface SendMessage : NSObject
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *studentId;


-(id) initWithMessage:(NSString*) message StudentId:(NSString*)studentId;
+(id) messageFromJson:(NSDictionary*) messageAsJson;


-(NSString*)json;
-(NSDictionary*)dictionary;

@end
