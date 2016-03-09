//
//  ScrollerViewController.m
//  项目三
//
//  Created by huiwen on 16/2/22.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "ScrollerViewController.h"
#import "MainModel.h"
#import <objc/runtime.h>
@interface ScrollerViewController ()
{
    NSString *str;

}
@end

@implementation ScrollerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BreadTrip/poi_bg_placeholder@2x.png"]];
    
    }
- (void)_creatWebView{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth , kScreenHeight)];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    
    [webView loadRequest:request];
    [self.view addSubview:webView];


}
- (void)setHtml_url:(NSString *)html_url{
    if (_html_url != html_url) {
        str = html_url;
        [self _creatWebView];

    }


}
- (void)setMain:(MainModel *)main{
    if (_main != main) {
        _main = main;
        
        [self _creatAll:main];
    }

}
- (void)_creatAll:(MainModel *)main{

    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth , kScreenHeight)];
    NSString *num = [NSString stringWithFormat:@"http://web.breadtrip.com/btrip/spot/%@/?btid=2384095298&sns_share=202&from=singlemessage&isappinstalled=1",main.spot_id];
    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:num]];
    
    [webView loadRequest:request];
    [self.view addSubview:webView];
   
}
- (void)setUrl:(NSString *)url{
    if (_url != url) {
        _url = url;
        
       // NSLog(@"%@",url);
        [self _creatThirdView:url];
    }


}
- (void)_creatThirdView:(NSString *)url{

    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth , kScreenHeight)];
    NSString *num = [NSString stringWithFormat:@"http://web.breadtrip.com/btrip/spot/%@/?btid=2384095298&sns_share=202&from=singlemessage&isappinstalled=1",url];
    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:num]];
    
    [webView loadRequest:request];
    [self.view addSubview:webView];

}
- (void)setCellUrl:(NSString *)cellUrl{

    _cellUrl = cellUrl;
    
    [self _creatCellView:cellUrl];

}
- (void)_creatCellView:(NSString *)cellUrl{
UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth , kScreenHeight)];

    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:cellUrl]];
    
    [webView loadRequest:request];
    [self.view addSubview:webView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
