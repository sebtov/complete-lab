

#import <Foundation/Foundation.h>
#import "Couch.h"

@interface Student : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic,copy) NSString *klass;

@property (nonatomic, copy, readonly) NSString *studentId;

-(id) initWithName:(NSString*) firstName lastName:(NSString*) lastName klass:(NSString*) klass;

+(id) studentFromJson:(NSDictionary*) studentAsJson;


-(NSString*)json;
-(NSDictionary*)dictionary;

@end
