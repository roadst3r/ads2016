//
//  ADAds.m
//
//  Created by Bruno Tereso on 12/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ADAds.h"
#import "ADPhotos.h"


NSString *const kADAdsListLabel = @"list_label";
NSString *const kADAdsUserLabel = @"user_label";
NSString *const kADAdsId = @"id";
NSString *const kADAdsChatOptions = @"chat_options";
NSString *const kADAdsHasPhone = @"has_phone";
NSString *const kADAdsTopAd = @"topAd";
NSString *const kADAdsUrgent = @"urgent";
NSString *const kADAdsPreviewUrl = @"preview_url";
NSString *const kADAdsCreated = @"created";
NSString *const kADAdsSubtitle = @"subtitle";
NSString *const kADAdsIsPriceNegotiable = @"is_price_negotiable";
NSString *const kADAdsNumericUserId = @"numeric_user_id";
NSString *const kADAdsPromotionSection = @"promotion_section";
NSString *const kADAdsUrl = @"url";
NSString *const kADAdsMapShowDetailed = @"map_show_detailed";
NSString *const kADAdsPriceNumeric = @"price_numeric";
NSString *const kADAdsHasEmail = @"has_email";
NSString *const kADAdsDescription = @"description";
NSString *const kADAdsMapZoom = @"map_zoom";
NSString *const kADAdsCityLabel = @"city_label";
NSString *const kADAdsMapLat = @"map_lat";
NSString *const kADAdsParams = @"params";
NSString *const kADAdsFeatured = @"featured";
NSString *const kADAdsPerson = @"person";
NSString *const kADAdsUserAdsId = @"user_ads_id";
NSString *const kADAdsPricePrevious = @"pricePrevious";
NSString *const kADAdsMapLocation = @"map_location";
NSString *const kADAdsListLabelAd = @"list_label_ad";
NSString *const kADAdsHighlighted = @"highlighted";
NSString *const kADAdsSocialNetworkAccountType = @"social_network_account_type";
NSString *const kADAdsStatus = @"status";
NSString *const kADAdsRegionId = @"region_id";
NSString *const kADAdsPriceType = @"price_type";
NSString *const kADAdsBusiness = @"business";
NSString *const kADAdsUserAdsUrl = @"user_ads_url";
NSString *const kADAdsMapLon = @"map_lon";
NSString *const kADAdsUserId = @"user_id";
NSString *const kADAdsHideUserAdsButton = @"hide_user_ads_button";
NSString *const kADAdsAge = @"age";
NSString *const kADAdsHeaderType = @"header_type";
NSString *const kADAdsCityId = @"city_id";
NSString *const kADAdsHeader = @"header";
NSString *const kADAdsMapRadius = @"map_radius";
NSString *const kADAdsTitle = @"title";
NSString *const kADAdsCategoryId = @"category_id";
NSString *const kADAdsPhotos = @"photos";
NSString *const kADAdsUserPhoto = @"user_photo";
NSString *const kADAdsCampaignSource = @"campaignSource";


@interface ADAds ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ADAds

