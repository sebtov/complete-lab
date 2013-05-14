///// SEBASTIAN & JIMMY

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Admin.h"
#import "Schema.h"
#import "SendMessage.h"
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

       /*
        NSLog(@"*************** ADD STUDENT ***************");
        Couch *couch =[[Couch alloc] init];
        Student *student = [[Student alloc] initWithName:@"Jimmy" lastName:@"Lidstrom" klass:@"1C"];
        if([student.firstName isEqualTo:@""] || [student.lastName isEqualTo:@""] || [student.klass isEqualTo:@""]){
            NSLog(@"Leave no blank spaces");
        } else {
            [couch reqToUrl:@"http://seb.iriscouch.com/school/jimmy" HttpMethod:@"PUT" body:[student json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
              
                
                NSLog(@"%@", [Couch parseData:data]);
                NSLog(@"***************  SUCCESS  ***************");
                
                     }];
                
        }
        
        */
       
#pragma mark Send Message to Student
 //USE studentId to send to rigth student
       /*
        NSLog(@"***************  SEND MESSEGE  ***************");

        Couch *couch =[[Couch alloc] init];
            SendMessage *message =[[SendMessage alloc]initWithMessage:@"hejsan jimmy, gul bil" StudentId:@"86742F93-9CE5-4187-B89F-EB5C9EF4A35F"];{
        
            [couch reqToUrl:@"http://seb.iriscouch.com/messages" HttpMethod:@"POST" body:[message json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@"%@", [Couch parseData:data]);
                NSLog(@"***************  SUCCESS  ***************");
                
            }];
            
        }
        
*/
#pragma mark Send Message to All
        //USE messageToAll to send to all students
        
        /*
        
         NSLog(@"***************  SEND MESSEGE  ***************");
         
         Couch *couch =[[Couch alloc] init];
         SendMessage *message =[[SendMessage alloc]initWithMessage:@"hejsan alla barn, rod bil" StudentId:@"messageToAll"];{
         
         [couch reqToUrl:@"http://seb.iriscouch.com/messages" HttpMethod:@"POST" body:[message json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
         NSLog(@"%@", [Couch parseData:data]);
         NSLog(@"***************  SUCCESS  ***************");
         
         }];
         
         }
         
         */
        
#pragma mark Get Message for Student
      /*
  
        __block id result1;
        Couch *couch =[[Couch alloc] init];
        
        [couch reqToUrl:@"Http://localhost:5984/message/_design/project/_view/student?key=%2286742F93-9CE5-4187-B89F-EB5C9EF4A35F%22" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
            NSLog(@"here is all your messages: %@",[Couch parseData:data]);
            
        }];
//            result1 = [Couch parseData:data];
//            [couch reqToUrl:@"Http://localhost:5984/mongo3/_design/project/_view/id" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
//                NSLog(@"%@",[Couch parseData:data]);
//                id result2 = [Couch parseData:data];
//                if ([[result1 valueForKey:@"StudentId"] isEqualTo:[result2 valueForKey:@"studentId"]]) {
//                    
//                } else {
//                    NSLog(@"Fel Student namn eller Schema, Var god försök igen");
//                }
//            }];

        
        */
        
#pragma mark Get Messeges for All
        
        /*
        Couch *couch =[[Couch alloc] init];
        
        [couch reqToUrl:@"http://seb.iriscouch.com/messages/_design/project/_view/toall" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
            NSLog(@"here is all  messages: %@",[Couch parseData:data]);
            
        }];
      
         */
   
# pragma mark Create new DB class
// use your new class name id to add new scheme/student
       /*
        NSLog(@"*************** ADD NY KLASS TO DB ***************");
        Couch *couch =[[Couch alloc] init];
        [couch reqToUrl:@"http://seb.iriscouch.com/school2" HttpMethod:@"PUT" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                
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
        [couch reqToUrl:@"http://seb.iriscouch.com/school/1C" HttpMethod:@"PUT" body:[schema json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
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
    Schema *schema = [[Schema alloc] initMandag:@"softbal 08:00 Engelska 09:00" InitTisdag:@"fotboll 09:00" InitOnsdag:@"Halvdag" InitTorsdag:@"Fotboll" InitFredag:@"sola" InitLasa:@"Sidor matte sidor 1-92929292"];
        if([schema.Mandag isEqualTo:@""] || 
         [schema.Tisdag isEqualTo:@""] || 
         [schema.Onsdag isEqualTo:@""] || 
         [schema.Torsdag isEqualTo:@""] || 
         [schema.Fredag isEqualTo:@""] || 
         [schema.Lasa isEqualTo:@""]){
        NSLog(@"Leave no blank spaces");
        } else {
        [couch reqToUrl:@"http://seb.iriscouch.com/school/1C\?rev=3-1006ab14fcf88cf854d6743530bcc699" HttpMethod:@"PUT" body:[schema json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
         NSLog(@"%@", [Couch parseData:data]);
                    NSLog(@"***************  SUCCESS  ***************");
                }];
         }
        
        
        */
   
       
        
#pragma mark Get student schema
     
        

        
        /*
         NSLog(@"***************  GET STUDENTS SCHEMA  ***************");

    __block id result1;
    Couch *couch =[[Couch alloc] init];
    
    [couch reqToUrl:@"http://seb.iriscouch.com/school/1C" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
    result1 = [Couch parseData:data];
    [couch reqToUrl:@"http://seb.iriscouch.com/school/sebastian" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
    id result2 = [Couch parseData:data];
    if ([[result1 valueForKey:@"_id"] isEqualTo:[result2 valueForKey:@"klass"]]) {
    NSLog(@"Here is your schedule: %@",result1);
        
        NSLog(@"***************  Here is todays schedule  ***************");
        if([dayOfWeek isEqual:@"1"])
        {
            [couch reqToUrl:@"http://seb.iriscouch.com/school/_design/project/_view/mandag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@"%@",[Couch parseData:data]);
            }];
            
        }
        if([dayOfWeek isEqual:@"2"])
        {
            [couch reqToUrl:@"http://seb.iriscouch.com/school/_design/project/_view/tisdag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@"%@",[Couch parseData:data]);
            }];
            
        }
        if([dayOfWeek isEqual:@"3"])
        {
            [couch reqToUrl:@"http://seb.iriscouch.com/school/_design/project/_view/onsdag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@"%@",[Couch parseData:data]);
            }];
            
        }
        if([dayOfWeek isEqual:@"4"])
        {
            [couch reqToUrl:@"http://seb.iriscouch.com/school/_design/project/_view/torsdag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@"%@",[Couch parseData:data]);
            }];
            
        }
        if([dayOfWeek isEqual:@"5"])
        {
            [couch reqToUrl:@"http://seb.iriscouch.com/school/_design/project/_view/fredag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
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
