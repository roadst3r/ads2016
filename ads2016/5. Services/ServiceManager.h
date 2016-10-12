//
//  ServiceManager.h
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceManager : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *mainSessionManager;


+ (instancetype)shared;




- (void)getADsForPage:(NSInteger)page category:(double)category withSucess:(void (^)())sucess fail:(void(^)(NSError *error)) fail;



@end
