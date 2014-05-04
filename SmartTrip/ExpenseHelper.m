#import "ExpenseHelper.h"
#import "EvernoteSDK.h"
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequest.h"

@implementation ExpenseHelper

+ (id)sharedEverNoteHelper {
    static ExpenseHelper *EverNoteHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        EverNoteHelper = [[self alloc] init];
    });
    return EverNoteHelper;
}

- (id)init {
    if (self = [super init]) {
       
    }
    return self;
}

- (void)getMyTrips:(ENTripsCompletionHandler)completion {
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"https://www.concursolutions.com/api/travel/trip/v1.1"]];
    [request addRequestHeader:@"Authorization" value:@"OAuth DAfaWYrNtoM77hBf+Zy4NaWksPw="];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        NSData *responseData = [[NSMutableData alloc] initWithData:[request responseData]];
        completion(error, [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error]);
    }
    completion(error, nil);
}

- (void)createTrip:(TripDetails *)detail completion:(ENCompletionHandler)completion {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-ddTHH:mm:ss"];
    NSString *xml = [NSString stringWithFormat:@"<?xml version=\"1.0\"?> <Itinerary xmlns=\"http://www.concursolutions.com/api/travel/trip/2010/06\"> <TripName>%@</TripName> <TripStatus>0</TripStatus><StartDateLocal>%@</StartDateLocal> <EndDateLocal>%@</EndDateLocal> <Bookings> <Booking> <RecordLocator>%@</RecordLocator> <BookingSource>Sample Itin for Disrupt</BookingSource> <DateBookedLocal>2014-04-30T03:47:14</DateBookedLocal> </Booking> </Bookings> </Itinerary>", detail.destination, [dateFormatter stringFromDate:detail.tripStart], [dateFormatter stringFromDate:[detail.tripStart dateByAddingTimeInterval:60*60*24*[detail.tripLength intValue]]], detail.UUID];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"https://www.concursolutions.com/api/travel/trip/v1.1"]];
    [request addRequestHeader:@"Content-Type" value:@"application/xml"];
    [request addRequestHeader:@"Authorization" value:@"OAuth DAfaWYrNtoM77hBf+Zy4NaWksPw="];
    [request setPostBody: [NSMutableData dataWithData:[xml dataUsingEncoding:NSUTF8StringEncoding]]];
    [request startSynchronous];
    NSError *error = [request error];
    completion(error);
}

- (void)addExpense:(Expense *)expense fortrip:(TripDetails *)trip completion:(ENCompletionHandler)completion {
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"https://www.concursolutions.com/api/expense/expensereport/v1.0/quickexpense"]];
    [request addRequestHeader:@"Content-Type" value:@"application/xml"];
    [request addRequestHeader:@"Authorization" value:@"OAuth DAfaWYrNtoM77hBf+Zy4NaWksPw="];
    [request setPostBody: [NSMutableData dataWithData:[[expense toXml] dataUsingEncoding:NSUTF8StringEncoding]]];
    [request startSynchronous];
    NSError *error = [request error];
    completion(error);
}

- (void)getExpenses:(TripDetails *)trip completion:(ENExpenseCompletionHandler)completion {
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"https://www.concursolutions.com/api/expense/expensereport/v1.0/quickexpense"]];
    [request addRequestHeader:@"Authorization" value:@"OAuth DAfaWYrNtoM77hBf+Zy4NaWksPw="];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        NSData *responseData = [[NSMutableData alloc] initWithData:[request responseData]];
        completion(error, [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error]);
    }
    completion(error, nil);
}

- (void)addTripToNote:(TripDetails *)trip completion:(ENCompletionHandler)completion {
    
    NSString *noteContent = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                             "<!DOCTYPE en-note SYSTEM \"http://xml.evernote.com/pub/enml2.dtd\">"
                             "<en-note style=\"word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;\">"
                             "Total Budget: $%d"
                             "</en-note>", [trip.budget.totalBudget intValue]];
    
    EDAMNote *newNote = [[EDAMNote alloc] initWithGuid:nil title:[trip destination] content:noteContent contentHash:nil contentLength:noteContent.length created:0 updated:0 deleted:0 active:YES updateSequenceNum:0 notebookGuid:nil tagGuids:nil resources:nil attributes:nil tagNames:@[trip.UUID]];
    [[EvernoteNoteStore noteStore] createNote:newNote success:^(EDAMNote *note) {
        completion(nil);
    } failure:^(NSError *error) {
        NSLog(@"ERRR %@", error);
        completion(error);
    }];
}

- (void)addExpenseToNote:(Expense *)expense forTrip:(NSString *)tripUUID completion:(ENCompletionHandler)completion {

    
}

- (void)dealloc {
    
}

@end
