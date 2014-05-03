
#import <Foundation/Foundation.h>
#import "Expense.h"

typedef void (^ENCompletionHandler)(NSError * error);

@interface ExpenseHelper : NSObject

+ (id)sharedEverNoteHelper;

- (void)addNote:(Expense *)expense forTrip:(NSString *)tripUUID completion:(ENCompletionHandler)completion ;


@end
