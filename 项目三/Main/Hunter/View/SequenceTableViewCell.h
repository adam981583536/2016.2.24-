//
//  SequenceTableViewCell.h
//  项目三
//
//  Created by 汇文1 on 16/2/19.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SequenceTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (nonatomic,strong)HunterModel *model;
@property (nonatomic,copy)NSString *myId;
@end
