
#import <Foundation/Foundation.h>
#import "Expense.h"

typedef void (^ENCompletionHandler)(NSError * error);

@interface EverNoteHelper : NSObject

+ (id)sharedEverNoteHelper;

- (void)addNote:(Expense *)expense forTrip:(NSString *)tripUUID completion:(ENCompletionHandler)completion ;


@end
