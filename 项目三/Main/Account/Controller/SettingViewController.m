//
//  SettingViewController.m
//  text1
//
//  Created by mac on 16/2/13.
//  Copyright © 2016年 koala. All rights reserved.
//

#import "SettingViewController.h"
#import "UserTableViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"设置";
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"退出" style:UIBarButtonItemStylePlain target:self action:@selector(_setOut)];
    
    self.navigationItem.rightBarButtonItem = rightItem;

    self.iconImage.layer.cornerRadius = self.iconImage.frame.size.width * 0.5;
    self.iconImage.clipsToBounds = YES;
    
}

- (void)_setOut
{
    
}

- (IBAction)charactor:(id)sender {
    
    UserTableViewController *user = [[UserTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
//    user.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:user animated:YES];
}

- (IBAction)addFriend:(id)sender {
}

- (IBAction)fixAccount:(id)sender {
}

- (IBAction)pushNotifi:(id)sender {
}

- (IBAction)linkSocial:(id)sender {
}

- (IBAction)clear:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: nil message:@"确定要清除缓存吗？" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (IBAction)about:(id)sender {
}

- (IBAction)feedback:(id)sender {
}
@end
