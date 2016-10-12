//
//  ServiceManager.m
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import "ServiceManager.h"

#import "AdsService.h"

@implementation ServiceManager

@synthesize mainSessionManager = _mainSessionManager;
//@synthesize tokenDetails = _tokenDetails;

+ (ServiceManager *)shared {
    static dispatch_once_t pred;
    static ServiceManager *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[ServiceManager alloc] init];
    });
    return shared;
}

- (id)init {
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(HTTPOperationDidFinish:) name:AFNetworkingTaskDidCompleteNotification object:nil];
        
    }
    return self;
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}


- (void)HTTPOperationDidFinish:(NSNotification *)notification {
    
    if ([MainManager shared].isOnline){
        
        
        NSError *error = [notification.userInfo objectForKey:AFNetworkingTaskDidCompleteErrorKey];
        NSHTTPURLResponse *httpResponse = error.userInfo[AFNetworkingOperationFailingURLResponseErrorKey];
        if (httpResponse.statusCode == 401){
            
            NSLog(@"Error was 401 - Session Expired");
            //handle session expired
                    }
    }
}


#pragma mark - session manager

- (AFHTTPSessionManager *)mainSessionManager {
    
    NSString *token = @"";
    
    if ( _mainSessionManager == nil ) {
        
        NSURL *wsURL = [NSURL URLWithString: [StringServer stringFromList:@"WebService" key:@"WS_URL"]];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = [StringServer floatFromList:@"AppSettings" key:@"timeout"];
        
        _mainSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:wsURL sessionConfiguration:config];
        
        AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        _mainSessionManager.requestSerializer = requestSerializer;
        
        AFHTTPResponseSerializer *responseSerialier = [AFJSONResponseSerializer serializer];
        _mainSessionManager.responseSerializer = responseSerialier;
    }
    [_mainSessionManager.requestSerializer setValue: token forHTTPHeaderField:@"Authorization"];
    
    return _mainSessionManager;
}


#pragma mark ADS Service

- (void)getADsForPage:(NSInteger)page category:(double)category withSuccess:(void (^)())success fail:(void(^)(NSError *error)) fail {
    
    
    [AdsService getADsForPage:page category:category withBlock:^(id responseObject, NSError *err) {
        if (err) {
            //throw error
            fail(err);
        } else {
            
            [[MainManager shared].dataManager storeAds: responseObject];
            success();
        }
        
    }];
    
    
}





@end
