//
//  ADDescriptionTableViewCell.m
//  ads2016
//
//  Created by Bruno Tereso on 13/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import "ADDescriptionTableViewCell.h"

@implementation ADDescriptionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupSize{
    
    [self setFrame: CGRectMake(self.frame.origin.x, self.frame.origin.y, SCREEN_WIDTH, self.frame.size.height)];
    
    [_descLabel setFrame: CGRectMake(_descLabel.frame.origin.x,
                                      _descLabel.frame.origin.y,
                                      SCREEN_WIDTH - LABEL_MARGIN,
                                      _descLabel.frame.size.height)];
    [_descLabel sizeToFit];
    
    self.cellHeight = _descLabel.frame.origin.y + _descLabel.frame.size.height + 20;
}


@end
