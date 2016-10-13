//
//  ADPriceTableViewCell.h
//  ads2016
//
//  Created by Bruno Tereso on 13/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdGenericTableViewCell.h"

@interface ADPriceTableViewCell : AdGenericTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userOnlineLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@end
