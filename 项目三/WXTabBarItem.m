//
//  WXTabBarItem.m
//  BJWxhl
//
//  Created by zhangchuning on 15/12/8.
//  Copyright © 2015年 oahgnehzoul. All rights reserved.
//

#import "WXTabBarItem.h"

@implementation WXTabBarItem
{
    UIImageView *imgView;
}
- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)name title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        //1、创建子视图
        //1)图片
        imgView = [[UIImageView alloc] init];
        imgView.image = [UIImage imageNamed:name];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imgView];
        if ([title isEqualToString:@""]) {
            imgView.frame = CGRectMake((frame.size.width - 20)/2, (frame.size.height - 20)/2, 20, 20);
        }else
        {
            imgView.frame = CGRectMake((frame.size.width - 20) / 2, 5, 20, 20);
        }
        //2）创建标题视图
        //getMaxY表示拿到imgView的y方向的最大值
        CGFloat maxY = CGRectGetMaxY(imgView.frame);
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, maxY, frame.size.width, 20)];
        titleLabel.text = title;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:12];
        
        [self addSubview:titleLabel];
        
        
        
        
    }
    return self;
}
@end
