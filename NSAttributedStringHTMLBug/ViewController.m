#import "ViewController.h"

static NSString *testString = @"Test";

@interface ViewController ()

-(IBAction) benchmarkMe:(id)sender;

@end

@implementation ViewController

-(void) benchmarkMe:(id)sender {
    NSData *data = [testString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSTimeInterval startTime = [[NSDate date] timeIntervalSinceReferenceDate];
    
    // So the complier doesn't keep complaining at me.
    __attribute__((unused))
    NSAttributedString *parsed = [[NSAttributedString alloc] initWithData:data
                                                                  options:@{
                                                                        NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                        NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)
                                                                    }
                                                       documentAttributes:nil
                                                                    error:nil];
    
    NSTimeInterval endTime = [[NSDate date] timeIntervalSinceReferenceDate];
    
    NSString *message = [NSString stringWithFormat:@"Took %lf seconds.", endTime - startTime];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Benchmark complete!"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
