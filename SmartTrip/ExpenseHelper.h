
#import <Foundation/Foundation.h>
#import "Expense.h"
#import "TripDetails.h"

typedef void (^ENCompletionHandler)(NSError * error);

@interface ExpenseHelper : NSObject

+ (id)sharedEverNoteHelper;

- (void)createTrip:(TripDetails *)detail completion:(ENCompletionHandler)completion;

- (void)addNote:(Expense *)expense forTrip:(NSString *)tripUUID completion:(ENCompletionHandler)completion ;


@end
