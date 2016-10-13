//
//  ADMapTableViewCell.h
//  ads2016
//
//  Created by Bruno Tereso on 13/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "AdGenericTableViewCell.h"

@interface ADMapTableViewCell : AdGenericTableViewCell

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
