//
//  MyVIew.m
//  项目三
//
//  Created by huiwen on 16/2/18.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "MyVIew.h"
#import "MainModel.h"
#import "SDImageCache.h"
@implementation MyVIew

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setModel:(MainModel *)model{
    _model = model;

    _smallTitle.text = _model.index_title;
    _smallTitle.font = [UIFont systemFontOfSize:13];
    _smallTitle.numberOfLines = 0;
    NSURL *imageUrl = [NSURL URLWithString:_model.index_cover];
  //  NSLog(@"%@",imageUrl);
    [_imageVIew sd_setImageWithURL:imageUrl];
    _name.text = _model.name;
    _name.textAlignment = 0;
    _name.font = [UIFont systemFontOfSize:11];
    NSURL *userUrl = [NSURL URLWithString:_model.avatar_s];
    
    [_userImage sd_setImageWithURL:userUrl];
    _userImage.layer.cornerRadius = _userImage.frame.size.height/2;
    _userImage.layer.masksToBounds = YES;
    
    if ([_model.location_alias isEqualToString:@""]) {
        if (_model.poiName != nil) {
            _hehe.text = model.poiName;
            _hehe.textColor = [UIColor whiteColor];
            _hehe.font = [UIFont systemFontOfSize:10];

        }else{
        
            _hehe.hidden = YES;
        }
    }else{
        _hehe.text = model.location_alias;
        _hehe.textColor = [UIColor whiteColor];
        _hehe.font = [UIFont systemFontOfSize:10];


    }
    
    
}
@end
