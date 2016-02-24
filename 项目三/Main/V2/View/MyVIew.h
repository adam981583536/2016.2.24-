//
//  MyVIew.h
//  项目三
//
//  Created by huiwen on 16/2/18.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainModel;
@interface MyVIew : UIView

@property (nonatomic ,strong) MainModel *model;
@property (weak, nonatomic) IBOutlet UILabel *smallTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageVIew;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *hehe;

@end
