//
//  LoadingMoreTableViewCell.m
//  ads2016
//
//  Created by Bruno Tereso on 12/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import "LoadingMoreTableViewCell.h"

@implementation LoadingMoreTableViewCell



- (void)awakeFromNib {
    [super awakeFromNib];
    [_activityIndicator startAnimating];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [_activityIndicator startAnimating];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
