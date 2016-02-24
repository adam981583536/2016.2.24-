//
//  ScrollViewTableViewCell.m
//  项目三
//
//  Created by 汇文教育 on 16/2/3.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "ScrollViewTableViewCell.h"
#import "MainModel.h"
@implementation ScrollViewTableViewCell{

    UIScrollView *_scrollView;
    UIPageControl *_myPage;

}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self _creatSroView];
    }
    
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self _creatSroView];
    }
    return self;
}
- (void)_creatSroView{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth,self.bounds.size.height)
               ];
  //  NSLog(@"%f",self.bounds.size.height);
    
    _scrollView.contentSize =  CGSizeMake(kScreenWidth * _arr.count, self.bounds.size.height);

    _scrollView.backgroundColor = [UIColor clearColor];

    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    
    [self _creatImageView];
    

    
    

}
- (void)_creatImageView{
    
    for (int i = 0; i < _arr.count; i ++) {
                MainModel *main = [[MainModel alloc] init];
        main = _arr[i];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*kScreenWidth, 0, kScreenWidth, self.bounds.size.height)];
        NSURL *imageURL = [NSURL URLWithString:main.image_url];
        [imageView sd_setImageWithURL:imageURL];
        
        
        imageView.userInteractionEnabled = YES;//可接受点击事件
        imageView.tag = 300 +i;
        UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonpress:)];
        
        
        [imageView addGestureRecognizer:singleTap1];
        
        [_scrollView addSubview:imageView];
        
        
        
    }
    

    if (_arr.count != 0) {
        _myPage = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 30, kScreenWidth, 20)];
        _myPage.numberOfPages = _arr.count;
        // myPage.backgroundColor = [UIColor grayColor];
        _myPage.tag = 117;
        
        _myPage.transform = CGAffineTransformMakeScale(1.35, 1.35);
        [_myPage addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventTouchUpInside];
      //  NSLog(@"1");
    }
    
    [self addSubview:_scrollView];
    [self addSubview:_myPage];


}
//点击事件的时候跳转
- (void)buttonpress:(UITapGestureRecognizer *)sender{
   // NSLog(@"%ld",sender.view.tag);
    MainModel *main = [[MainModel alloc] init];
    
    main = _arr[sender.view.tag - 300];
    
    self.returnBlock(main.html_url);
        //NSLog(@"%@",main.html_url);
    
}
//block块相应


//按钮响应
- (void)pageAction:(UIPageControl *)page
{
  //  NSLog(@"%ld",page.tag);
    _scrollView.contentOffset = CGPointMake(page.currentPage * kScreenWidth, 0);
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int x = _scrollView.contentOffset.x/kScreenWidth;
    
    //UIPageControl *page = (UIPageControl *)[self viewWithTag:117];
    _myPage.currentPage = x;


}
- (void)awakeFromNib {
    // Initialization code
}
- (void)setArr:(NSMutableArray *)arr{
    

        
        _arr = arr;
        [self _creatSroView];

    

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
