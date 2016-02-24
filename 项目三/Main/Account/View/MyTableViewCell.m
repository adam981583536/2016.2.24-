//
//  MyTableViewCell.m
//  text1
//
//  Created by mac on 16/1/30.
//  Copyright © 2016年 koala. All rights reserved.
//

#import "MyTableViewCell.h"



@implementation MyTableViewCell


- (void)awakeFromNib {
    // Initialization code
    
    self.bgImage.layer.cornerRadius = 5;
    self.bgImage.clipsToBounds = YES;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
