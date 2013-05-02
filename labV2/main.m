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
        
        
        /////////// SKAPAR EN STUDENT!!!! ////////
    /*
        Couch *couch =[[Couch alloc] init];
        Student *student = [[Student alloc] initWithName:@"Sebastian" lastName:@"Hol" klass:@"1B"];
        [couch reqToUrl:@"Http://localhost:5984/test/Sebastian" HttpMethod:@"PUT" body:[student json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
            NSLog(@"%@",response);
            NSLog(@"%@",error);
            NSLog(@"%@",data);
        
            NSLog(@"%@", [Couch parseData:data]);
        }];
       
       */
        
        
        
         //////////// SKAPAR ETT SCHEMA!!!! ///////////////
        /*
        Couch *couch =[[Couch alloc]init];
              Schema *schema = [[Schema alloc] initMandag:@"Matte 08:00 Engelska 09:00" InitTisdag:@"Handboll 09:00" InitOnsdag:@"Halvdag" InitTorsdag:@"Fotboll" InitFredag:@"aldrig vila" InitLasa:@""];
        [couch reqToUrl:@"Http://localhost:5984/test/1B" HttpMethod:@"PUT" body:[schema json] onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
            NSLog(@"%@",response);
            NSLog(@"%@",error);
            NSLog(@"%@",data);
        
            NSLog(@"%@", [Couch parseData:data]);
        }];
        
       
        */
        
        
        
         ///////////////  UPPDATERA SCHEMA OCH/ELLER SKICKA LÄSA ANVISNINGAR ////////////////
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

     /*
        
        __block id result1;
        
        Couch *couch =[[Couch alloc] init];
        ////// SCHEMAT //////
        
        //// hämtar rätt Eleve till rätt Schema ///////
        
        [couch reqToUrl:@"Http://localhost:5984/test/1A" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
            
//            NSLog(@"%@",response);
//            NSLog(@"Elev namn eller Schema stämmer inte%@",error);
//            NSLog(@"%@",data);
//            
//            NSLog(@"%@", [Couch parseData:data]);
            result1 = [Couch parseData:data];
            //// ELEV /////
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
        
        
        //////////////// SKICKA MEDDELANDE TILL EN ELEVE MED RÄTT NAMN OCH KLASS ////////////////////
        
        __block id result1;
        
        Couch *couch =[[Couch alloc] init];
        ////Schema////
        [couch reqToUrl:@"Http://localhost:5984/test/1A" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
//                        NSLog(@"%@",error);
                    result1 = [Couch parseData:data];
            //// ELEV /////
            [couch reqToUrl:@"Http://localhost:5984/test/Jimmy" HttpMethod:@"GET" body:nil onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
                id result2 = [Couch parseData:data];
                if ([[result1 valueForKey:@"_id"] isEqualTo:[result2 valueForKey:@"klass"]]) {
                    NSLog(@"HEJ NU MÅSTE DU LÄSA MERA ENGELSKA");
                    
                }else {
                    NSLog(@"Fel Student namn eller Schema, Var god försök igen");
                }
            }];
        }];

        
        
        
        
        
        
        
        
        
        
        
        /*
Admin *admin = [[Admin alloc] init];
        /////// STUDENT ///////
        //lägger till en studen
        //        Student *student = [[Student alloc] init];
        // student arran
NSArray *students = @[student];
        
Skola *skola = [[Skola alloc] initWithStudents:students admin:admin];
        
        [skola addStudent:student];
        NSLog(@"%@ tillagd i Databasen",student);
        */
//for(Student *student in [skola studentsSorted])
//{
//NSLog(@"%@", student);
//        }
        
        
//       [skola readFromFile:@"/Users/sebastian_holmqvist/Desktop/dalskolan.json"];
      // [skola saveToFile:@"/Users/sebastian_holmqvist/Desktop/dalskolan.json"];  // AVBOCKA FÖR ATT SPARA NER
        

        
        //MESSAGE//
        //MESSAGE TO ALL
        
//[skola sendMessageToAll:@"HEJ ALLA ELEVER"];
        // MASSAGE TO STUDENT WITH ID
        
//for(Student *student in [skola studentsSorted]) {
//if([student.studentId isEqualToString:@"87863821-3AA6-45E3-BD15-9155F26DA4CF"]) {
//NSLog(@"kalle du måste läsa mera tv spels konskap!");
//            }
//        }
        
        
        

        /////// SCHEMA ///////
        
        
//Schema *schema1 = [[Schema alloc]initMandag:@"Matte" InitTisdag:@"Engelska" InitOnsdag:@"Idrott" InitTorsdag:@"Idrott" InitFredag:@"Tv-spel"];
        
//NSArray *scheman = @[schema1];
//        
//Skola *skola =[[Skola alloc] initWithScheman:scheman admin:admin];
//        
//[skola saveToFileSchema:@"/Users/sebastian_holmqvist/Desktop/schema.json"];
//[skola readFromFileSchema:@"/Users/sebastian_holmqvist/Desktop/schema.json"];
//
//for (Schema *schema in [skola schemaSorted]) {
//            NSLog(@"%@",schema);
//        }
//        
 
    
        [[NSRunLoop currentRunLoop] run];
        
    }
    

    return 0;
}
