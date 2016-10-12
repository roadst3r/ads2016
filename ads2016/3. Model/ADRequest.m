//
//  ADRequest.m
//
//  Created by Bruno Tereso on 12/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ADRequest.h"
#import "ADAds.h"


NSString *const kADRequestTotalPages = @"total_pages";
NSString *const kADRequestAdsOnPage = @"ads_on_page";
NSString *const kADRequestNextPageUrl = @"next_page_url";
NSString *const kADRequestAds = @"ads";
NSString *const kADRequestPage = @"page";


@interface ADRequest ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ADRequest

@synthesize totalPages = _totalPages;
@synthesize adsOnPage = _adsOnPage;
@synthesize nextPageUrl = _nextPageUrl;
@synthesize ads = _ads;
@synthesize page = _page;


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
            self.totalPages = [[self objectOrNilForKey:kADRequestTotalPages fromDictionary:dict] doubleValue];
            self.adsOnPage = [[self objectOrNilForKey:kADRequestAdsOnPage fromDictionary:dict] doubleValue];
            self.nextPageUrl = [self objectOrNilForKey:kADRequestNextPageUrl fromDictionary:dict];
    NSObject *receivedADAds = [dict objectForKey:kADRequestAds];
    NSMutableArray *parsedADAds = [NSMutableArray array];
    if ([receivedADAds isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedADAds) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedADAds addObject:[ADAds modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedADAds isKindOfClass:[NSDictionary class]]) {
       [parsedADAds addObject:[ADAds modelObjectWithDictionary:(NSDictionary *)receivedADAds]];
    }

    self.ads = [NSArray arrayWithArray:parsedADAds];
            self.page = [[self objectOrNilForKey:kADRequestPage fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPages] forKey:kADRequestTotalPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.adsOnPage] forKey:kADRequestAdsOnPage];
    [mutableDict setValue:self.nextPageUrl forKey:kADRequestNextPageUrl];
    NSMutableArray *tempArrayForAds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.ads) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAds] forKey:kADRequestAds];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kADRequestPage];

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

    self.totalPages = [aDecoder decodeDoubleForKey:kADRequestTotalPages];
    self.adsOnPage = [aDecoder decodeDoubleForKey:kADRequestAdsOnPage];
    self.nextPageUrl = [aDecoder decodeObjectForKey:kADRequestNextPageUrl];
    self.ads = [aDecoder decodeObjectForKey:kADRequestAds];
    self.page = [aDecoder decodeDoubleForKey:kADRequestPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_totalPages forKey:kADRequestTotalPages];
    [aCoder encodeDouble:_adsOnPage forKey:kADRequestAdsOnPage];
    [aCoder encodeObject:_nextPageUrl forKey:kADRequestNextPageUrl];
    [aCoder encodeObject:_ads forKey:kADRequestAds];
    [aCoder encodeDouble:_page forKey:kADRequestPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    ADRequest *copy = [[ADRequest alloc] init];
    
    if (copy) {

        copy.totalPages = self.totalPages;
        copy.adsOnPage = self.adsOnPage;
        copy.nextPageUrl = [self.nextPageUrl copyWithZone:zone];
        copy.ads = [self.ads copyWithZone:zone];
        copy.page = self.page;
    }
    
    return copy;
}


@end
