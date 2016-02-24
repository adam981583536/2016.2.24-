//
//  HostViewController.m
//  项目三
//
//  Created by 汇文1 on 16/2/10.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "HostViewController.h"

@interface HostViewController ()

@end

@implementation HostViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"体验详情";
    [self _createrLeftButton];
    [self _createrWebView];
    
}
- (void)_createrWebView
{

    _project_id = self.model1.product_id;
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:webView];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://web.breadtrip.com/hunter/product/%@/?bts=app_tab",_project_id]]];
    [webView loadRequest:request];
}
- (void)_createrLeftButton
{
    UIButton *BackButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,20,20)];

    
    [BackButton setImage:[UIImage imageNamed:@"gallery_back.png"] forState:UIControlStateNormal];
    BackButton.tag = 123;
    [BackButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:BackButton];
    
    self.navigationItem.leftBarButtonItem = item;

}
- (void)buttonAction:(UIButton *)button
{
    if (button.tag == 123) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
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
