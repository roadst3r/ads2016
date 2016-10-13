//
//  ADTableViewCell.m
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import "ADTableViewCell.h"

@implementation ADTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
        
    self.contentView.backgroundColor = [UIColor clearColor];
    self.contentView.layer.shadowOpacity = 0.1;
    self.contentView.layer.shadowOffset = CGSizeMake(0, 0);
    self.contentView.layer.shadowRadius = 3;
    self.contentView.layer.masksToBounds = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)shareButtonPressed:(id)sender {
    
    [self.delegate shareActionForIndexPath: _buttonIndexPath sender:sender];
    
}



@end
