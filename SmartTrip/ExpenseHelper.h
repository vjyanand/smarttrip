
#import <Foundation/Foundation.h>
#import "Expense.h"
#import "TripDetails.h"

typedef void (^ENCompletionHandler)(NSError * error);
typedef void (^ENTripsCompletionHandler)(NSError * error, NSArray *trips);
typedef void (^ENExpenseCompletionHandler)(NSError * error, NSArray *expenses);

@interface ExpenseHelper : NSObject

+ (id)sharedEverNoteHelper;

- (void)createTrip:(TripDetails *)detail completion:(ENCompletionHandler)completion;

- (void)addExpenseToNote:(Expense *)expense forTrip:(NSString *)tripUUID completion:(ENCompletionHandler)completion;

- (void)getMyTrips:(ENTripsCompletionHandler)completion;

-(void)getExpenses:(TripDetails *)trip completion:(ENExpenseCompletionHandler)completion;

- (void)addTripToNote:(TripDetails *)trip completion:(ENCompletionHandler)completion;
@end
