//
//  MainNavigationController.m
//  项目三
//
//  Created by 汇文1 on 16/1/29.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *bgImg = [UIImage imageNamed:@"navbar_blank"];
    CGImageRef imageRef = CGImageCreateWithImageInRect(bgImg.CGImage, CGRectMake(0, 0, kScreenWidth, 64));
    [self.navigationBar setBackgroundImage:[UIImage imageWithCGImage:imageRef] forBarMetrics:UIBarMetricsDefault];
    
    CGImageRelease(imageRef);
    UIColor *titleColor = [UIColor whiteColor];
    NSDictionary *textAttr = @{
                               NSForegroundColorAttributeName : titleColor,
                               NSFontAttributeName : [UIFont boldSystemFontOfSize:18]
                               };
    self.navigationBar.titleTextAttributes = textAttr;

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
