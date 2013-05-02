

#import "Skola.h"
#import "Student.h"
#import "Student+Json.h"
#import "Schema.h"
#import "Schema+Json.h"

NSString * const studentToMarkKey = @"studentToMarkKey";
NSString * const schemaToMarkKey = @"schemaToMarkKey";

NSString * const studentAddedNotification =@"studentAddedNotification";
NSString * const schemaAddedNotification =@"schemaAddedNotification";

NSString * const savedStateFileName = @"/Users/sebastian_holmqvist/Desktop/dalskolan.json";
NSString * const savedStateFileNameSchema = @"/Users/sebastian_holmqvist/Desktop/dalskolan.json";


static NSString * const studentKey = @"student_key";
static NSString * const schemaKey = @"schema_key";

@implementation Skola
{
    NSDictionary *students;
    NSSortDescriptor *studentsSortDescriptor;
    NSDictionary *scheman;
    NSSortDescriptor *schemanSortDescriptor;
    
}

-(id) init
{
    return [self initWithStudents:@[]];
}

-(id) initWithStudents:(NSArray *)studentsToAdd
{
    return [self initWithStudents:studentsToAdd admin:nil];
}

-(id) initWithStudents:(NSArray *)studentsToAdd admin:(Admin *)admin
{
    self = [super init];
    
    if(self) {
        students = @{studentKey: [[NSMutableSet alloc] init]};
        
        studentsSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"lastName" ascending:YES];
        
        if(admin){
            [[NSNotificationCenter defaultCenter] addObserver:admin
                                                     selector:@selector(setStudentId:)
                                                         name:studentAddedNotification
                                                       object:self];
        }
        for(Student *student in studentsToAdd) {
            [self addStudent:student];
        }
        [self readFromFile:savedStateFileName];
    }
    return self;
}

-(void) addStudent:(Student*) student
{
    if(student){
        [students[studentKey] addObject:student];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:studentAddedNotification
                                                        object:self
                                                      userInfo:@{studentToMarkKey: student}];
}

-(void) removeStudent:(Student *)student
{
    if(student){
        [students[studentKey] removeObject:student];
    }
    
}

-(void) showStudentName
{
    for(Student *student in [self allStudents]) {
        [student ShowStudent];
    }
}

-(NSArray*) studentsSorted
{
    return [[self allStudents] sortedArrayUsingDescriptors:@[studentsSortDescriptor]];
}

-(NSSet*) filterStudentsUsingPredicate:(NSPredicate*) predicate
{
    return [[self allStudents] filteredSetUsingPredicate:predicate];
}

-(void) saveToFile:(NSString*) fileName
{
    NSDictionary *skolaAsJson = @{@"students" : [self serializeCollectionToJson:[self allStudents]]};
    
    NSData *skolaAsData = [NSJSONSerialization dataWithJSONObject:skolaAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    [skolaAsData writeToFile:fileName atomically:YES];
}

-(void)readFromFile:(NSString *)fileName
{
    NSData *skolaAsData = [NSData dataWithContentsOfFile:fileName];
    
    if(skolaAsData){
        NSDictionary *skolaAsJson = [NSJSONSerialization JSONObjectWithData: skolaAsData options:0 error:NULL];
        
        for(NSDictionary *student in skolaAsJson[@"students"]){
            [self addStudent:[Student studentFromJson:student]];
        }
        
    }
}
-(NSArray*) serializeCollectionToJson:(id) objects
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for(id<JsonFormat> object in objects){
        [result addObject:[object jsonValue]];
    }
    
    return result;
}

-(NSSet*) allStudents
{
    
    return [students[studentKey] setByAddingObjectsFromSet:students[studentKey]];
}




///////////////// schema /////////


-(id) initSchema
{
    return [self initWithScheman:@[]];
}

-(id) initWithScheman:(NSArray *)schemanToAdd
{
    return [self initWithScheman:schemanToAdd admin:nil];
}

-(id) initWithScheman:(NSArray *)schemaToAdd admin:(Admin *)admin
{
    self = [super init];
    
    if(self) {
        scheman = @{schemaKey: [[NSMutableSet alloc] init]};
        
        schemanSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"Day" ascending:YES];
        
        if(admin){
            [[NSNotificationCenter defaultCenter] addObserver:admin
                                                     selector:@selector(setSchemanId:)
                                                         name:schemaAddedNotification
                                                       object:self];
        }
        for(Schema *schema in schemaToAdd) {
            [self addSchema:schema];
        }
        [self readFromFileSchema:savedStateFileNameSchema];
    }
    return self;
}

-(void) addSchema:(Schema *)schema
{
    if(schema){
        [scheman[schemaKey] addObject:schema];
    }
//    [[NSNotificationCenter defaultCenter] postNotificationName:schemaAddedNotification
//                                                        object:self
//                                                      userInfo:@{schemaToMarkKey: schema}];
}

-(void) removeSchema:(Schema *)schema
{
    if(schema){
        [scheman[schemaKey] removeObject:schema];
    }
    
}


-(void) showScheman:(Schema *)schema
{
    for(Schema *schema in [self allSchema]) {
        [schema ShowSchema];
    }
}

-(NSArray*) schemaSorted
{
    return [[self allSchema] sortedArrayUsingDescriptors:@[schemanSortDescriptor]];
}

-(NSSet*) filterSchemanUsingPredicate:(NSPredicate*) predicate
{
    return [[self allSchema] filteredSetUsingPredicate:predicate];
}

-(void) saveToFileSchema:(NSString*) fileNameSchema
{
    NSDictionary *skolaAsJson = @{@"Scheman" : [self serializeCollectionToJson:[self allSchema]]};
    
    NSData *skolaAsData = [NSJSONSerialization dataWithJSONObject:skolaAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    [skolaAsData writeToFile:fileNameSchema atomically:YES];
}

-(void)readFromFileSchema:(NSString *)fileNameSchema
{
    NSData *skolaAsData = [NSData dataWithContentsOfFile:fileNameSchema];
    
    if(skolaAsData){
        NSDictionary *skolaAsJson = [NSJSONSerialization JSONObjectWithData: skolaAsData options:0 error:NULL];
        
        for(NSDictionary *schema in skolaAsJson[@"scheman"]){
            [self addSchema:[Schema dayFromJson:schema]];
        }
        
    }
}


-(NSSet*) allSchema
{
    
    return [scheman[schemaKey] setByAddingObjectsFromSet:scheman[schemaKey]];
}


-(void) sendMessageToAll:(NSString*) messageToAll
{
    for(Student *student in students[studentKey]){
        [student getMessage:messageToAll];
    }
}

@end
