//
//  MyTableViewCell.h
//  text1
//
//  Created by mac on 16/1/30.
//  Copyright © 2016年 koala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *bgImage;

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *proLabel;

//+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
