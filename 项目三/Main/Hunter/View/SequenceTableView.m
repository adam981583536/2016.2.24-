//
//  SequenceTableView.m
//  项目三
//
//  Created by 汇文1 on 16/2/12.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "SequenceTableView.h"
#import "HunterViewController.h"
#import "SequenceTableViewCell.h"
#import "MainNavigationController.h"
@implementation SequenceTableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _arr = [NSArray array];
        self.dataSource = self;
        self.delegate = self;
            [self registerNib:[UINib nibWithNibName:@"SequenceTableViewCell" bundle:nil] forCellReuseIdentifier:@"SequenceTableViewCell"];
            }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SequenceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SequenceTableViewCell" forIndexPath:indexPath];
    cell.model = _arr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HunterViewController*hunter = [[HunterViewController alloc]init];
    HunterModel *model = _arr[indexPath.row];
    NSString *str = model.myID;
    NSLog(@"%@",str);
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"id" object:self userInfo:@{@"myID":[NSString stringWithFormat:@"%@",str]}];
    [hunter.tableView reloadData];
}


@end
