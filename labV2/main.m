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
#pragma mark Date
        NSDate *today = [NSDate date];
        NSDateFormatter *myFormatter = [[NSDateFormatter alloc] init];
        [myFormatter setDateFormat:@"EEEE"]; // day, like "Saturday"
        [myFormatter setDateFormat:@"c"]; // day number, like 7 for saturday
        NSString *dayOfWeek = [myFormatter stringFromDate:today];
        NSLog(@"%@",dayOfWeek);
        
#pragma mark Create a student

       
        NSLog(@"*************** ADD STUDENT ***************");
        Couch *couch =[[Couch alloc] init];
        Student *student = [[Student alloc] initWithName:@"Jimmy" lastName:@"Lidstrom" klass:@"1C"];
        if([student.firstName isEqualTo:@""] || [student.lastName isEqualTo:@""] || [student.klass isEqualTo:@""]){
            NSLog(@"Leave no blank spaces");
        } else {
            [couch reqToUrl:@"Http://localhost:5984/mongo3/jimmy" HttpMethod:@"PUT" body:[student json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
              
                
                NSLog(@"%@", [Couch parseData:data]);
                NSLog(@"***************  SUCCESS  ***************");
                
                     }];
                
        }
        
        
        
        
        
      
        
   
# pragma mark Create new DB class
// use your new class name id to add new scheme/student
       /*
        NSLog(@"*************** ADD NY KLASS TO DB ***************");
        Couch *couch =[[Couch alloc] init];
        [couch reqToUrl:@"Http://localhost:5984/klass1c" HttpMethod:@"PUT" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                
    NSLog(@"%@", [Couch parseData:data]);
                NSLog(@"***************  SUCCESS  new class added ***************");
                
            }];
        
*/
        
        
        
#pragma mark Create a Schema 
//dont forgot to use your new DB name in the URL.
//dont forget to add your new Scheme ID in the url.
        
        /*
        NSLog(@"*************** CREATE SCHEMA ***************");

    Couch *couch =[[Couch alloc]init];
    Schema *schema = [[Schema alloc] initMandag:@"Matte 08:00 Engelska 09:00" InitTisdag:@"asas" InitOnsdag:@"Halvdag" InitTorsdag:@"Fotboll" InitFredag:@"aldrig vila" InitLasa:@"as"];
        if([schema.Mandag isEqualTo:@""] || 
        [schema.Tisdag isEqualTo:@""] || 
        [schema.Onsdag isEqualTo:@""] || 
        [schema.Torsdag isEqualTo:@""] ||
        [schema.Fredag isEqualTo:@""]  
        ){
        NSLog(@"Leave no blank spaces");
        } else {
        [couch reqToUrl:@"Http://localhost:5984/klass1c/schema" HttpMethod:@"PUT" body:[schema json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
            NSLog(@"%@", [Couch parseData:data]);
            NSLog(@"***************  SUCCESS  ***************");

                                    }];
        
        }
        
        
  
*/
        
