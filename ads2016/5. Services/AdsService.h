//
//  AdsService.h
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdsService : NSObject

+ (void)getADsWithBlock:(void (^)(id, NSError *))block;

@end