@synthesize listLabel = _listLabel;
@synthesize userLabel = _userLabel;
@synthesize adsIdentifier = _adsIdentifier;
@synthesize chatOptions = _chatOptions;
@synthesize hasPhone = _hasPhone;
@synthesize topAd = _topAd;
@synthesize urgent = _urgent;
@synthesize previewUrl = _previewUrl;
@synthesize created = _created;
@synthesize subtitle = _subtitle;
@synthesize isPriceNegotiable = _isPriceNegotiable;
@synthesize numericUserId = _numericUserId;
@synthesize promotionSection = _promotionSection;
@synthesize url = _url;
@synthesize mapShowDetailed = _mapShowDetailed;
@synthesize priceNumeric = _priceNumeric;
@synthesize hasEmail = _hasEmail;
@synthesize adsDescription = _adsDescription;
@synthesize mapZoom = _mapZoom;
@synthesize cityLabel = _cityLabel;
@synthesize mapLat = _mapLat;
@synthesize params = _params;
@synthesize featured = _featured;
@synthesize person = _person;
@synthesize userAdsId = _userAdsId;
@synthesize pricePrevious = _pricePrevious;
@synthesize mapLocation = _mapLocation;
@synthesize listLabelAd = _listLabelAd;
@synthesize highlighted = _highlighted;
@synthesize socialNetworkAccountType = _socialNetworkAccountType;
@synthesize status = _status;
@synthesize regionId = _regionId;
@synthesize priceType = _priceType;
@synthesize business = _business;
@synthesize userAdsUrl = _userAdsUrl;
@synthesize mapLon = _mapLon;
@synthesize userId = _userId;
@synthesize hideUserAdsButton = _hideUserAdsButton;
@synthesize age = _age;
@synthesize headerType = _headerType;
@synthesize cityId = _cityId;
@synthesize header = _header;
@synthesize mapRadius = _mapRadius;
@synthesize title = _title;
@synthesize categoryId = _categoryId;
@synthesize photos = _photos;
@synthesize userPhoto = _userPhoto;
@synthesize campaignSource = _campaignSource;


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
            self.listLabel = [self objectOrNilForKey:kADAdsListLabel fromDictionary:dict];
            self.userLabel = [self objectOrNilForKey:kADAdsUserLabel fromDictionary:dict];
            self.adsIdentifier = [self objectOrNilForKey:kADAdsId fromDictionary:dict];
            self.chatOptions = [[self objectOrNilForKey:kADAdsChatOptions fromDictionary:dict] doubleValue];
            self.hasPhone = [[self objectOrNilForKey:kADAdsHasPhone fromDictionary:dict] doubleValue];
            self.topAd = [[self objectOrNilForKey:kADAdsTopAd fromDictionary:dict] doubleValue];
            self.urgent = [[self objectOrNilForKey:kADAdsUrgent fromDictionary:dict] doubleValue];
            self.previewUrl = [self objectOrNilForKey:kADAdsPreviewUrl fromDictionary:dict];
            self.created = [self objectOrNilForKey:kADAdsCreated fromDictionary:dict];
            self.subtitle = [self objectOrNilForKey:kADAdsSubtitle fromDictionary:dict];
            self.isPriceNegotiable = [[self objectOrNilForKey:kADAdsIsPriceNegotiable fromDictionary:dict] doubleValue];
            self.numericUserId = [self objectOrNilForKey:kADAdsNumericUserId fromDictionary:dict];
            self.promotionSection = [[self objectOrNilForKey:kADAdsPromotionSection fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kADAdsUrl fromDictionary:dict];
            self.mapShowDetailed = [[self objectOrNilForKey:kADAdsMapShowDetailed fromDictionary:dict] boolValue];
            self.priceNumeric = [self objectOrNilForKey:kADAdsPriceNumeric fromDictionary:dict];
            self.hasEmail = [[self objectOrNilForKey:kADAdsHasEmail fromDictionary:dict] doubleValue];
            self.adsDescription = [self objectOrNilForKey:kADAdsDescription fromDictionary:dict];
            self.mapZoom = [self objectOrNilForKey:kADAdsMapZoom fromDictionary:dict];
            self.cityLabel = [self objectOrNilForKey:kADAdsCityLabel fromDictionary:dict];
            self.mapLat = [self objectOrNilForKey:kADAdsMapLat fromDictionary:dict];
            self.params = [self objectOrNilForKey:kADAdsParams fromDictionary:dict];
            self.featured = [self objectOrNilForKey:kADAdsFeatured fromDictionary:dict];
            self.person = [self objectOrNilForKey:kADAdsPerson fromDictionary:dict];
            self.userAdsId = [self objectOrNilForKey:kADAdsUserAdsId fromDictionary:dict];
            self.pricePrevious = [self objectOrNilForKey:kADAdsPricePrevious fromDictionary:dict];
            self.mapLocation = [self objectOrNilForKey:kADAdsMapLocation fromDictionary:dict];
            self.listLabelAd = [self objectOrNilForKey:kADAdsListLabelAd fromDictionary:dict];
            self.highlighted = [[self objectOrNilForKey:kADAdsHighlighted fromDictionary:dict] doubleValue];
            self.socialNetworkAccountType = [self objectOrNilForKey:kADAdsSocialNetworkAccountType fromDictionary:dict];
            self.status = [self objectOrNilForKey:kADAdsStatus fromDictionary:dict];
            self.regionId = [self objectOrNilForKey:kADAdsRegionId fromDictionary:dict];
            self.priceType = [self objectOrNilForKey:kADAdsPriceType fromDictionary:dict];
            self.business = [[self objectOrNilForKey:kADAdsBusiness fromDictionary:dict] doubleValue];
            self.userAdsUrl = [self objectOrNilForKey:kADAdsUserAdsUrl fromDictionary:dict];
            self.mapLon = [self objectOrNilForKey:kADAdsMapLon fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kADAdsUserId fromDictionary:dict];
            self.hideUserAdsButton = [[self objectOrNilForKey:kADAdsHideUserAdsButton fromDictionary:dict] doubleValue];
            self.age = [[self objectOrNilForKey:kADAdsAge fromDictionary:dict] doubleValue];
            self.headerType = [self objectOrNilForKey:kADAdsHeaderType fromDictionary:dict];
            self.cityId = [self objectOrNilForKey:kADAdsCityId fromDictionary:dict];
            self.header = [self objectOrNilForKey:kADAdsHeader fromDictionary:dict];
            self.mapRadius = [[self objectOrNilForKey:kADAdsMapRadius fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kADAdsTitle fromDictionary:dict];
            self.categoryId = [[self objectOrNilForKey:kADAdsCategoryId fromDictionary:dict] doubleValue];
            self.photos = [ADPhotos modelObjectWithDictionary:[dict objectForKey:kADAdsPhotos]];
            self.userPhoto = [self objectOrNilForKey:kADAdsUserPhoto fromDictionary:dict];
            self.campaignSource = [self objectOrNilForKey:kADAdsCampaignSource fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listLabel forKey:kADAdsListLabel];
    [mutableDict setValue:self.userLabel forKey:kADAdsUserLabel];
    [mutableDict setValue:self.adsIdentifier forKey:kADAdsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.chatOptions] forKey:kADAdsChatOptions];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasPhone] forKey:kADAdsHasPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.topAd] forKey:kADAdsTopAd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.urgent] forKey:kADAdsUrgent];
    [mutableDict setValue:self.previewUrl forKey:kADAdsPreviewUrl];
    [mutableDict setValue:self.created forKey:kADAdsCreated];
    NSMutableArray *tempArrayForSubtitle = [NSMutableArray array];
    for (NSObject *subArrayObject in self.subtitle) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSubtitle addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSubtitle addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSubtitle] forKey:kADAdsSubtitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isPriceNegotiable] forKey:kADAdsIsPriceNegotiable];
    [mutableDict setValue:self.numericUserId forKey:kADAdsNumericUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.promotionSection] forKey:kADAdsPromotionSection];
    [mutableDict setValue:self.url forKey:kADAdsUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.mapShowDetailed] forKey:kADAdsMapShowDetailed];
    [mutableDict setValue:self.priceNumeric forKey:kADAdsPriceNumeric];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasEmail] forKey:kADAdsHasEmail];
    [mutableDict setValue:self.adsDescription forKey:kADAdsDescription];
    [mutableDict setValue:self.mapZoom forKey:kADAdsMapZoom];
    [mutableDict setValue:self.cityLabel forKey:kADAdsCityLabel];
    [mutableDict setValue:self.mapLat forKey:kADAdsMapLat];
    NSMutableArray *tempArrayForParams = [NSMutableArray array];
    for (NSObject *subArrayObject in self.params) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForParams addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForParams addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForParams] forKey:kADAdsParams];
    NSMutableArray *tempArrayForFeatured = [NSMutableArray array];
    for (NSObject *subArrayObject in self.featured) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForFeatured addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForFeatured addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForFeatured] forKey:kADAdsFeatured];
    [mutableDict setValue:self.person forKey:kADAdsPerson];
    [mutableDict setValue:self.userAdsId forKey:kADAdsUserAdsId];
    [mutableDict setValue:self.pricePrevious forKey:kADAdsPricePrevious];
    [mutableDict setValue:self.mapLocation forKey:kADAdsMapLocation];
    [mutableDict setValue:self.listLabelAd forKey:kADAdsListLabelAd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.highlighted] forKey:kADAdsHighlighted];
    [mutableDict setValue:self.socialNetworkAccountType forKey:kADAdsSocialNetworkAccountType];
    [mutableDict setValue:self.status forKey:kADAdsStatus];
    [mutableDict setValue:self.regionId forKey:kADAdsRegionId];
    [mutableDict setValue:self.priceType forKey:kADAdsPriceType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.business] forKey:kADAdsBusiness];
    [mutableDict setValue:self.userAdsUrl forKey:kADAdsUserAdsUrl];
    [mutableDict setValue:self.mapLon forKey:kADAdsMapLon];
    [mutableDict setValue:self.userId forKey:kADAdsUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hideUserAdsButton] forKey:kADAdsHideUserAdsButton];
    [mutableDict setValue:[NSNumber numberWithDouble:self.age] forKey:kADAdsAge];
    [mutableDict setValue:self.headerType forKey:kADAdsHeaderType];
    [mutableDict setValue:self.cityId forKey:kADAdsCityId];
    [mutableDict setValue:self.header forKey:kADAdsHeader];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mapRadius] forKey:kADAdsMapRadius];
    [mutableDict setValue:self.title forKey:kADAdsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kADAdsCategoryId];
    [mutableDict setValue:[self.photos dictionaryRepresentation] forKey:kADAdsPhotos];
    [mutableDict setValue:self.userPhoto forKey:kADAdsUserPhoto];
    [mutableDict setValue:self.campaignSource forKey:kADAdsCampaignSource];

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

    self.listLabel = [aDecoder decodeObjectForKey:kADAdsListLabel];
    self.userLabel = [aDecoder decodeObjectForKey:kADAdsUserLabel];
    self.adsIdentifier = [aDecoder decodeObjectForKey:kADAdsId];
    self.chatOptions = [aDecoder decodeDoubleForKey:kADAdsChatOptions];
    self.hasPhone = [aDecoder decodeDoubleForKey:kADAdsHasPhone];
    self.topAd = [aDecoder decodeDoubleForKey:kADAdsTopAd];
    self.urgent = [aDecoder decodeDoubleForKey:kADAdsUrgent];
    self.previewUrl = [aDecoder decodeObjectForKey:kADAdsPreviewUrl];
    self.created = [aDecoder decodeObjectForKey:kADAdsCreated];
    self.subtitle = [aDecoder decodeObjectForKey:kADAdsSubtitle];
    self.isPriceNegotiable = [aDecoder decodeDoubleForKey:kADAdsIsPriceNegotiable];
    self.numericUserId = [aDecoder decodeObjectForKey:kADAdsNumericUserId];
    self.promotionSection = [aDecoder decodeDoubleForKey:kADAdsPromotionSection];
    self.url = [aDecoder decodeObjectForKey:kADAdsUrl];
    self.mapShowDetailed = [aDecoder decodeBoolForKey:kADAdsMapShowDetailed];
    self.priceNumeric = [aDecoder decodeObjectForKey:kADAdsPriceNumeric];
    self.hasEmail = [aDecoder decodeDoubleForKey:kADAdsHasEmail];
    self.adsDescription = [aDecoder decodeObjectForKey:kADAdsDescription];
    self.mapZoom = [aDecoder decodeObjectForKey:kADAdsMapZoom];
    self.cityLabel = [aDecoder decodeObjectForKey:kADAdsCityLabel];
    self.mapLat = [aDecoder decodeObjectForKey:kADAdsMapLat];
    self.params = [aDecoder decodeObjectForKey:kADAdsParams];
    self.featured = [aDecoder decodeObjectForKey:kADAdsFeatured];
    self.person = [aDecoder decodeObjectForKey:kADAdsPerson];
    self.userAdsId = [aDecoder decodeObjectForKey:kADAdsUserAdsId];
    self.pricePrevious = [aDecoder decodeObjectForKey:kADAdsPricePrevious];
    self.mapLocation = [aDecoder decodeObjectForKey:kADAdsMapLocation];
    self.listLabelAd = [aDecoder decodeObjectForKey:kADAdsListLabelAd];
    self.highlighted = [aDecoder decodeDoubleForKey:kADAdsHighlighted];
    self.socialNetworkAccountType = [aDecoder decodeObjectForKey:kADAdsSocialNetworkAccountType];
    self.status = [aDecoder decodeObjectForKey:kADAdsStatus];
    self.regionId = [aDecoder decodeObjectForKey:kADAdsRegionId];
    self.priceType = [aDecoder decodeObjectForKey:kADAdsPriceType];
    self.business = [aDecoder decodeDoubleForKey:kADAdsBusiness];
    self.userAdsUrl = [aDecoder decodeObjectForKey:kADAdsUserAdsUrl];
    self.mapLon = [aDecoder decodeObjectForKey:kADAdsMapLon];
    self.userId = [aDecoder decodeObjectForKey:kADAdsUserId];
    self.hideUserAdsButton = [aDecoder decodeDoubleForKey:kADAdsHideUserAdsButton];
    self.age = [aDecoder decodeDoubleForKey:kADAdsAge];
    self.headerType = [aDecoder decodeObjectForKey:kADAdsHeaderType];
    self.cityId = [aDecoder decodeObjectForKey:kADAdsCityId];
    self.header = [aDecoder decodeObjectForKey:kADAdsHeader];
    self.mapRadius = [aDecoder decodeDoubleForKey:kADAdsMapRadius];
    self.title = [aDecoder decodeObjectForKey:kADAdsTitle];
    self.categoryId = [aDecoder decodeDoubleForKey:kADAdsCategoryId];
    self.photos = [aDecoder decodeObjectForKey:kADAdsPhotos];
    self.userPhoto = [aDecoder decodeObjectForKey:kADAdsUserPhoto];
    self.campaignSource = [aDecoder decodeObjectForKey:kADAdsCampaignSource];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listLabel forKey:kADAdsListLabel];
    [aCoder encodeObject:_userLabel forKey:kADAdsUserLabel];
    [aCoder encodeObject:_adsIdentifier forKey:kADAdsId];
    [aCoder encodeDouble:_chatOptions forKey:kADAdsChatOptions];
    [aCoder encodeDouble:_hasPhone forKey:kADAdsHasPhone];
    [aCoder encodeDouble:_topAd forKey:kADAdsTopAd];
    [aCoder encodeDouble:_urgent forKey:kADAdsUrgent];
    [aCoder encodeObject:_previewUrl forKey:kADAdsPreviewUrl];
    [aCoder encodeObject:_created forKey:kADAdsCreated];
    [aCoder encodeObject:_subtitle forKey:kADAdsSubtitle];
    [aCoder encodeDouble:_isPriceNegotiable forKey:kADAdsIsPriceNegotiable];
    [aCoder encodeObject:_numericUserId forKey:kADAdsNumericUserId];
    [aCoder encodeDouble:_promotionSection forKey:kADAdsPromotionSection];
    [aCoder encodeObject:_url forKey:kADAdsUrl];
    [aCoder encodeBool:_mapShowDetailed forKey:kADAdsMapShowDetailed];
    [aCoder encodeObject:_priceNumeric forKey:kADAdsPriceNumeric];
    [aCoder encodeDouble:_hasEmail forKey:kADAdsHasEmail];
    [aCoder encodeObject:_adsDescription forKey:kADAdsDescription];
    [aCoder encodeObject:_mapZoom forKey:kADAdsMapZoom];
    [aCoder encodeObject:_cityLabel forKey:kADAdsCityLabel];
    [aCoder encodeObject:_mapLat forKey:kADAdsMapLat];
    [aCoder encodeObject:_params forKey:kADAdsParams];
    [aCoder encodeObject:_featured forKey:kADAdsFeatured];
    [aCoder encodeObject:_person forKey:kADAdsPerson];
    [aCoder encodeObject:_userAdsId forKey:kADAdsUserAdsId];
    [aCoder encodeObject:_pricePrevious forKey:kADAdsPricePrevious];
    [aCoder encodeObject:_mapLocation forKey:kADAdsMapLocation];
    [aCoder encodeObject:_listLabelAd forKey:kADAdsListLabelAd];
    [aCoder encodeDouble:_highlighted forKey:kADAdsHighlighted];
    [aCoder encodeObject:_socialNetworkAccountType forKey:kADAdsSocialNetworkAccountType];
    [aCoder encodeObject:_status forKey:kADAdsStatus];
    [aCoder encodeObject:_regionId forKey:kADAdsRegionId];
    [aCoder encodeObject:_priceType forKey:kADAdsPriceType];
    [aCoder encodeDouble:_business forKey:kADAdsBusiness];
    [aCoder encodeObject:_userAdsUrl forKey:kADAdsUserAdsUrl];
    [aCoder encodeObject:_mapLon forKey:kADAdsMapLon];
    [aCoder encodeObject:_userId forKey:kADAdsUserId];
    [aCoder encodeDouble:_hideUserAdsButton forKey:kADAdsHideUserAdsButton];
    [aCoder encodeDouble:_age forKey:kADAdsAge];
    [aCoder encodeObject:_headerType forKey:kADAdsHeaderType];
    [aCoder encodeObject:_cityId forKey:kADAdsCityId];
    [aCoder encodeObject:_header forKey:kADAdsHeader];
    [aCoder encodeDouble:_mapRadius forKey:kADAdsMapRadius];
    [aCoder encodeObject:_title forKey:kADAdsTitle];
    [aCoder encodeDouble:_categoryId forKey:kADAdsCategoryId];
    [aCoder encodeObject:_photos forKey:kADAdsPhotos];
    [aCoder encodeObject:_userPhoto forKey:kADAdsUserPhoto];
    [aCoder encodeObject:_campaignSource forKey:kADAdsCampaignSource];
}

