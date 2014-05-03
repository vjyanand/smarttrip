#import <Foundation/Foundation.h>

@interface Expense : NSObject

@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSDate   *dateAndTime;
@property (nonatomic, strong) UIImage *receipt;
@property (nonatomic, strong) NSNumber *amount;
@property (nonatomic, strong) NSArray *friends;

@end
