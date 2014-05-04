#import <Foundation/Foundation.h>

@interface CategoryBudget : NSObject

@property (nonatomic, strong) NSNumber *categoryBudget;
@property (nonatomic, strong) NSNumber *categoryAmountSpent;
@property (nonatomic, strong) NSString *categoryName;


- (NSString *)getRemainingBudgetString;

@end
