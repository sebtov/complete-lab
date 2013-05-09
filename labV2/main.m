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

        /*
        NSLog(@"*************** ADD STUDENT ***************");
        Couch *couch =[[Couch alloc] init];
        Student *student = [[Student alloc] initWithName:@"as" lastName:@"1" klass:@"1"];
        if([student.firstName isEqualTo:@""] || [student.lastName isEqualTo:@""] || [student.klass isEqualTo:@""]){
            NSLog(@"Leave no blank spaces");
        } else {
            [couch reqToUrl:@"Http://localhost:5984/test/hejhejahe1j" HttpMethod:@"PUT" body:[student json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
              
                
                NSLog(@"%@", [Couch parseData:data]);
                NSLog(@"***************  SUCCESS  ***************");
                
                     }];
                
        }
        
   */
   
       
       
        
        
        
#pragma Create a Schema 
             /*
              NSLog(@"*************** CREATE SCHEMA ***************");

                    Couch *couch =[[Couch alloc]init];
                        Schema *schema = [[Schema alloc] initMandag:@"Matte 08:00 Engelska 09:00" InitTisdag:@"as" InitOnsdag:@"Halvdag" InitTorsdag:@"Fotboll" InitFredag:@"aldrig vila" InitLasa:@"as"];
        if([schema.Mandag isEqualTo:@""] || [schema.Tisdag isEqualTo:@""] || [schema.Onsdag isEqualTo:@""] || [schema.Torsdag isEqualTo:@""] || [schema.Fredag isEqualTo:@""] || [schema.Lasa isEqualTo:@""]){
            NSLog(@"Leave no blank spaces");
        } else {
                  [couch reqToUrl:@"Http://localhost:5984/test/11aaC" HttpMethod:@"PUT" body:[schema json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                                
        
                                    NSLog(@"%@", [Couch parseData:data]);
              NSLog(@"***************  SUCCESS  ***************");

                                    }];
        
        }
        
        */
        
#pragma Update Schema and/or Send read exercises
        
        /*
         NSLog(@"***************  UPDATE/READ EXERCISES  ***************");

                         Couch *couch =[[Couch alloc]init];
                            Schema *schema = [[Schema alloc] initMandag:@"Matte 08:00 Engelska 09:00" InitTisdag:@"fotboll 09:00" InitOnsdag:@"Halvdag" InitTorsdag:@"Fotboll" InitFredag:@"sola" InitLasa:@"Sidor matte sidor 1-99"];
        if([schema.Mandag isEqualTo:@""] || [schema.Tisdag isEqualTo:@""] || [schema.Onsdag isEqualTo:@""] || [schema.Torsdag isEqualTo:@""] || [schema.Fredag isEqualTo:@""] || [schema.Lasa isEqualTo:@""]){
            NSLog(@"Leave no blank spaces");
        } else {
                                [couch reqToUrl:@"Http://localhost:5984/test/1B\?rev=2-938e6ce316f815ea0d0514181109501b" HttpMethod:@"PUT" body:[schema json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
         
                                    NSLog(@"%@", [Couch parseData:data]);
                    NSLog(@"***************  SUCCESS  ***************");

                                    }];
        
        }
        
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
         Http://localhost:5984/test/_design/project/_view/tisdag
         
         
         NSLog(@"***************  GET STUDENTS SCHEMA  ***************");

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
                                        NSLog(@"***************  SUCCESS  ***************");

         
                                                } else {
                                                NSLog(@"Fel Student namn eller Schema, Var god försök igen");
                                                        }
                                                    }];
                                                }];
        */
        
        /*
         
        testar
        __block id result1;

        Couch *couch =[[Couch alloc] init];

        [couch reqToUrl:@"Http://localhost:5984/test/_design/project/_view/tisdag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
            //            NSLog(@"%@",response);
            //            NSLog(@"Elev namn eller Schema stämmer inte%@",error);
                        NSLog(@"%@",data);
            [couch reqToUrl:@"Http://localhost:5984/test/Jimmy" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                id result2 = [Couch parseData:data];
                if ([[result1 valueForKey:@"id"] isEqualTo:[result2 valueForKey:@"id"]]) {
                    NSLog(@"Här är ditt schema %@",result1);
                    
                } else {
                    NSLog(@"Fel Student namn eller Schema, Var god försök igen");
                }
            }];
            //
                        NSLog(@"%@", [Couch parseData:data]);
            result1 = [Couch parseData:data];
      
        }];
         
         */
#pragma Send message to Student
                            
                          /*                      
                           
                           NSLog(@"***************  SEND MESSAGE  ***************");

                                                __block id result1;
                                                Couch *couch =[[Couch alloc] init];
                                                [couch reqToUrl:@"Http://localhost:5984/test/1A" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                                                        //  NSLog(@"%@",error);
                                                        result1 = [Couch parseData:data];
                                                            [couch reqToUrl:@"Http://localhost:5984/test/Jimmy" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                                                                    id result2 = [Couch parseData:data];
                                                                if ([[result1 valueForKey:@"_id"] isEqualTo:[result2 valueForKey:@"klass"]]) {
                                                                        NSLog(@"HEJ NU MÅSTE DU LÄSA        MERA ENGELSKA");
                           NSLog(@"***************  SUCCESS  ***************");

                    
                                                                        }else {
                                                                                NSLog(@"Fel Student namn eller Schema, Var god försök igen");
                                                                                    }
                                                                                }];
                                                                            }];

        
        
        */
        /*
        __block id result1;
        Couch *couch =[[Couch alloc] init];
        
        [couch reqToUrl:@"Http://localhost:5984/test/_design/project/_view/mondag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
            //            NSLog(@"%@",response);
            //            NSLog(@"Elev namn eller Schema stämmer inte%@",error);
            //            NSLog(@"%@",data);
            //
                        NSLog(@"%@", [Couch parseData:data]);
            result1 = [Couch parseData:data];
            [couch reqToUrl:@"Http://localhost:5984/test/_design/project/_view/id?key=Sebastian" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                id result2 = [Couch parseData:data];
                if ([[result1 valueForKey:@"_id"] isEqualTo:[result2 valueForKey:@"_id"]]) {
                    NSLog(@"Här är ditt schema %@",result1);
                    
                } else {
                    NSLog(@"Fel Student namn eller Schema, Var god försök igen");
                }
            }];
        }];
*/
    
        [[NSRunLoop currentRunLoop] run];
        
    }
    

    return 0;
}