#pragma mark Update Schema and/or Send read exercises
 //
     
        /*
         NSLog(@"***************  UPDATE/READ EXERCISES  ***************");

    Couch *couch =[[Couch alloc]init];
    Schema *schema = [[Schema alloc] initMandag:@"Matte 08:00 Engelska 09:00" InitTisdag:@"fotboll 09:00" InitOnsdag:@"Halvdag" InitTorsdag:@"Fotboll" InitFredag:@"sola" InitLasa:@"Sidor matte sidor 1-92929292"];
        if([schema.Mandag isEqualTo:@""] || 
         [schema.Tisdag isEqualTo:@""] || 
         [schema.Onsdag isEqualTo:@""] || 
         [schema.Torsdag isEqualTo:@""] || 
         [schema.Fredag isEqualTo:@""] || 
         [schema.Lasa isEqualTo:@""]){
        NSLog(@"Leave no blank spaces");
        } else {
        [couch reqToUrl:@"Http://localhost:5984/mongo3/1C\?rev=3-61906cbb8629d6f71bdded32ad5cad6d" HttpMethod:@"PUT" body:[schema json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
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
       
        
#pragma mark Get student schema
     
        
       //  Http://localhost:5984/test/_design/project/_view/tisdag
       //Http://localhost:5984/mongo3/_design/project/_view/mandag
        /*
         NSLog(@"***************  GET STUDENTS SCHEMA  ***************");

    __block id result1;
    Couch *couch =[[Couch alloc] init];
    
    [couch reqToUrl:@"Http://localhost:5984/mongo3/1C" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
    result1 = [Couch parseData:data];
    [couch reqToUrl:@"Http://localhost:5984/mongo3/sebastian" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
    id result2 = [Couch parseData:data];
    if ([[result1 valueForKey:@"_id"] isEqualTo:[result2 valueForKey:@"klass"]]) {
    NSLog(@"Here is your schedule: %@",result1);
        
        NSLog(@"***************  Here is todays schedule  ***************");
        if([dayOfWeek isEqual:@"1"])
        {
            [couch reqToUrl:@"Http://localhost:5984/mongo3/_design/project/_view/mandag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@"%@",[Couch parseData:data]);
            }];
            
        }
        if([dayOfWeek isEqual:@"2"])
        {
            [couch reqToUrl:@"Http://localhost:5984/mongo3/_design/project/_view/tisdag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@"%@",[Couch parseData:data]);
            }];
            
        }
        if([dayOfWeek isEqual:@"3"])
        {
            [couch reqToUrl:@"Http://localhost:5984/mongo3/_design/project/_view/onsdag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@"%@",[Couch parseData:data]);
            }];
            
        }
        if([dayOfWeek isEqual:@"4"])
        {
            [couch reqToUrl:@"Http://localhost:5984/mongo3/_design/project/_view/torsdag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@"%@",[Couch parseData:data]);
            }];
            
        }
        if([dayOfWeek isEqual:@"5"])
        {
            [couch reqToUrl:@"Http://localhost:5984/mongo3/_design/project/_view/fredag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@"%@",[Couch parseData:data]);
            }];
            
        }
        if([dayOfWeek isEqualTo:@"6"] || [dayOfWeek isEqualTo:@"7"])
        {
            NSLog(@"It´s the weekend dude. have a beer");
                }
     
         }
    
            
        else {
            NSLog(@"Wrong Name or Class");
                                        }
                                                    }];
                                                }];
        
         
        */
        /*
         
        testar
    __block id result1;
    Couch *couch =[[Couch alloc] init];
         
    [couch reqToUrl:@"Http://localhost:5984/test/_design/project/_view/tisdag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSLog(@"%@",data);
        [couch reqToUrl:@"Http://localhost:5984/test/Jimmy" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
        id result2 = [Couch parseData:data];
        if ([[result1 valueForKey:@"id"] isEqualTo:[result2 valueForKey:@"id"]]) {
        NSLog(@"Här är ditt schema %@",result1);
        } else {
        NSLog(@"Fel Student namn eller Schema, Var god försök igen");
                }
            }];
         
                        NSLog(@"%@", [Couch parseData:data]);
            result1 = [Couch parseData:data];
      
        }];
         
         */
#pragma mark Send message to Student
                            
       /*
                           
        NSLog(@"***************  SEND MESSAGE  ***************");

        __block id result1;
        Couch *couch =[[Couch alloc] init];
        [couch reqToUrl:@"Http://localhost:5984/mongo3/1C" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
            result1 = [Couch parseData:data];
        [couch reqToUrl:@"Http://localhost:5984/mongo3/jim" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
            id result2 = [Couch parseData:data];
            if ([[result1 valueForKey:@"_id"] isEqualTo:[result2 valueForKey:@"klass"]]) {
                
            NSLog(@"HEJ NU MÅSTE DU LÄSA  MERA ENGELSKA");
                
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
        
        [couch reqToUrl:@"Http://localhost:5984/mongo3/_design/project/_view/mondag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
            //            NSLog(@"%@",response);
            //            NSLog(@"Elev namn eller Schema stämmer inte%@",error);
            //            NSLog(@"%@",data);
            //
            result1 = [Couch parseData:data];
            [couch reqToUrl:@"Http://localhost:5984/mongo3/_design/project/_view/firstname?key=jimmy" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                id result2 = [Couch parseData:data];
                if ([[result1 valueForKey:@"_id"] isEqualTo:[result2 valueForKey:@"firstName"]]) {
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
