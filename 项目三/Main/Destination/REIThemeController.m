//
//  REIThemeController.m
//  Bread2Where
//
//  Created by qianfeng on 15-6-14.
//  Copyright (c) 2015年 FEI. All rights reserved.
//

#import "REIThemeController.h"
#import "REIThemeView.h"
#import "SVProgressHUD.h"
#import "REIThemeModel.h"
#import "HttpDownLoadBlock.h"
#import "REIThemeDetailController.h"
#import "UIView+Extension.h"
#import "REINearbyController.h"

@interface REIThemeController ()<REIThemeViewDelegate>
{
    UIButton * _nearbyBtn;
    UIButton * _cancelBtn;
    UIButton *_titleBtn;
    UIView * _titleView;
    UICollectionView * _collectionView;

}
@property(nonatomic, strong)REIThemeView * tableView;
@property(nonatomic, strong) NSMutableArray * dataArray;
@end

@implementation REIThemeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"爱情圣地";
    //1.添加限免的数据列表View视图
    [self installLimitFreeControllerView];
    [self setupNavBar];
    self.navigationController.navigationBar.translucent = NO;

}

-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)installLimitFreeControllerView
{
    //1.添加限免的数据列表View视图
    REIThemeView * tableView  =  [REIThemeView themeViewCreate];
    self.tableView = tableView;
    self.tableView.delegate = self;
    
    //2.调用请求网络数据的方法
    [self sendRequestWithPage:0 andPageNumber:1];
    [self.view addSubview:tableView];
}

#pragma mark 获得模型数据
- (void)sendRequestWithPage:(int)status andPageNumber:(int)pageNumber
{

    NSString * urlString = [NSString stringWithFormat:SUBJECT_URL,pageNumber];
    [SVProgressHUD show];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *array = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        
        NSMutableArray * mutableArray = [[NSMutableArray alloc]init];
        
        
        
        for (NSDictionary * dict in array)
        {
            REIThemeModel * model = [REIThemeModel themeModelWithDict:dict];
            [mutableArray addObject:model];
        }
        
        //将封装好的模型保存起来，直接传到视图中去
        if (status == REIThemeViewRefreshHeaderView)
        {
            [self.dataArray removeAllObjects];
            self.tableView.mutableArray = mutableArray;
            [self.dataArray addObjectsFromArray:mutableArray];
        }else
        {
            [self.dataArray addObjectsFromArray:mutableArray];
            self.tableView.mutableArray = self.dataArray;
        }
        [SVProgressHUD dismiss];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"出错: %@",error);
        
    }];

}

//**当需要加载数据的时候会调用*/
#pragma mark 实现代理
- (void)themeviewRefresh:(REIThemeViewRefresh)status andPage:(int)page
{
    [self sendRequestWithPage:status andPageNumber:page];
}


#pragma mark 实现点击tableView 其中的一个cell


- (void)themeViewDidSelect:(REIThemeView *)themeView andObj:(id)obj
{
    REIThemeDetailController * detail = [[REIThemeDetailController alloc]init];
//    detail.hidesBottomBarWhenPushed = YES;
    detail.model = obj;
    REIThemeModel * themeModel = obj;
    detail.navigationItem.title = themeModel.title;
    [self.navigationController pushViewController:detail animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [SVProgressHUD dismiss];
}
-(void) setupNavBar
{
    _titleView = [[UIView alloc]initWithFrame:CGRectMake(20, 0, kScreenWidth, 44)];
    _nearbyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _nearbyBtn.frame = CGRectMake(kScreenWidth-60 , 0, 40, 25);
    _nearbyBtn.centerY = _titleView.centerY;
    [_nearbyBtn setTitle:@"附近" forState:UIControlStateNormal];
    [_nearbyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_nearbyBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    _nearbyBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_nearbyBtn addTarget:self action:@selector(nearBtnTouch) forControlEvents:UIControlEventTouchUpInside];
    [_titleView addSubview:_nearbyBtn];
       _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelBtn.frame = CGRectMake( 0, 0, 40, 25);
    //_cancelBtn.tintColor = [UIColor blackColor];
    _cancelBtn.centerY = _titleView.centerY;
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_cancelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    _cancelBtn.hidden = YES;
    [_cancelBtn addTarget:self action:@selector(cancelBtnTouch) forControlEvents:UIControlEventTouchUpInside];
    
    [_titleView addSubview:_cancelBtn];


     self.navigationItem.titleView = _titleView;

}
-(void)nearBtnTouch {
    REINearbyController * nearbyController = [[REINearbyController alloc]init];
    //    [self.navigationController pushViewController:nearbyController animated:YES];
    nearbyController.navigationItem.title = @"我的附近";
   // nearbyController.navigationItem.leftBarButtonItem.title = @"返回";
    
    UINavigationController * nav=[[UINavigationController alloc]initWithRootViewController:nearbyController];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void) cancelBtnTouch
{
   // _searchBar.text = nil;
   // [_searchBar resignFirstResponder];
}



@end
