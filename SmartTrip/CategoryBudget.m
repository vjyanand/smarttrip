#import "CategoryBudget.h"

@implementation CategoryBudget

- (NSString *)getRemainingBudgetString
{
    int remaining = [self.categoryBudget intValue] - [self.categoryAmountSpent intValue];
    
    return [NSString stringWithFormat:@"%i", remaining];
}

- (NSNumber *)getCategoryAmountSpent
{
    if (!_categoryAmountSpent) {
        return [NSNumber numberWithInt:0];
    }else{
        return _categoryAmountSpent;
    }
}

- (NSNumber *)getCategoryBudget
{
    if (!_categoryBudget) {
        return [NSNumber numberWithInt:0];
    }else{
        return _categoryBudget;
    }
}



@end
