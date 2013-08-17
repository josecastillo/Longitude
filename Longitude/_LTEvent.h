// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LTEvent.h instead.

#import <CoreData/CoreData.h>


extern const struct LTEventAttributes {
	__unsafe_unretained NSString *accuracy;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *synchronized;
	__unsafe_unretained NSString *timestamp;
} LTEventAttributes;

extern const struct LTEventRelationships {
} LTEventRelationships;

extern const struct LTEventFetchedProperties {
} LTEventFetchedProperties;








@interface LTEventID : NSManagedObjectID {}
@end

@interface _LTEvent : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (LTEventID*)objectID;





@property (nonatomic, strong) NSNumber* accuracy;



@property double accuracyValue;
- (double)accuracyValue;
- (void)setAccuracyValue:(double)value_;

//- (BOOL)validateAccuracy:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* latitude;



@property double latitudeValue;
- (double)latitudeValue;
- (void)setLatitudeValue:(double)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* longitude;



@property double longitudeValue;
- (double)longitudeValue;
- (void)setLongitudeValue:(double)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* synchronized;



@property BOOL synchronizedValue;
- (BOOL)synchronizedValue;
- (void)setSynchronizedValue:(BOOL)value_;

//- (BOOL)validateSynchronized:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* timestamp;



//- (BOOL)validateTimestamp:(id*)value_ error:(NSError**)error_;






@end

@interface _LTEvent (CoreDataGeneratedAccessors)

@end

@interface _LTEvent (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveAccuracy;
- (void)setPrimitiveAccuracy:(NSNumber*)value;

- (double)primitiveAccuracyValue;
- (void)setPrimitiveAccuracyValue:(double)value_;




- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;




- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;




- (NSNumber*)primitiveSynchronized;
- (void)setPrimitiveSynchronized:(NSNumber*)value;

- (BOOL)primitiveSynchronizedValue;
- (void)setPrimitiveSynchronizedValue:(BOOL)value_;




- (NSDate*)primitiveTimestamp;
- (void)setPrimitiveTimestamp:(NSDate*)value;




@end
