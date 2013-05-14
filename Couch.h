

#import <Foundation/Foundation.h>

typedef void(^onRequestComplete)(NSURLResponse *response, NSData *data, NSError *error);
@interface Couch : NSObject

+(NSString*) jsonValue:(NSDictionary*) dict;
+(id) parseData:(NSData*)data;

//Sends an req to url
-(void) reqToUrl:(NSString*)url HttpMethod:(NSString*)Method body:(NSString*)body onComplete:(onRequestComplete)callback;


//create an mutable req.
-(NSMutableURLRequest*) reqWithString:(NSString*)reqUrl HttpMethod:(NSString*)Method body:(NSString*)body;


@end
