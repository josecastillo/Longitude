#import "LTEvent.h"


@interface LTEvent ()

// Private interface goes here.

@end


@implementation LTEvent

static NSDateFormatter *dateFormatter;

+ (void)initialize {
    [super initialize];
    dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    dateFormatter.doesRelativeDateFormatting = YES;
}

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake(self.latitudeValue, self.longitudeValue);
}

- (NSString *)title {
    return [dateFormatter stringFromDate:self.timestamp];
}

- (NSString *)subtitle {
    return [NSString stringWithFormat:@"Accurate to %@ meters", self.accuracy];
}

@end
