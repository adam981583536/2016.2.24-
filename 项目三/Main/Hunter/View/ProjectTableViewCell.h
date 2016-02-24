//
//  ProjectTableViewCell.h
//  项目三
//
//  Created by 汇文1 on 16/2/8.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;
@property (weak, nonatomic) IBOutlet UIImageView *personImage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *like;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (nonatomic,strong)HunterModel *model;
@property (nonatomic,strong)NSArray *themeArray;

@property (nonatomic,copy,readonly)UILabel *laber;
//@property (nonatomic,strong)HunterModel *model1;
@end
