//
//  AllCollectionViewCell.m
//  项目三
//
//  Created by huiwen on 16/2/21.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "AllCollectionViewCell.h"
#import "MainModel.h"
@implementation AllCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setMain:(MainModel *)main{
    if (_main != main) {
        _main = main;
        _userImage.layer.cornerRadius = _userImage.frame.size.height/2;
        _userImage.layer.masksToBounds = YES;
        [_allImage sd_setImageWithURL:[NSURL URLWithString:main.index_cover]];
        [_userImage sd_setImageWithURL:[NSURL URLWithString:main.avatar_s]];
        
        _userName.text = main.userName;
        _titleLabel.text = main.index_title;
        
        _userName.textColor = [UIColor lightGrayColor];
        _userName.font = [UIFont systemFontOfSize:11];
        
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.numberOfLines = 0;
        
        if (main.location_alias.length != 0 ) {
            _hehe.hidden = NO;
            _hehe.text = main.location_alias;
            _hehe.textColor = [UIColor whiteColor];
            _hehe.font = [UIFont systemFontOfSize:11];
            
        }else{
            _hehe.hidden = YES;
        }
    }


}
@end
