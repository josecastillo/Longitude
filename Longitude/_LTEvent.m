// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LTEvent.m instead.

#import "_LTEvent.h"

const struct LTEventAttributes LTEventAttributes = {
	.accuracy = @"accuracy",
	.latitude = @"latitude",
	.longitude = @"longitude",
	.synchronized = @"synchronized",
	.timestamp = @"timestamp",
};

const struct LTEventRelationships LTEventRelationships = {
};

const struct LTEventFetchedProperties LTEventFetchedProperties = {
};

@implementation LTEventID
@end

@implementation _LTEvent

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Event";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Event" inManagedObjectContext:moc_];
}

- (LTEventID*)objectID {
	return (LTEventID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"accuracyValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"accuracy"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"latitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"longitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"synchronizedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"synchronized"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic accuracy;



- (double)accuracyValue {
	NSNumber *result = [self accuracy];
	return [result doubleValue];
}

- (void)setAccuracyValue:(double)value_ {
	[self setAccuracy:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveAccuracyValue {
	NSNumber *result = [self primitiveAccuracy];
	return [result doubleValue];
}

- (void)setPrimitiveAccuracyValue:(double)value_ {
	[self setPrimitiveAccuracy:[NSNumber numberWithDouble:value_]];
}





@dynamic latitude;



- (double)latitudeValue {
	NSNumber *result = [self latitude];
	return [result doubleValue];
}

- (void)setLatitudeValue:(double)value_ {
	[self setLatitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLatitudeValue {
	NSNumber *result = [self primitiveLatitude];
	return [result doubleValue];
}

- (void)setPrimitiveLatitudeValue:(double)value_ {
	[self setPrimitiveLatitude:[NSNumber numberWithDouble:value_]];
}





@dynamic longitude;



- (double)longitudeValue {
	NSNumber *result = [self longitude];
	return [result doubleValue];
}

- (void)setLongitudeValue:(double)value_ {
	[self setLongitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLongitudeValue {
	NSNumber *result = [self primitiveLongitude];
	return [result doubleValue];
}

- (void)setPrimitiveLongitudeValue:(double)value_ {
	[self setPrimitiveLongitude:[NSNumber numberWithDouble:value_]];
}





@dynamic synchronized;



- (BOOL)synchronizedValue {
	NSNumber *result = [self synchronized];
	return [result boolValue];
}

- (void)setSynchronizedValue:(BOOL)value_ {
	[self setSynchronized:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveSynchronizedValue {
	NSNumber *result = [self primitiveSynchronized];
	return [result boolValue];
}

- (void)setPrimitiveSynchronizedValue:(BOOL)value_ {
	[self setPrimitiveSynchronized:[NSNumber numberWithBool:value_]];
}





@dynamic timestamp;











@end
