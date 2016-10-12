//
//  ADRequest.h
//
//  Created by Bruno Tereso on 12/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ADRequest : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double totalPages;
@property (nonatomic, assign) double adsOnPage;
@property (nonatomic, strong) NSString *nextPageUrl;
@property (nonatomic, strong) NSArray *ads;
@property (nonatomic, assign) double page;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
