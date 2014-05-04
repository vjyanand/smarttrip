
#import <Foundation/Foundation.h>

@interface HackQuickExpense : NSObject

@property (strong, nonatomic) NSString *categoryCode;
@property (strong, nonatomic) NSDate *transactionDate;
@property (strong, nonatomic) NSString *paymentType;
@property float amount;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *country;
@property (strong, nonatomic) NSString *vendor;
@property (strong, nonatomic) NSString *comment;
@property (strong, nonatomic) NSString *imageBase64;
@property (strong, nonatomic) NSString *qeKey;

- (NSString*) toXml;

@end
