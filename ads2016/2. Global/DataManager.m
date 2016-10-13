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
        self.adRequest = [[ADRequest alloc] init];
    }
    return self;
}


- (void)storeAds:(NSDictionary*)dict {
    
    if (!dict) return;
    
    NSMutableArray *adsList = [NSMutableArray array];
    
    //get previous adds if they exust
    //previous adds
    if (self.adRequest.ads.count > 0) {
        [adsList addObjectsFromArray: self.adRequest.ads];
    }
    
    //add new ADs
    ADRequest *thisRequest = [[ADRequest alloc] initWithDictionary: dict];
    [adsList addObjectsFromArray: thisRequest.ads];
    
    self.adRequest.nextPageUrl = thisRequest.nextPageUrl;
    self.adRequest.page = thisRequest.page;
    self.adRequest.ads = [NSArray arrayWithArray: adsList];
    self.adRequest.totalPages = thisRequest.totalPages;
    
    [self saveDataToDisk];
}



#pragma mark Disk access

- (void)saveDataToDisk {
    
    NSString *appFile = [self dataFileURL];
    NSMutableArray *myObject=[NSMutableArray array];
    [myObject addObject: self.adRequest];
    
    [NSKeyedArchiver archiveRootObject:myObject toFile:appFile];
}

- (void)loadDataFromDisk {
    
    NSString *appFile = [self dataFileURL];
    self.adRequest = [[ADRequest alloc] init];
    NSMutableArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:appFile];
    
    self.adRequest = (ADRequest*)[array objectAtIndex:0];
}

- (NSString*)dataFileURL {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"data"];
}
@end
