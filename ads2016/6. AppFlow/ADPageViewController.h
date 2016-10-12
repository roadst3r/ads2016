//
//  ADPageViewController.h
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADDetailsViewController.h"

@interface ADPageViewController : UIViewController <UIPageViewControllerDataSource>


@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *ads;
@property (strong, nonatomic) ADAds *selectedAD;

@end
