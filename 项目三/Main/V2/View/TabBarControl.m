//
//  TabBarControl.m
//  项目三
//
//  Created by 汇文教育 on 16/1/28.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "TabBarControl.h"

@implementation TabBarControl
{
    UILabel *_myTitleLabel ;
}
- (instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)image withTitle:(NSString *)title;
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 40)/2 , 3, 40, 30)];
        imgView.image = [UIImage imageNamed:image];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imgView];//添加到这个controller上
        
        //2）创建标题视图
        //getMaxY表示拿到imgView的y方向的最大值
        CGFloat maxY = CGRectGetMaxY(imgView.frame);//添加在最下面
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, maxY-2, frame.size.width, 20)];
        titleLabel.text = title;
        
        titleLabel.textAlignment = NSTextAlignmentCenter;//居中
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont systemFontOfSize:11];
        
        [self addSubview:titleLabel];
        
        
        
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)image withTitleName:(NSString *)title{

    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width - 19 , 3, 30, self.frame.size.height)];
        imgView.image = [UIImage imageNamed:image];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imgView];//添加到这个controller上
        
        //2）创建标题视图
        //getMaxY表示拿到imgView的y方向的最大值
      //  CGFloat maxY = CGRectGetMaxY(imgView.frame);//添加在最下面
        
            _myTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 3, frame.size.width - 10, self.frame.size.height)];
            _myTitleLabel.text = title;
            
            _myTitleLabel.textAlignment = NSTextAlignmentCenter;//居中
            _myTitleLabel.textColor = [UIColor blackColor];
            _myTitleLabel.font = [UIFont systemFontOfSize:14];
            
           // NSLog(@"test");
            [self addSubview:_myTitleLabel];
        
    }
    return self;

}
@end
