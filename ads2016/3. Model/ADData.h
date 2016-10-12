//
//  ADData.h
//
//  Created by Bruno Tereso on 12/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ADData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double slotId;
@property (nonatomic, assign) double w;
@property (nonatomic, assign) double h;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
