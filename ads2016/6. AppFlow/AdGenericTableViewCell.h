//
//  AdGenericTableViewCell.h
//  ads2016
//
//  Created by Bruno Tereso on 13/10/16.
//  Copyright © 2016 Bruno Tereso. All rights reserved.
//

#import <UIKit/UIKit.h>


#define LABEL_MARGIN (30*2)

@interface AdGenericTableViewCell : UITableViewCell

//calculated
@property (assign, nonatomic) float cellHeight;

- (void)setupSize;


@end
