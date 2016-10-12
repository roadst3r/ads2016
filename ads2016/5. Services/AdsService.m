//
//  AdsService.m
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import "AdsService.h"

@implementation AdsService


+ (void)getADsForPage:(NSInteger)page category:(double)category withBlock:(void (^)(id, NSError *))block{
    
    
    AFHTTPSessionManager *manager = [[ServiceManager shared] mainSessionManager];
    
    NSString *ws =  [NSString stringWithFormat: [StringServer stringFromList:@"WebService" key:@"WS_POINT_ADS"], category];
    
    //check if there's a previous request
    NSString *previousRequest = [MainManager shared].dataManager.adRequest.nextPageUrl;
    if (previousRequest){
        ws = previousRequest;
    }
    
    [manager GET: ws parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (block) {
            block(responseObject, nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (block){
            block(nil, error);
        }
    }];
}

@end
