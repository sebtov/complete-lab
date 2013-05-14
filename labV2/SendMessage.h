//
//  SendMessage.h
//  labV2
//
//  Created by sebastian holmqvist on 2013-05-13.
//  Copyright (c) 2013 Jimmy Lidström. All rights reserved.
//

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
