#import "_LTEvent.h"
#import <MapKit/MapKit.h>

@interface LTEvent : _LTEvent <MKAnnotation>
{
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *subtitle;

@end
