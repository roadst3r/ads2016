//
//  ADPageViewController.m
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import "ADPageViewController.h"

@interface ADPageViewController ()




@end

@implementation ADPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ADsPageViewController"];
    self.pageViewController.dataSource = self;
    
    ADDetailsViewController *startingViewController = [self viewControllerAtIndex: [_ads indexOfObject: _selectedAD]];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ADDetailsViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ADDetailsViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.ads count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (ADDetailsViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.ads count] == 0) || (index >= [self.ads count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    ADDetailsViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ADDetailsViewController"];
    pageContentViewController.ad = self.ads[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

@end
