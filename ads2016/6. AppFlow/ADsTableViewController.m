//
//  ADsTableViewController.m
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import "ADsTableViewController.h"
#import "LoadingMoreTableViewCell.h"
#import "ADPageViewController.h"

#define ADCellIdentifier    @"ADCell"

@interface ADsTableViewController () {
    
    double _selectedAD;
    BOOL _loadingMoreTableViewData;
}

@end

@implementation ADsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _loadingMoreTableViewData = NO;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self setupTable];
    
    [self loadDataForPage:1];
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear: animated];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView configurations
- (void)setupTable{
    
    UINib *nib = [UINib nibWithNibName:@"ADTableViewCell" bundle:nil];
    [[self tableView] registerNib:nib forCellReuseIdentifier: ADCellIdentifier];
    
    UINib *nib2 = [UINib nibWithNibName:@"LoadingMoreTableViewCell" bundle:nil];
    [[self tableView] registerNib:nib2 forCellReuseIdentifier: @"loadingCell"];
    
    
    self.tableView.backgroundColor = [UIColor defaultBackgroundColor];
    
    // Initialize the refresh control.
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor clearColor];
    self.refreshControl.tintColor = [UIColor darkGrayColor];
    [self.refreshControl addTarget:self
                            action:@selector(refreshMessages)
                  forControlEvents:UIControlEventValueChanged];
}


#pragma mark Data loading
- (void)refreshMessages{
    
    [self loadDataForPage:1];
}

- (void)loadDataForPage:(double)nextPageSkip{
    
    [[MainManager shared].serviceManager getADsForPage:nextPageSkip category:25 withSuccess:^{
        
        _loadingMoreTableViewData = NO;
        [self.refreshControl endRefreshing];
        [self.tableView reloadData];
        
    } fail:^(NSError *error) {
        
        _loadingMoreTableViewData = NO;
        [self.refreshControl endRefreshing];
        //show error
    }];
}

- (void)addSomeMoreEntriesToTableView {
    
    //any number except 1 works, not using page number but nextPage url
    [self loadDataForPage: 2];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    ADRequest *request = [MainManager shared].dataManager.adRequest;
    NSUInteger rows = request.ads.count;
    
    if (request.page != request.totalPages)
        rows++;
    
    return rows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;

    //check for last cell and load more
    if (indexPath.row == [MainManager shared].dataManager.adRequest.ads.count) {
        if (!_loadingMoreTableViewData) {
            _loadingMoreTableViewData = YES;
            [self performSelector:@selector(addSomeMoreEntriesToTableView) withObject:nil afterDelay:0.1f];
        }
        
        cell = (LoadingMoreTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"loadingCell"];
        return cell;
        
    } else {
        
        ADTableViewCell *c = [tableView dequeueReusableCellWithIdentifier: ADCellIdentifier];
        ADAds *ad = [[MainManager shared].dataManager.adRequest.ads objectAtIndex: indexPath.row];
        
        c.titleLabel.text = ad.title;
        c.addressLabel.text = ad.cityLabel;
        c.priceLabel.text =  [ad.priceNumeric stringByAppendingString:@"€"];
        c.timeLabel.text = ad.created;
        
        c.delegate = self;
        c.buttonIndexPath = indexPath;
        
        cell = c;
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath: indexPath];
    
    if ([cell isKindOfClass: [ADTableViewCell class]]){
        
        _selectedAD = indexPath.row;
        [self performSegueWithIdentifier:@"showADDetails" sender:tableView];


//implement already read later
//        notification.read = YES;
//        [self.tableView beginUpdates];
//        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
//        [self.tableView endUpdates];
        
        
        
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 96;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"showADDetails"]) {
        
        ADPageViewController *viewController = [segue destinationViewController];
        ADAds *ad = [[MainManager shared].dataManager.adRequest.ads objectAtIndex: _selectedAD];
        viewController.ads = [MainManager shared].dataManager.adRequest.ads;
        viewController.selectedAD = ad;
    }
}


#pragma mark - AD Cell Delegate
-(void)shareActionForIndexPath:(NSIndexPath *)indexPath sender:(id)sender{
    
    ADAds *ad = [[MainManager shared].dataManager.adRequest.ads objectAtIndex: indexPath.row];
    
    NSArray *objectsToShare = @[ad.title, [NSURL URLWithString: ad.url]];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    NSArray *excludeActivities = @[UIActivityTypeAirDrop,
                                   UIActivityTypePrint,
                                   UIActivityTypeAssignToContact,
                                   UIActivityTypeSaveToCameraRoll,
                                   UIActivityTypeAddToReadingList,
                                   UIActivityTypePostToFlickr,
                                   UIActivityTypePostToVimeo];
    
    activityVC.excludedActivityTypes = excludeActivities;
    
    if (IS_IPHONE) {
        [self presentViewController:activityVC animated:YES completion:nil];
    } else {
        activityVC.popoverPresentationController.sourceView = sender;
        
    }
}


@end
