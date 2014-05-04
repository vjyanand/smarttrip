#import "ExpenseHelper.h"
#import <ENSDK/ENSDK.h>

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

- (void)createTrip:(TripDetails *)detail completion:(ENCompletionHandler)completion {
    
    NSString *xml = [NSString stringWithFormat:@"<?xml version=\"1.0\"?> <Itinerary xmlns=\"http://www.concursolutions.com/api/travel/trip/2010/06\"> <TripName>%@</TripName> <TravelRequestId>%@</TravelRequestId> <Bookings> <Booking> <RecordLocator>Air Locator</RecordLocator> <BookingSource>Sample Itin for Disrupt</BookingSource> <DateBookedLocal>2014-04-30T03:47:14</DateBookedLocal></Booking> </Bookings> </Itinerary>", detail.destination, detail.UUID];
    
    
}

- (void)addNote:(Expense *)expense forTrip:(NSString *)tripUUID completion:(ENCompletionHandler)completion {
    
}

- (void)dealloc {
    
}

@end
