//
//  Schema.h
//  labV2
//
//  Created by sebastian holmqvist on 2013-04-22.
//  Copyright (c) 2013 Jimmy Lidström. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Couch.h"
@interface Schema : NSObject



@property (nonatomic, copy) NSString *Mandag;
@property (nonatomic, copy) NSString *Tisdag;
@property (nonatomic, copy) NSString *Onsdag;
@property (nonatomic, copy) NSString *Torsdag;
@property (nonatomic, copy) NSString *Fredag;
@property (nonatomic, copy) NSString *Lasa;

@property (nonatomic, copy, readonly) NSString *studentId;

-(id) initMandag:(NSString*) Mandag InitTisdag:(NSString*) Tisdag InitOnsdag:(NSString*) Onsdag InitTorsdag:(NSString*) Torsdag InitFredag:(NSString*) Fredag InitLasa:(NSString*)Lasa;


+(id) dayFromJson:(NSDictionary*) dayAsJson;

-(void) ShowSchema;
-(void) ShowDay;


-(NSDictionary*)dictionary;
-(NSString*)json;
@end
