//
//  DataManager.m
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+ (instancetype)shared {
    static dispatch_once_t pred;
    static DataManager *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[DataManager alloc] init];
        
    });
    return shared;
}


- (id)init {
    self = [super init];
    if (self) {
        
        //init lists
        
    }
    return self;
}


- (void)storeAds:(NSDictionary*)dict {
    
    if (!dict) return;
    
    //_ads = store ads from WS dict
}

@end
