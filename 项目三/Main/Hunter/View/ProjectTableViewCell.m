//
//  ProjectTableViewCell.m
//  项目三
//
//  Created by 汇文1 on 16/2/8.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "ProjectTableViewCell.h"

#import "UIImageView+WebCache.h"
@implementation ProjectTableViewCell
- (void)awakeFromNib {
    // Initialization code
    _personImage.layer.masksToBounds = YES;
    _titleImage.layer.masksToBounds = YES;
    _titleImage.layer.cornerRadius = 10;
    _personImage.layer.cornerRadius = self.personImage.frame.size.width/2;
//    CGFloat width = 50;
//    for (int i = 0; i < _themeArray.count; i++) {
//        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10+(width+10)*i, 290, width, 24)];
//        imageView.contentMode = UIViewContentModeScaleAspectFit;
//        imageView.backgroundColor = [UIColor blackColor];
//        imageView.image = [UIImage imageNamed:@"dest_around_btn_bg@2x.png"];
//        [self.contentView addSubview:imageView];
//
//        UILabel *themeLaber = [[UILabel alloc]initWithFrame:imageView.bounds];
//        themeLaber.backgroundColor = [UIColor clearColor];
//        themeLaber.font = [UIFont systemFontOfSize:15];
//        themeLaber.text = _themeArray[i];
//        [imageView addSubview:themeLaber];
//        
//    }
//    
}
@synthesize laber= _laber;
- (UILabel *)laber
{
    if (!_laber) {
        
    
    CGFloat width = 50;
    
    for (int i = 0; i <_themeArray.count;  i++) {
        _laber = [[UILabel alloc]initWithFrame:CGRectMake(10+(width+10)*i, 280, width, 30)];
        _laber.backgroundColor = [UIColor clearColor];
        _laber.text = _themeArray[i];
        NSLog(@"%@",_laber.text);
        _laber.font = [UIFont systemFontOfSize:10];
        _laber.textColor = [UIColor grayColor];
        [self.contentView addSubview:_laber];
    }}
    return _laber;
}
- (void)setModel:(HunterModel *)model
{
    if (_model!=model) {
        _model = model;
        [_titleImage sd_setImageWithURL:[NSURL URLWithString:_model.title_page]];

        _title.text = _model.title;
//        _personImage.layer.cornerRadius = _personImage.frame.size.width/2;
        [_personImage sd_setImageWithURL:[NSURL URLWithString:_model.avatar_l]];
        _money.text = [NSString stringWithFormat:@"￥%@",_model.price];
        _like.text = [NSString stringWithFormat:@"%@人喜欢",_model.like_count];
        _themeArray = self.model.themeArr;

    }
    [self laber];
}
//- (void)setModel1:(HunterModel *)model1
//{
//    if (_model != model1) {
//        _model = model1;
//        _project_id = _model1.product_id;
//    }
//}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
