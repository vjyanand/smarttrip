
#import <Foundation/Foundation.h>
#import "Expense.h"
#import "TripDetails.h"

typedef void (^ENCompletionHandler)(NSError * error);
typedef void (^ENTripsCompletionHandler)(NSError * error, NSArray *trips);

@interface ExpenseHelper : NSObject

+ (id)sharedEverNoteHelper;

- (void)createTrip:(TripDetails *)detail completion:(ENCompletionHandler)completion;

- (void)addExpense:(Expense *)expense fortrip:(TripDetails *)trip completion:(ENCompletionHandler)completion;

- (void)getMyTrips:(ENTripsCompletionHandler)completion;

-(void)getExpenses:(TripDetails *)trip completion:(ENTripsCompletionHandler)completion;

- (void)addTripToNote:(TripDetails *)trip completion:(ENCompletionHandler)completion;
@end
