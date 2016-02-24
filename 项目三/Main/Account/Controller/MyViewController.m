//
//  MyViewController.m
//  项目三
//
//  Created by mac on 16/2/22.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "MyViewController.h"
#import "MyTableViewCell.h"
#import "QYTableViewHeader.h"
#import "SettingViewController.h"
#import "WebViewController.h"

#define kCell @"personCell"

@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UINavigationBar *naviBar1;
@property (nonatomic, strong) UIView *barView;
@property (nonatomic, strong) UIImageView *bigImageView;
@property (nonatomic, strong) QYTableViewHeader *headView;

@end

@implementation MyViewController

-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth,kScreenHeight-50)];
        _tableView.delegate=self;
        _tableView.dataSource=self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getNaviItem];
    [self getTableView];
    self.tabBarController.tabBar.translucent = NO;
    _bigImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
    _bigImageView.image=[UIImage imageNamed:@"user_cover_07.jpg"];
    _bigImageView.clipsToBounds=YES;
    _bigImageView.contentMode = UIViewContentModeScaleAspectFill;
    UIImageView* smallView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    smallView.image=[UIImage imageNamed:@"avatar.jpg"];
    smallView.center=CGPointMake(_bigImageView.center.x, _bigImageView.center.y);
    smallView.clipsToBounds=YES;
    smallView.contentMode=UIViewContentModeScaleAspectFill;
    
    
    _headView=[[QYTableViewHeader alloc]init];
    [_headView goodMenWithTableView:self.tableView andBackGroundView:_bigImageView andSubviews:smallView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setNavbarBackgroundHidden:YES];

    
}

- (void)getNaviItem
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"成为猎人" style:UIBarButtonItemStylePlain target:self action:@selector(webButton)];
    leftItem.tintColor = [UIColor blackColor];
    
    //    self.navigationController.navigationItem.rightBarButtonItem = item;
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(settingButton)];
    rightItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)settingButton
{
    SettingViewController *settingVC = [[SettingViewController alloc] init];
    
    settingVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:settingVC animated:YES];
    
    
}

- (void)webButton
{
    WebViewController *webView = [[WebViewController alloc] init];

    webView.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:webView animated:YES];
}


-(void)setNavbarBackgroundHidden:(BOOL)hidden
{
    
    _naviBar1 = self.navigationController.navigationBar;
    
    for (UIView* view in  _naviBar1.subviews) {
        if([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")])
            self.barView = view;
    }
    
    if (!hidden) {
        [self show];
    }else{
        [self hidden];
    }
    
}
-(void)show
{
    //    [_barView addSubview:_titleLabel];
    [UIView animateWithDuration:0.2 animations:^{
        self.barView.hidden = NO;
        //        _titleLabel.hidden = NO;
    }];
}
-(void)hidden
{
    
    //    self.titleLabel.hidden =YES;
    self.barView.hidden=YES;
}

-(void)getTableView
{
    [self.view addSubview: self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:NULL] forCellReuseIdentifier:kCell];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_headView scrollViewDidScroll:scrollView];
    if (scrollView.contentOffset.y < self.bigImageView.frame.size.height - 64) {
        [self setNavbarBackgroundHidden:YES];
        
    }else
    {
        [self setNavbarBackgroundHidden:NO];
    }
    
}


-(void)viewDidLayoutSubviews
{
    [_headView resizeView];
}


#pragma mark - tableViewDataSouse


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCell forIndexPath:indexPath];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    
    NSArray *titleArray = @[@"我的面包故事",
                            @"生活",
                            @"看看就好"];
    
    NSArray *timeArr = @[@"默认故事集",
                         @"1个月之前更新  1个故事",
                         @"3个月之前封信  1个故事"];
    NSArray *imgarr = @[@"1.jpg",
                        @"2.jpg",
                        @"3.jpg"];
    
    cell.bgImage.image = [UIImage imageNamed:imgarr[indexPath.row]];
    cell.typeLabel.text = titleArray[indexPath.row];
    cell.timeLabel.text = timeArr[indexPath.row];
    
    return cell;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
