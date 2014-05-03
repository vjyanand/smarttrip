#import "EverNoteHelper.h"
#import <ENSDK/ENSDK.h>

@implementation EverNoteHelper

+ (id)sharedEverNoteHelper {
    static EverNoteHelper *EverNoteHelper = nil;
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

- (void)addNote:(Expense *)expense forTrip:(NSString *)tripUUID completion:(ENCompletionHandler)completion {
    
}

- (void)dealloc {
    
}

@end
