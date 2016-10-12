//
//  StringServer.m
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import "StringServer.h"

@implementation StringServer

+ (NSString*)stringFromList:(NSString*)list key:(NSString*)key {
    
    NSString *ws = [[NSBundle mainBundle] pathForResource:list ofType:@"plist"];
    NSDictionary *wsDic = [[NSDictionary alloc] initWithContentsOfFile: ws];
    
    NSString *s = wsDic[key];
    
    return s;
}

+ (BOOL)boolFromList:(NSString*)list key:(NSString*)key {
    
    NSString *ws = [[NSBundle mainBundle] pathForResource:list ofType:@"plist"];
    NSDictionary *wsDic = [[NSDictionary alloc] initWithContentsOfFile: ws];
    
    return [[wsDic objectForKey: key] boolValue];
}

+ (int)integerFromList:(NSString*)list key:(NSString*)key {
    
    NSString *ws = [[NSBundle mainBundle] pathForResource:list ofType:@"plist"];
    NSDictionary *wsDic = [[NSDictionary alloc] initWithContentsOfFile: ws];
    
    return (int)[[wsDic objectForKey: key] integerValue];
}

+ (float)floatFromList:(NSString*)list key:(NSString*)key {
    
    NSString *ws = [[NSBundle mainBundle] pathForResource:list ofType:@"plist"];
    NSDictionary *wsDic = [[NSDictionary alloc] initWithContentsOfFile: ws];
    
    return (float)[[wsDic objectForKey: key] floatValue];
}

@end
