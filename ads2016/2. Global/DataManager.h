//
//  DataManager.h
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataModels.h"

@interface DataManager : NSObject

+ (instancetype)shared;


@property (strong, nonatomic) ADRequest *adRequest;


-(void)storeAds:(NSDictionary*)dict;


- (void)saveDataToDisk;
- (void)loadDataFromDisk;

@end
