//
//  SequenceTableViewCell.m
//  项目三
//
//  Created by 汇文1 on 16/2/19.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "SequenceTableViewCell.h"

@implementation SequenceTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setModel:(HunterModel *)model
{
    _model = model;
    _name.text = self.model.name;
    _myId = self.model.myID;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