- (id)copyWithZone:(NSZone *)zone
{
    ADAds *copy = [[ADAds alloc] init];
    
    if (copy) {

        copy.listLabel = [self.listLabel copyWithZone:zone];
        copy.userLabel = [self.userLabel copyWithZone:zone];
        copy.adsIdentifier = [self.adsIdentifier copyWithZone:zone];
        copy.chatOptions = self.chatOptions;
        copy.hasPhone = self.hasPhone;
        copy.topAd = self.topAd;
        copy.urgent = self.urgent;
        copy.previewUrl = [self.previewUrl copyWithZone:zone];
        copy.created = [self.created copyWithZone:zone];
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.isPriceNegotiable = self.isPriceNegotiable;
        copy.numericUserId = [self.numericUserId copyWithZone:zone];
        copy.promotionSection = self.promotionSection;
        copy.url = [self.url copyWithZone:zone];
        copy.mapShowDetailed = self.mapShowDetailed;
        copy.priceNumeric = [self.priceNumeric copyWithZone:zone];
        copy.hasEmail = self.hasEmail;
        copy.adsDescription = [self.adsDescription copyWithZone:zone];
        copy.mapZoom = [self.mapZoom copyWithZone:zone];
        copy.cityLabel = [self.cityLabel copyWithZone:zone];
        copy.mapLat = [self.mapLat copyWithZone:zone];
        copy.params = [self.params copyWithZone:zone];
        copy.featured = [self.featured copyWithZone:zone];
        copy.person = [self.person copyWithZone:zone];
        copy.userAdsId = [self.userAdsId copyWithZone:zone];
        copy.pricePrevious = [self.pricePrevious copyWithZone:zone];
        copy.mapLocation = [self.mapLocation copyWithZone:zone];
        copy.listLabelAd = [self.listLabelAd copyWithZone:zone];
        copy.highlighted = self.highlighted;
        copy.socialNetworkAccountType = [self.socialNetworkAccountType copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.regionId = [self.regionId copyWithZone:zone];
        copy.priceType = [self.priceType copyWithZone:zone];
        copy.business = self.business;
        copy.userAdsUrl = [self.userAdsUrl copyWithZone:zone];
        copy.mapLon = [self.mapLon copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.hideUserAdsButton = self.hideUserAdsButton;
        copy.age = self.age;
        copy.headerType = [self.headerType copyWithZone:zone];
        copy.cityId = [self.cityId copyWithZone:zone];
        copy.header = [self.header copyWithZone:zone];
        copy.mapRadius = self.mapRadius;
        copy.title = [self.title copyWithZone:zone];
        copy.categoryId = self.categoryId;
        copy.photos = [self.photos copyWithZone:zone];
        copy.userPhoto = [self.userPhoto copyWithZone:zone];
        copy.campaignSource = [self.campaignSource copyWithZone:zone];
    }
    
    return copy;
}


@end
