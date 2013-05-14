                                        ///// SEBASTIAN & JIMMY

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Schema.h"
#import "SendMessage.h"
#import "Couch.h"
#import "Read.h"
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
        Student *student = [[Student alloc] initWithName:@"Olle" lastName:@"Master" klass:@"1C"];
        if([student.firstName isEqualTo:@""] || [student.lastName isEqualTo:@""] || [student.klass isEqualTo:@""]){
            NSLog(@"Leave no blank spaces");
        } else {
            [couch reqToUrl:@"http://seb.iriscouch.com/school/olle" HttpMethod:@"PUT" body:[student json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
              
                
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
            SendMessage *message =[[SendMessage alloc]initWithMessage:@"hejsan jimmy, bla bil" StudentId:@"86742F93-9CE5-4187-B89F-EB5C9EF4A35F"];{
        
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
         SendMessage *message =[[SendMessage alloc]initWithMessage:@"hejsan alla barn, glad jul" StudentId:@"messageToAll"];{
         
         [couch reqToUrl:@"http://seb.iriscouch.com/messages" HttpMethod:@"POST" body:[message json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
         NSLog(@"%@", [Couch parseData:data]);
         NSLog(@"***************  SUCCESS  ***************");
         
         }];
         
         }
       */  
         
        
#pragma mark Get Message for Student
// Use studentId to get your massage.
        /*
        Couch *couch =[[Couch alloc] init];
        [couch reqToUrl:@"http://seb.iriscouch.com/messages/_design/project/_view/student?key=%2286742F93-9CE5-4187-B89F-EB5C9EF4A35F%22" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
            NSLog(@"here is all your messages: %@",[Couch parseData:data]);
            
        }];

       */
        
        
#pragma mark Get Messeges for All
 //We use view "toall" and this one is opend for every student.
        
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
    Schema *schema = [[Schema alloc] initMandag:@"Matte 08:00 Engelska 09:00" InitTisdag:@"asas" InitOnsdag:@"Halvdag" InitTorsdag:@"Fotboll" InitFredag:@"aldrig vila"];
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

        
#pragma mark Update Schema
 //
     /*
        
         NSLog(@"***************  UPDATE/READ EXERCISES  ***************");

    Couch *couch =[[Couch alloc]init];
    Schema *schema = [[Schema alloc] initMandag:@"softbal 08:00 Engelska 09:00" InitTisdag:@"fotboll 09:00" InitOnsdag:@"Halvdag" InitTorsdag:@"Fotboll" InitFredag:@"sola"];
        if([schema.Mandag isEqualTo:@""] || 
         [schema.Tisdag isEqualTo:@""] || 
         [schema.Onsdag isEqualTo:@""] || 
         [schema.Torsdag isEqualTo:@""] || 
         [schema.Fredag isEqualTo:@""])
        {
        NSLog(@"Leave no blank spaces");
        } else {
        [couch reqToUrl:@"http://seb.iriscouch.com/school/1C\?rev=1-9b343770712e97433c2ed84d2cdeaba6" HttpMethod:@"PUT" body:[schema json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
         NSLog(@"%@", [Couch parseData:data]);
                    NSLog(@"***************  SUCCESS  ***************");
                }];
         }
        
        */
#pragma mark Add reading homework
        /*
         NSLog(@"*************** ADD HOMEWORK ***************");
         Couch *couch =[[Couch alloc] init];
         Read *read = [[Read alloc]initWithReadMonday:@"Matteboken 1-4" readTuesday:@"Engelska boken 1-7" readWednesday:@"Spanska boken 1-99" readThursday:@"blank" readFriday:@"blank" readWeekend:@"blank" classId:@"1C"];
         [couch reqToUrl:@"http://seb.iriscouch.com/school/reading" HttpMethod:@"PUT" body:[read json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
         NSLog(@"%@", [Couch parseData:data]);
         NSLog(@"***************  SUCCESS  ***************");
         
         }];
         */
        
#pragma mark Update Homework
        
         /*
         NSLog(@"***************  UPDATE HOMEWORK ***************");
         Couch *couch =[[Couch alloc] init];
         Read *read = [[Read alloc]initWithReadMonday:@"Matteboken 1-111" readTuesday:@"Engelska boken 1-7" readWednesday:@"Spanska boken 1-99" readThursday:@"blank" readFriday:@"blank" readWeekend:@"blank" classId:@"1C"];
         [couch reqToUrl:@"http://seb.iriscouch.com/school/reading?rev=3-33e0dfcd35e65fa015d43a4437d3f7d1" HttpMethod:@"PUT" body:[read json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
         NSLog(@"%@", [Couch parseData:data]);
         NSLog(@"***************  SUCCESS  ***************");
         
         }];
       */
        
#pragma mark Get student schema
     
        
/*
        
        
         NSLog(@"*************** START GET STUDENTS SCHEMA  ***************");

    __block id result1;
    Couch *couch =[[Couch alloc] init];
    
            [couch reqToUrl:@"http://seb.iriscouch.com/school/1C" HttpMethod:@"GET" body:nil    onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                result1 = [Couch parseData:data];
            [couch reqToUrl:@"http://seb.iriscouch.com/school/sebastian" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                id result2 = [Couch parseData:data];
                if ([[result1 valueForKey:@"_id"] isEqualTo:[result2 valueForKey:@"klass"]]) {
                    NSLog(@"*************** Here is your schedul e***************");
                    NSLog(@"%@ ",result1);
        

        if([dayOfWeek isEqual:@"1"])
        {
            [couch reqToUrl:@"http://seb.iriscouch.com/school/_design/project/_view/mandag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@"***************  Here is todays schedule  ***************");

                NSLog(@"%@",[Couch parseData:data]);
            }];
            [couch reqToUrl:@"http://seb.iriscouch.com/school//_design/project/_view/readmonday" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@" *************** Here is Your Readin Exercises: *************** ");
                NSLog(@"%@",[Couch parseData:data]);
            }];

        }
        if([dayOfWeek isEqual:@"2"])
        {
            [couch reqToUrl:@"http://seb.iriscouch.com/school/_design/project/_view/tisdag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@"***************  Here is todays schedule  ***************");

                NSLog(@"%@",[Couch parseData:data]);
            }];
            [couch reqToUrl:@"http://seb.iriscouch.com/school//_design/project/_view/readtuesday" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@" *************** Here is Your Readin Exercises: *************** ");
                NSLog(@"%@",[Couch parseData:data]);
            }];
            
        }
        if([dayOfWeek isEqual:@"3"])
        {
            [couch reqToUrl:@"http://seb.iriscouch.com/school/_design/project/_view/onsdag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@"%@",[Couch parseData:data]);
            }];
            [couch reqToUrl:@"http://seb.iriscouch.com/school//_design/project/_view/readwednesday" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@" *************** Here is Your Readin Exercises: *************** ");
                NSLog(@"%@",[Couch parseData:data]);
            }];
            
        }
        if([dayOfWeek isEqual:@"4"])
        {
            [couch reqToUrl:@"http://seb.iriscouch.com/school/_design/project/_view/torsdag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@"%@",[Couch parseData:data]);
            }];
            [couch reqToUrl:@"http://seb.iriscouch.com/school//_design/project/_view/readthursday" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@" *************** Here is Your Readin Exercises: *************** ");
                NSLog(@"%@",[Couch parseData:data]);
            }];
            
        }
        if([dayOfWeek isEqual:@"5"])
        {
            [couch reqToUrl:@"http://seb.iriscouch.com/school/_design/project/_view/fredag" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@"%@",[Couch parseData:data]);
            }];
            [couch reqToUrl:@"http://seb.iriscouch.com/school//_design/project/_view/readfriday" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@" *************** Here is Your Readin Exercises: *************** ");
                NSLog(@"%@",[Couch parseData:data]);
            }];
        }
        if([dayOfWeek isEqualTo:@"6"] || [dayOfWeek isEqualTo:@"7"])
        {
            
            NSLog(@"It´s the weekend dude. have a beer");
            [couch reqToUrl:@"http://seb.iriscouch.com/school//_design/project/_view/readweekend" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                NSLog(@" *************** Here is Your Readin Exercises: *************** ");
                NSLog(@"%@",[Couch parseData:data]);
            }];
            
            
                }
     
         }else
         {
            NSLog(@"Wrong Name or Class");
                                        }
                                                    }];
                                                }];
         
        
         */
        

    
    
        [[NSRunLoop currentRunLoop] run];
        
    }


    return 0;
}
