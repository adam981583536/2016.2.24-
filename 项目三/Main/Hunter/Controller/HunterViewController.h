//
//  HunterViewController.h
//  项目三
//
//  Created by 汇文1 on 16/2/1.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HunterViewController : UIViewController
@property(nonatomic,copy)NSString *cityName;
@property(nonatomic,copy)NSString *cityID;
@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic,strong)HunterModel *model;
@property(nonatomic,copy)NSString *way;
@property(nonatomic,strong)UIView *SequenceView;

@end
