//
//  V2ViewController.h
//  项目三
//
//  Created by 汇文教育 on 16/1/27.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "BaseViewController.h"

@interface V2ViewController : BaseViewController
{
    UITableView *_tableView;


}
@property (nonatomic ,strong) NSMutableArray *arr;
@property (nonatomic , strong)NSMutableArray *TwoArr;
@property (nonatomic , strong) NSMutableArray *thirdArr;
@property (nonatomic , strong) NSMutableArray *fourthArr;
@property (nonatomic , strong) NSMutableArray *fifthArr;

@property (nonatomic , strong) NSMutableArray *numArr;
@property (nonatomic , strong) NSMutableArray *loadNumArr;
@end
