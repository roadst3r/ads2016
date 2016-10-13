//
//  ADDetailsTableViewCell.m
//  ads2016
//
//  Created by Bruno Tereso on 13/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import "ADDetailsTableViewCell.h"

@implementation ADDetailsTableViewCell

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
    
    [_titleLabel setFrame: CGRectMake(_titleLabel.frame.origin.x,
                                     _titleLabel.frame.origin.y,
                                     SCREEN_WIDTH - LABEL_MARGIN,
                                     _titleLabel.frame.size.height)];
    [_titleLabel sizeToFit];
    
    //add TimeLabel height (fixed) + space
    self.cellHeight = _titleLabel.frame.origin.y + _titleLabel.frame.size.height + 36;
}


@end
