//
//  ADAds.h
//
//  Created by Bruno Tereso on 12/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ADPhotos;

@interface ADAds : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listLabel;
@property (nonatomic, strong) NSString *userLabel;
@property (nonatomic, strong) NSString *adsIdentifier;
@property (nonatomic, assign) double chatOptions;
@property (nonatomic, assign) double hasPhone;
@property (nonatomic, assign) double topAd;
@property (nonatomic, assign) double urgent;
@property (nonatomic, strong) NSString *previewUrl;
@property (nonatomic, strong) NSString *created;
@property (nonatomic, strong) NSArray *subtitle;
@property (nonatomic, assign) double isPriceNegotiable;
@property (nonatomic, strong) NSString *numericUserId;
@property (nonatomic, assign) double promotionSection;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) BOOL mapShowDetailed;
@property (nonatomic, strong) NSString *priceNumeric;
@property (nonatomic, assign) double hasEmail;
@property (nonatomic, strong) NSString *adsDescription;
@property (nonatomic, strong) NSString *mapZoom;
@property (nonatomic, strong) NSString *cityLabel;
@property (nonatomic, strong) NSString *mapLat;
@property (nonatomic, strong) NSArray *params;
@property (nonatomic, strong) NSArray *featured;
@property (nonatomic, strong) NSString *person;
@property (nonatomic, strong) NSString *userAdsId;
@property (nonatomic, strong) NSString *pricePrevious;
@property (nonatomic, strong) NSString *mapLocation;
@property (nonatomic, strong) NSString *listLabelAd;
@property (nonatomic, assign) double highlighted;
@property (nonatomic, strong) NSString *socialNetworkAccountType;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *regionId;
@property (nonatomic, strong) NSString *priceType;
@property (nonatomic, assign) double business;
@property (nonatomic, strong) NSString *userAdsUrl;
@property (nonatomic, strong) NSString *mapLon;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, assign) double hideUserAdsButton;
@property (nonatomic, assign) double age;
@property (nonatomic, strong) NSString *headerType;
@property (nonatomic, strong) NSString *cityId;
@property (nonatomic, strong) NSString *header;
@property (nonatomic, assign) double mapRadius;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double categoryId;
@property (nonatomic, strong) ADPhotos *photos;
@property (nonatomic, strong) NSString *userPhoto;
@property (nonatomic, assign) NSString *campaignSource;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
