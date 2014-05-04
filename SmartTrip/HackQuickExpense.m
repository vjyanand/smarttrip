#import "HackQuickExpense.h"

@implementation HackQuickExpense


@synthesize categoryCode;
@synthesize transactionDate;
@synthesize paymentType;
@synthesize amount;
@synthesize city;
@synthesize state;
@synthesize country;
@synthesize vendor;
@synthesize comment;
@synthesize imageBase64, qeKey;


- (NSString*) toXml
{
    NSMutableString *buf = [[NSMutableString alloc] init];
    
    [buf appendString:@"<QuickExpense xmlns=\"http://www.concursolutions.com/api/expense/expensereport/2010/09\">"];
    
    if (categoryCode != nil)
        [buf appendFormat:@"<SpendCategoryCode>%@</SpendCategoryCode>", [self xmlEscape:categoryCode]];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    [fmt setDateFormat:@"yyyy-MM-dd"];
    [buf appendFormat:@"<TransactionDate>%@</TransactionDate>", [fmt stringFromDate:transactionDate]];
    
    if (self.paymentType != nil)
        [buf appendFormat:@"<PaymentType>%@</PaymentType>", [self xmlEscape:paymentType]];
    
    [buf appendFormat:@"<TransactionAmount>%f</TransactionAmount>", amount];
    
    [buf appendFormat:@"<CurrencyCode>%@</CurrencyCode>", [self xmlEscape:@"USD"]];
    
    if (city != nil)
        [buf appendFormat:@"<LocationCity>%@</LocationCity>", [self xmlEscape:city]];
    
    if (country == nil)
        country = @"US";
    
    if (state != nil)
    {
        [buf appendString:@"<LocationSubdivision>"];
        [buf appendString:[self xmlEscape:country]];
        [buf appendString:@"-"];
        [buf appendString:[self xmlEscape:state]];
        [buf appendString:@"</LocationSubdivision>"];
    }
    
    [buf appendFormat:@"<LocationCountry>%@</LocationCountry>", [self xmlEscape:country]];
    
    if (vendor != nil)
        [buf appendFormat:@"<VendorDescription>%@</VendorDescription>", [self xmlEscape:vendor]];
    
    if (comment != nil)
        [buf appendFormat:@"<Comment>%@</Comment>", [self xmlEscape:comment]];
    
    if (imageBase64 != nil)
        [buf appendFormat:@"<ImageBase64>%@</ImageBase64>", imageBase64];
    
    
    [buf appendString:@"</QuickExpense>"];
    
    NSLog(@"QE Save: %@", buf);
    
    return buf;
    
}

- (NSString *) xmlEscape: (NSString*)src
{
    NSMutableString *str = [NSMutableString stringWithString:src];
    [str replaceOccurrencesOfString:@"&"  withString:@"&amp;"  options:NSLiteralSearch range:NSMakeRange(0, [str length])];
    [str replaceOccurrencesOfString:@"\"" withString:@"&quot;" options:NSLiteralSearch range:NSMakeRange(0, [str length])];
    [str replaceOccurrencesOfString:@"'"  withString:@"&apos;" options:NSLiteralSearch range:NSMakeRange(0, [str length])];
    [str replaceOccurrencesOfString:@">"  withString:@"&gt;"   options:NSLiteralSearch range:NSMakeRange(0, [str length])];
    [str replaceOccurrencesOfString:@"<"  withString:@"&lt;"   options:NSLiteralSearch range:NSMakeRange(0, [str length])];
    
    return str;
    
}

@end
