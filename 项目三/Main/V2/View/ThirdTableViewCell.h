//
//  ThirdTableViewCell.h
//  项目三
//
//  Created by huiwen on 16/2/18.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ReturnMyBlock)(NSString *htmlUrl);

@interface ThirdTableViewCell : UITableViewCell
@property (nonatomic ,strong)NSMutableArray *myArr;
@property (nonatomic, copy) ReturnMyBlock returnMyBlock;
@end
