//
//  Type4ViewController.m
//  项目三
//
//  Created by huiwen on 16/2/22.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "Type4ViewController.h"
#import "MainModel.h"
#import <ShareSDK/ShareSDK.h>
//#import <ShareSDKUI/ShareSDK+SSUI.h>
@interface Type4ViewController ()

@end

@implementation Type4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //  NSLog(@"进到4了");
    //
    //    [self.navigationController.navigationBar setBackgroundColor:[UIColor lightGrayColor]];
    
    [self _creatBack];
    
    [self _creatTableView];
}
- (void)_creatTableView{
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setType4Id:(NSNumber *)type4Id{
    
    
    _type4Id = type4Id;
    //  NSLog(@"%@",type4Id);
    [self _loadData:type4Id];
    
    
    
}
- (void)_creatBack{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    
    // button.backgroundColor = [UIColor blueColor];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_share_button_image_hl@2x~ipad.png"] forState:UIControlStateNormal];
    
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    
    self.navigationItem.rightBarButtonItem = item;
    
}

- (void)_loadData:(NSNumber *)num{
    _covered_countriesArr = [[NSMutableArray alloc] init];
    NSURLSessionConfiguration   *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSString *string = [NSString stringWithFormat:@"http://api.breadtrip.com/trips/%@/waypoints/",num];
    
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request= [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *download = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        //NSLog(@"%@",response);
        // NSLog(@"%@",responseObject);
        MainModel *main = [[MainModel alloc] init];
        
        main.trackpoints_thumbnail_image = [responseObject objectForKey:@"trackpoints_thumbnail_image"];
        // NSLog(@"%@",main.trackpoints_thumbnail_image);
        
        
    }];
    [download resume];
    
}
- (void)buttonPress:(UIButton *)sender{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"tabbar_share_button_image_hl@2x~ipad" ofType:@"png"];
    
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
                                       defaultContent:@"测试一下"
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"ShareSDK"
                                                  url:@"http://www.mob.com"
                                          description:@"这是一条测试信息"
                                            mediaType:SSPublishContentMediaTypeNews];
    //创建弹出菜单容器
    
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    //弹出分享菜单
    [ShareSDK showShareActionSheet:container
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions:nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                if (state == SSResponseStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%ld,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
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
