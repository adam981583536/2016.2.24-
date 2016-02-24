//
//  UserTableViewController.m
//  text1
//
//  Created by mac on 16/2/20.
//  Copyright © 2016年 koala. All rights reserved.
//

#import "UserTableViewController.h"
#import "UserCell.h"

@interface UserTableViewController ()

@end

@implementation UserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithRed:250 green:245 blue:232 alpha:1];
//    self.view.backgroundColor = [UIColor colorWithRed:183 green:255 blue:247 alpha:1];
    
    self.title = @"个人信息";
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 4;
    }else {
        return 2;
    }
        
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UserCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            cell.typeLabel.text = @"头像";
        }else if (indexPath.row == 1){
            
            cell.typeLabel.text = @"用户名";
            cell.nameTextFiled.text = @"厚厚笑圭人膏";
        }
        
    }else if (indexPath.section == 1){
        
        
        if (indexPath.row == 0) {
            cell.genderLabel.hidden = YES;
            cell.nameTextFiled.hidden = NO;
            cell.typeLabel.text = @"手机号码";
            cell.nameTextFiled.text = @"13165998693";
        }
        else if (indexPath.row == 1) {
            cell.genderLabel.hidden = YES;
            cell.nameTextFiled.hidden = NO;
            cell.typeLabel.text = @"邮箱";
            cell.nameTextFiled.text = @"13165998693@163.com";
        }
        
    }
    else if (indexPath.section == 2){
       
        if (indexPath.row == 0) {
            cell.typeLabel.text = @"地区";
            cell.nameTextFiled.text = @"浙江 杭州";
        }
        else if (indexPath.row == 1){
            
            cell.typeLabel.text = @"性别";
        }
        else if (indexPath.row == 2){
            
            cell.typeLabel.text = @"生日";
        }
        else if (indexPath.row == 3){
            
            cell.typeLabel.text = @"个性签名";
        }
        
    }
    return cell;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

