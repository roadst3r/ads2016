//
//  ADTableViewCell.h
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ADCellDelegate <NSObject>
- (void)shareActionForIndexPath :(NSIndexPath *)indexPath sender:(id)sender;
@end

@interface ADTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

//Manual Properties
@property (strong, nonatomic) NSIndexPath *buttonIndexPath;

//Delegate
@property (nonatomic, weak) id <ADCellDelegate> delegate;

@end
