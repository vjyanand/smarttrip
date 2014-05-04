#import "ExpenseHelper.h"
#import <ENSDK/ENSDK.h>
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequest.h"

NSString * const ConcurEndPoint = @"https://www.concursolutions.com/api/travel/trip/v1.1";

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
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:ConcurEndPoint]];
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
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:ConcurEndPoint]];
    [request addRequestHeader:@"Content-Type" value:@"application/xml"];
    [request addRequestHeader:@"Authorization" value:@"OAuth DAfaWYrNtoM77hBf+Zy4NaWksPw="];
    [request setPostBody: [NSMutableData dataWithData:[xml dataUsingEncoding:NSUTF8StringEncoding]]];
    [request startSynchronous];
    NSError *error = [request error];
    completion(error);
    
    
}


- (void)addNote:(Expense *)expense forTrip:(NSString *)tripUUID completion:(ENCompletionHandler)completion {
    
}

- (void)dealloc {
    
}

@end
