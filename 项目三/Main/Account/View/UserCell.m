//
//  UserCell.m
//  text1
//
//  Created by mac on 16/2/20.
//  Copyright © 2016年 koala. All rights reserved.
//

#import "UserCell.h"

@interface UserCell () <UITextFieldDelegate>

@end

@implementation UserCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 70, 50)];
        typeLabel.font = [UIFont systemFontOfSize:13];
        typeLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:typeLabel];
        self.typeLabel = typeLabel;
        
        UITextField *nameTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 5, 50)];
        nameTextFiled.textAlignment = NSTextAlignmentRight;
        nameTextFiled.font = [UIFont systemFontOfSize:12];
        nameTextFiled.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:nameTextFiled];
        self.nameTextFiled = nameTextFiled;
        nameTextFiled.delegate = self;
        nameTextFiled.hidden = YES;
        
        
        UILabel *genderLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 5, 200, 50)];
        genderLabel.font = [UIFont systemFontOfSize:13];
        genderLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:genderLabel];
        self.genderLabel = genderLabel;
        genderLabel.hidden = YES;
        
        
    }
    return self;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
