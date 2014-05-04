#import "Expense.h"

@implementation Expense



- (NSString*) toXml
{
    NSMutableString *buf = [[NSMutableString alloc] init];
    
    [buf appendString:@"<QuickExpense xmlns=\"http://www.concursolutions.com/api/expense/expensereport/2010/09\">"];
    
    if (_category != nil)
        [buf appendFormat:@"<VendorDescription>%@</VendorDescription>", [self xmlEscape:_category]];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    [fmt setDateFormat:@"yyyy-MM-dd"];
    [buf appendFormat:@"<TransactionDate>%@</TransactionDate>", [fmt stringFromDate:_dateAndTime]];
    
    
    [buf appendFormat:@"<TransactionAmount>%f</TransactionAmount>", [_amount floatValue]];
    
    [buf appendFormat:@"<CurrencyCode>%@</CurrencyCode>", [self xmlEscape:@"USD"]];
    
    if (_desc != nil)
        [buf appendFormat:@"<Comment>%@</Comment>", [self xmlEscape:_desc]];
    
    if (_receipt != nil)
        [buf appendFormat:@"<ImageBase64>%@</ImageBase64>", [UIImagePNGRepresentation(_receipt) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength]];
    
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
