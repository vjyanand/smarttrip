
#import <Foundation/Foundation.h>
#import "Expense.h"
#import "TripDetails.h"

typedef void (^ENCompletionHandler)(NSError * error);
typedef void (^ENTripsCompletionHandler)(NSError * error, NSArray *trips);

extern NSString *const ConcurEndPoint;

@interface ExpenseHelper : NSObject

+ (id)sharedEverNoteHelper;

- (void)createTrip:(TripDetails *)detail completion:(ENCompletionHandler)completion;

- (void)addExpense:(Expense *)expense fortrip:(TripDetails *)trip completion:(ENCompletionHandler)completion;

- (void)getMyTrips:(ENTripsCompletionHandler)completion;

@end
