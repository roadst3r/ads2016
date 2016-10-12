//
//  ADDetailsViewController.m
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import "ADDetailsViewController.h"
#import "ADDetailsTableViewCell.h"
#import "ADPhotoTableViewCell.h"
#import "ADDescriptionTableViewCell.h"
#import "ADMapTableViewCell.h"
#import "ADPriceTableViewCell.h"

@interface ADDetailsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ADDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.layer.shadowOpacity = 0.1;
    self.tableView.layer.shadowOffset = CGSizeMake(0, 0);
    self.tableView.layer.shadowRadius = 3;
    self.tableView.layer.masksToBounds = NO;
    
    [self.tableView setContentInset:UIEdgeInsetsMake(0, 16, 0, 0)]; // 108 is only example
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
        {
            ADDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"DetailsTitleCell"];
            cell.titleLabel.text = _ad.title;
            cell.locationLabel.text = _ad.cityLabel;
            cell.timeLabel.text = _ad.created;
            
            return cell;
            
            break;
        }
        case 1:
        {
            ADPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"DetailsPhotoCell"];
            
            return cell;
            
            break;
        }
        case 2:
        {
            ADDescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"DetailsDescriptionCell"];
            
            NSString *myNewLineStr = @"\n";
            NSString *desc = _ad.adsDescription;
            desc = [desc stringByReplacingOccurrencesOfString:@"\\n" withString:myNewLineStr];
            cell.descLabel.text = desc;
            
            return cell;
            
            break;
        }
        case 3:
        {
            ADMapTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"DetailsMapCell"];
            
            return cell;
            
            break;
        }
        case 4:
        {
            ADPriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"DetailsPriceCell"];
            cell.priceLabel.text = [_ad.priceNumeric stringByAppendingString: @"€"];
            
            return cell;
            
            break;
        }
        default:
            break;
    }
    
    return nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
        {
            ADDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"DetailsTitleCell"];
            cell.titleLabel.text = _ad.title;
            [cell.titleLabel sizeToFit];
            cell.locationLabel.text = _ad.cityLabel;
            cell.timeLabel.text = _ad.created;
            
            return cell.titleLabel.frame.size.height + 28;
            
            break;
        }
        case 1:
        {
            return 160;
            
            break;
        }
        case 2:
        {
            ADDescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"DetailsDescriptionCell"];
            NSString *myNewLineStr = @"\n";
            NSString *desc = _ad.adsDescription;
            desc = [desc stringByReplacingOccurrencesOfString:@"\\n" withString:myNewLineStr];
            cell.descLabel.text = desc;
            
            [cell.descLabel sizeToFit];
            
            return cell.descLabel.frame.size.height + 45;
            
            break;
        }
        case 3:
        {
            return 120;
            break;
        }
        case 4:
        {
            
            return 50;
            break;
        }
        default:
            break;
    }
    
    return 0;
}

@end
