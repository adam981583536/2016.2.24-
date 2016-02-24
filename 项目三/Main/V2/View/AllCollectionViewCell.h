//
//  AllCollectionViewCell.h
//  项目三
//
//  Created by huiwen on 16/2/21.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainModel;
@interface AllCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong)MainModel *main;
@property (weak, nonatomic) IBOutlet UIImageView *allImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *hehe;

@end
