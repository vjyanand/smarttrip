
#import <Foundation/Foundation.h>
#import "Expense.h"
#import "TripDetails.h"

typedef void (^ENCompletionHandler)(NSError * error);

extern NSString *const ConcurEndPoint;

@interface ExpenseHelper : NSObject

+ (id)sharedEverNoteHelper;

- (void)createTrip:(TripDetails *)detail completion:(ENCompletionHandler)completion;

- (void)addNote:(Expense *)expense forTrip:(NSString *)tripUUID completion:(ENCompletionHandler)completion ;

- (NSArray*)getMyTrips:(ENCompletionHandler)completion;

@end
