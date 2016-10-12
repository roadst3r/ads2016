//
//  MainManager.h
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataManager.h"
#import "ServiceManager.h"

@interface MainManager : NSObject

+ (instancetype)shared;

@property(nonatomic, strong) ServiceManager *serviceManager;
@property(nonatomic, strong) DataManager *dataManager;

@property(nonatomic, assign) BOOL isOnline;

@end
