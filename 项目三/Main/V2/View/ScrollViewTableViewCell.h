//
//  ScrollViewTableViewCell.h
//  项目三
//
//  Created by 汇文教育 on 16/2/3.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ReturnBlock)(NSString *htmlUrl);
@interface ScrollViewTableViewCell : UITableViewCell<UIScrollViewDelegate>
@property (nonatomic, copy) ReturnBlock returnBlock;
@property (nonatomic ,strong) NSMutableArray *arr;
//- (void)returnUrl:(ReturnBlock)block;
@end
