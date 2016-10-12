//
//  ADsTableViewController.m
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import "ADsTableViewController.h"
#import "ADTableViewCell.h"

#define ADCellIdentifier    @"ADCell"

@interface ADsTableViewController () {
    
    double _selectedAD;
}

@end

@implementation ADsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self setupTable];
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear: animated];
    [self loadDataForPage:1];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView configurations
- (void)setupTable{
    
    UINib *nib = [UINib nibWithNibName:@"ADTableViewCell" bundle:nil];
    [[self tableView] registerNib:nib forCellReuseIdentifier: ADCellIdentifier];
    
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
        
        [self.refreshControl endRefreshing];
        [self.tableView reloadData];
        
    } fail:^(NSError *error) {
        
        [self.refreshControl endRefreshing];
        //show error
    }];
    

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [MainManager shared].dataManager.adRequest.ads.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ADTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: ADCellIdentifier];
    ADAds *ad = [[MainManager shared].dataManager.adRequest.ads objectAtIndex: indexPath.row];
    
    cell.titleLabel.text = ad.title;
    
    return cell;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
