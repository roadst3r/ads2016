//
//  ADPhotoTableViewCell.h
//  ads2016
//
//  Created by Bruno Tereso on 13/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdGenericTableViewCell.h"

@interface ADPhotoTableViewCell : AdGenericTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIButton *photosButton;

@end
