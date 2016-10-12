//
//  ADData.m
//
//  Created by Bruno Tereso on 12/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ADData.h"


NSString *const kADDataSlotId = @"slot_id";
NSString *const kADDataW = @"w";
NSString *const kADDataH = @"h";


@interface ADData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ADData

@synthesize slotId = _slotId;
@synthesize w = _w;
@synthesize h = _h;


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
            self.slotId = [[self objectOrNilForKey:kADDataSlotId fromDictionary:dict] doubleValue];
            self.w = [[self objectOrNilForKey:kADDataW fromDictionary:dict] doubleValue];
            self.h = [[self objectOrNilForKey:kADDataH fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.slotId] forKey:kADDataSlotId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.w] forKey:kADDataW];
    [mutableDict setValue:[NSNumber numberWithDouble:self.h] forKey:kADDataH];

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

    self.slotId = [aDecoder decodeDoubleForKey:kADDataSlotId];
    self.w = [aDecoder decodeDoubleForKey:kADDataW];
    self.h = [aDecoder decodeDoubleForKey:kADDataH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_slotId forKey:kADDataSlotId];
    [aCoder encodeDouble:_w forKey:kADDataW];
    [aCoder encodeDouble:_h forKey:kADDataH];
}

- (id)copyWithZone:(NSZone *)zone
{
    ADData *copy = [[ADData alloc] init];
    
    if (copy) {

        copy.slotId = self.slotId;
        copy.w = self.w;
        copy.h = self.h;
    }
    
    return copy;
}


@end
