//
//  StringServer.h
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringServer : NSObject


+ (NSString*)stringFromList:(NSString*)list key:(NSString*)key;
+ (BOOL)boolFromList:(NSString*)list key:(NSString*)key;
+ (int)integerFromList:(NSString*)list key:(NSString*)key;
+ (float)floatFromList:(NSString*)list key:(NSString*)key;

@end
