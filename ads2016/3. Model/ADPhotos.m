//
//  ADPhotos.m
//
//  Created by Bruno Tereso on 12/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ADPhotos.h"
#import "ADData.h"


NSString *const kADPhotosData = @"data";
NSString *const kADPhotosRiakRev = @"riak_rev";
NSString *const kADPhotosRiakKey = @"riak_key";
NSString *const kADPhotosRiakRing = @"riak_ring";


@interface ADPhotos ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ADPhotos

@synthesize data = _data;
@synthesize riakRev = _riakRev;
@synthesize riakKey = _riakKey;
@synthesize riakRing = _riakRing;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedADData = [dict objectForKey:kADPhotosData];
    NSMutableArray *parsedADData = [NSMutableArray array];
    if ([receivedADData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedADData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedADData addObject:[ADData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedADData isKindOfClass:[NSDictionary class]]) {
       [parsedADData addObject:[ADData modelObjectWithDictionary:(NSDictionary *)receivedADData]];
    }

    self.data = [NSArray arrayWithArray:parsedADData];
            self.riakRev = [[self objectOrNilForKey:kADPhotosRiakRev fromDictionary:dict] doubleValue];
            self.riakKey = [[self objectOrNilForKey:kADPhotosRiakKey fromDictionary:dict] doubleValue];
            self.riakRing = [[self objectOrNilForKey:kADPhotosRiakRing fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kADPhotosData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.riakRev] forKey:kADPhotosRiakRev];
    [mutableDict setValue:[NSNumber numberWithDouble:self.riakKey] forKey:kADPhotosRiakKey];
    [mutableDict setValue:[NSNumber numberWithDouble:self.riakRing] forKey:kADPhotosRiakRing];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.data = [aDecoder decodeObjectForKey:kADPhotosData];
    self.riakRev = [aDecoder decodeDoubleForKey:kADPhotosRiakRev];
    self.riakKey = [aDecoder decodeDoubleForKey:kADPhotosRiakKey];
    self.riakRing = [aDecoder decodeDoubleForKey:kADPhotosRiakRing];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_data forKey:kADPhotosData];
    [aCoder encodeDouble:_riakRev forKey:kADPhotosRiakRev];
    [aCoder encodeDouble:_riakKey forKey:kADPhotosRiakKey];
    [aCoder encodeDouble:_riakRing forKey:kADPhotosRiakRing];
}

- (id)copyWithZone:(NSZone *)zone
{
    ADPhotos *copy = [[ADPhotos alloc] init];
    
    if (copy) {

        copy.data = [self.data copyWithZone:zone];
        copy.riakRev = self.riakRev;
        copy.riakKey = self.riakKey;
        copy.riakRing = self.riakRing;
    }
    
    return copy;
}


@end
