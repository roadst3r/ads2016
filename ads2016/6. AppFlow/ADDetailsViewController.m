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

@interface ADDetailsViewController () {
    
    NSMutableArray *_dummyPhotos;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ADDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.tableView setContentInset:UIEdgeInsetsMake(0, 16, 0, 0)]; // 108 is only example
    
    
    //get fake list of photos
    [self prepareDummyImages];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareDummyImages {
    
    _dummyPhotos = [NSMutableArray array];
    [_dummyPhotos addObject:@"http://img.olx.pt/images_olxpt/891439621_1_750x470_rev0.jpg"];
    [_dummyPhotos addObject:@"http://img.olx.pt/images_olxpt/891439621_2_750x470_rev0.jpg"];
    [_dummyPhotos addObject:@"http://img.olx.pt/images_olxpt/891439621_3_750x470_rev0.jpg"];
    [_dummyPhotos addObject:@"http://img.olx.pt/images_olxpt/891439621_4_750x470_rev0.jpg"];
    
    [_dummyPhotos addObject:@"https://img.olx.pt/images_olxpt/825103433_3_644x461_capa-flip-cover-samsung-galaxy-s4-inteligentes-em-pele-imagens_rev005.jpg"];
    [_dummyPhotos addObject:@"https://img.olx.pt/images_olxpt/825103433_5_1000x700_capa-flip-cover-samsung-galaxy-s4-inteligentes-em-pele-lisboa_rev005.jpg"];
    [_dummyPhotos addObject:@"https://img.olx.pt/images_olxpt/825103433_1_1000x700_capa-flip-cover-samsung-galaxy-s4-inteligentes-em-pele-cascais_rev005.jpg"];
    
    //random photos
    for (int i = 0; i < _dummyPhotos.count; ++i) {
        int nElements = (int)_dummyPhotos.count - i;
        int n = (arc4random() % nElements) + i;
        [_dummyPhotos exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *v = [UIView new];
    [v setBackgroundColor:[UIColor clearColor]];
    return v;
}

- (void)applyShadowToLayer: (CALayer*)layer {
    
    layer.masksToBounds = YES;
    layer.cornerRadius = 5.0f;
    
    layer.shouldRasterize = YES;
    layer.rasterizationScale = UIScreen.mainScreen.scale;
    
    layer.shadowOpacity = 0.05;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowRadius = 2;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
        {
            ADDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"DetailsTitleCell"];
            cell.titleLabel.text = _ad.title;
            cell.locationLabel.text = _ad.cityLabel;
            cell.timeLabel.text = _ad.created;
            
            [self applyShadowToLayer: cell.layer];
            
            return cell;
            
            break;
        }
        case 1:
        {
            ADPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"DetailsPhotoCell"];
            
            [cell.photoImageView sd_setImageWithURL:[NSURL URLWithString: [_dummyPhotos objectAtIndex:0]] placeholderImage:[UIImage imageNamed:@"photoPlaceholder"]];
            
            [self applyShadowToLayer: cell.layer];
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
            
            [self applyShadowToLayer: cell.layer];
            return cell;
            
            break;
        }
        case 4:
        {
            ADMapTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"DetailsMapCell"];
            
            //center map
            CLLocationCoordinate2D coordinate;
            coordinate.latitude = [_ad.mapLat doubleValue];
            coordinate.longitude = [_ad.mapLon doubleValue];
            cell.mapView.centerCoordinate = coordinate;
            cell.mapView.region = MKCoordinateRegionMakeWithDistance(coordinate, 15000, 15000);
            
            //drop a simple Annotation on map
            UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0,0,20,20)];
            v.center = cell.contentView.center;
            UIImage *image = [UIImage imageNamed:@"mapPin"];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            imageView.frame = v.bounds;
            [v addSubview:imageView];
            [cell.contentView addSubview:v];
            
            [self applyShadowToLayer: cell.layer];
            return cell;
            
            break;
        }
        case 3:
        {
            ADPriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"DetailsPriceCell"];
            cell.priceLabel.text = [_ad.priceNumeric stringByAppendingString: @"€"];
            cell.userNameLabel.text = _ad.userLabel;
            cell.userOnlineLabel.text = @"Was online today";
            
            [cell.userImageView sd_setImageWithURL: [NSURL URLWithString: _ad.userPhoto] placeholderImage: [UIImage imageNamed:@"avatarPlaceholder"]];
            
            [self applyShadowToLayer: cell.layer];
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
    
    switch (indexPath.section) {
        case 0:
        {
            ADDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"DetailsTitleCell"];
            cell.titleLabel.text = _ad.title;
            [cell.titleLabel sizeToFit];
            cell.locationLabel.text = _ad.cityLabel;
            cell.timeLabel.text = _ad.created;
            
            [cell setupSize];
            
            return cell.cellHeight;
            
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
            
            [cell setupSize];
            
            return cell.cellHeight;
            
            break;
        }
        case 4:
        {
            return 120;
            break;
        }
        case 3:
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
