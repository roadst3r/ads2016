//
//  MainManager.m
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import "MainManager.h"

@implementation MainManager


+ (instancetype)shared {
    static dispatch_once_t pred;
    static MainManager *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[MainManager alloc] init];
        
    });
    return shared;
}


- (id)init {
    self = [super init];
    if (self) {
        
        self.dataManager = [[DataManager alloc] init];
        self.serviceManager = [[ServiceManager alloc] init];
        
        self.isOnline = YES;
    }
    return self;
}

@end
