///// SEBASTIAN & JIMMY

#import <Foundation/Foundation.h>
#import "Skola.h"
#import "Student.h"
#import "Admin.h"
#import "Schema.h"
#import "Couch.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
#pragma Create a student

        
        Couch *couch =[[Couch alloc] init];
        Student *student = [[Student alloc] initWithName:@"Patrik" lastName:@"Hol" klass:@"1B"];
        [couch reqToUrl:@"Http://localhost:5984/test/Patrik" HttpMethod:@"PUT" body:[student json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
            NSLog(@"%@",response);
            NSLog(@"%@",error);
            NSLog(@"%@",data);
        
            NSLog(@"%@", [Couch parseData:data]);
        }];
       
       
        
        
        
#pragma Create a Schema 
                /*
                    Couch *couch =[[Couch alloc]init];
                        Schema *schema = [[Schema alloc] initMandag:@"Matte 08:00 Engelska 09:00" InitTisdag:@"Handboll 09:00"        InitOnsdag:@"Halvdag" InitTorsdag:@"Fotboll" InitFredag:@"aldrig vila" InitLasa:@""];
                                [couch reqToUrl:@"Http://localhost:5984/test/1B" HttpMethod:@"PUT" body:[schema json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                                    NSLog(@"%@",response);
                                    NSLog(@"%@",error);
                                    NSLog(@"%@",data);
        
                                    NSLog(@"%@", [Couch parseData:data]);
                                    }];
        
       
        */
        
        
#pragma Update Schema and/or Send read exercises
        /*
                         Couch *couch =[[Couch alloc]init];
                            Schema *schema = [[Schema alloc] initMandag:@"Matte 08:00 Engelska 09:00" InitTisdag:@"fotboll 09:00" InitOnsdag:@"Halvdag" InitTorsdag:@"Fotboll" InitFredag:@"LEDIG TID" InitLasa:@"Sidor matte sidor 1-99"];
                                [couch reqToUrl:@"Http://localhost:5984/test/1B\?rev=1-7de9395203a958b9e94baaf0fcabb7c1" HttpMethod:@"PUT" body:[schema json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                                    NSLog(@"%@",response);
                                    NSLog(@"%@",error);
                                    NSLog(@"%@",data);
         
                                    NSLog(@"%@", [Couch parseData:data]);
                                    }];
        
        */
        
        /*
                            Couch *couch =[[Couch alloc]init];
                            Schema *schema = [[Schema alloc] initMandag:@"ENGELSKA 08:00 Engelska 09:00" InitTisdag:@"fotboll 09:00" InitOnsdag:@"Halvdag" InitTorsdag:@"Fotboll" InitFredag:@"Fotboll"];
                                [couch reqToUrl:@"Http://localhost:5984/lab/5A" HttpMethod:@"PUT" body:[schema json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                                            NSLog(@"%@",response);
                                            NSLog(@"%@",error);
                                            NSLog(@"%@",data);
            
                                            NSLog(@"%@", [Couch parseData:data]);
                                            }];
   
   */

        
#pragma Get student schema
     /*
        
                                __block id result1;
                                Couch *couch =[[Couch alloc] init];
    
                                [couch reqToUrl:@"Http://localhost:5984/test/1A" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                                //            NSLog(@"%@",response);
                                //            NSLog(@"Elev namn eller Schema stämmer inte%@",error);
                                //            NSLog(@"%@",data);
                                //            
                                //            NSLog(@"%@", [Couch parseData:data]);
                                            result1 = [Couch parseData:data];
                                            [couch reqToUrl:@"Http://localhost:5984/test/Jimmy" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                                                id result2 = [Couch parseData:data];
                                                    if ([[result1 valueForKey:@"_id"] isEqualTo:[result2 valueForKey:@"klass"]]) {
                                                NSLog(@"Här är ditt schema %@",result1);
                    
                                                } else {
                                                NSLog(@"Fel Student namn eller Schema, Var god försök igen");
                                                        }
                                                    }];
                                                }];
        
        */
        
#pragma Send message to Student 
        
                          /*                      __block id result1;
                                                Couch *couch =[[Couch alloc] init];
                                                [couch reqToUrl:@"Http://localhost:5984/test/1A" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                                                        //  NSLog(@"%@",error);
                                                        result1 = [Couch parseData:data];
                                                            [couch reqToUrl:@"Http://localhost:5984/test/Jimmy" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                                                                    id result2 = [Couch parseData:data];
                                                                if ([[result1 valueForKey:@"_id"] isEqualTo:[result2 valueForKey:@"klass"]]) {
                                                                        NSLog(@"HEJ NU MÅSTE DU LÄSA MERA ENGELSKA");
                    
                                                                        }else {
                                                                                NSLog(@"Fel Student namn eller Schema, Var god försök igen");
                                                                                    }
                                                                                }];
                                                                            }];

        
        
        */
        

    
        [[NSRunLoop currentRunLoop] run];
        
    }
    

    return 0;
}
