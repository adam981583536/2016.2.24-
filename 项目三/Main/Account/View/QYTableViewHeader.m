//
//  QYTableViewHeader.m
//  导航栏渐变效果与头部视图放大集合
//
//  Created by apple on 16/1/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "QYTableViewHeader.h"

@implementation QYTableViewHeader
{
    CGRect  initFrame;
    CGFloat defaultViewHeight;
    CGRect   subViewsFrame;
}
-(void)goodMenWithTableView:(UITableView *)tableView andBackGroundView:(UIView *)view andSubviews:(UIView *)subviews
{
    
    _tableView=tableView;
    _bigImageView=view;
    _touXiangImageView=subviews;
    initFrame=_bigImageView.frame;
     defaultViewHeight  = initFrame.size.height;
    subViewsFrame=_touXiangImageView.frame;
   
     _touXiangImageView.layer.cornerRadius=_touXiangImageView.frame.size.width/2;
    UIView* heardView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
    self.tableView.tableHeaderView=heardView;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 260, 100, 30)];
    titleLabel.text = @"游记&故事集";
    titleLabel.textColor = [UIColor grayColor];
    titleLabel.font = [UIFont systemFontOfSize:15];

    [_tableView addSubview:_bigImageView];
    [_tableView addSubview:_touXiangImageView];
    [_tableView addSubview:titleLabel];
    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect f     = _bigImageView.frame;
    f.size.width = _tableView.frame.size.width;
    _bigImageView.frame  = f;
    
    if (scrollView.contentOffset.y<0) {
        CGFloat offset = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
       
        initFrame.origin.x= - offset /2;
        initFrame.origin.y= - offset;
        initFrame.size.width=_tableView.frame.size.width+offset;
        initFrame.size.height=defaultViewHeight+offset;
        _bigImageView.frame=initFrame;
        
        [self viewDidLayoutSubviews:offset/2];
       
        
    }
    
    
}
- (void)viewDidLayoutSubviews:(CGFloat)offset
{
    _touXiangImageView.frame=CGRectMake(0, 0, 80+offset, 80+offset);
    _touXiangImageView.center=CGPointMake(_bigImageView.center.x, _bigImageView.center.y);
     _touXiangImageView.layer.cornerRadius=_touXiangImageView.frame.size.width/2;


}
- (void)resizeView
{
    initFrame.size.width = _tableView.frame.size.width;
    _bigImageView.frame = initFrame;
    
}
@end
