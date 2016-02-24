//
//  Type12ViewController.m
//  项目三
//
//  Created by huiwen on 16/2/22.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "Type12ViewController.h"

@interface Type12ViewController ()

@end

@implementation Type12ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"进到12了");
 //   self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BreadTrip/poi_bg_placeholder@2x.png"]];
   // self.view.backgroundColor = [UIColor blackColor];
    [self _creatBack];
    
}

- (void)_creatBack{
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(15, 15, 20, 20)];
    [button setImage:[UIImage imageNamed:@"BreadTrip/add_new_poi_back_btn@2x.png"] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(buttonPress) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:button];
    

}
- (void)buttonPress{
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
