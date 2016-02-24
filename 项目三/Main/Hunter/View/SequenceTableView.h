//
//  SequenceTableView.h
//  项目三
//
//  Created by 汇文1 on 16/2/12.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SequenceTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *arr;
@end
