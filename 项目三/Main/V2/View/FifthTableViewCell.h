//
//  FifthTableViewCell.h
//  项目三
//
//  Created by huiwen on 16/2/19.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainModel;
@interface FifthTableViewCell : UITableViewCell
@property (nonatomic, strong) MainModel *model;
@property (weak, nonatomic) IBOutlet UILabel *type7SubLabel;
@property (weak, nonatomic) IBOutlet UIImageView *Image;
//@property (nonatomic , strong)NSMutableArray *arr;
@property (weak, nonatomic) IBOutlet UILabel *type7Label;

@property (weak, nonatomic) IBOutlet UILabel *BigTitle;

@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *by;
@property (weak, nonatomic) IBOutlet UILabel *userName;

@property (weak, nonatomic) IBOutlet UIImageView *blueImage;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *lable2;

@end
