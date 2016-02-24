//
//  AllViewController.m
//  项目三
//
//  Created by huiwen on 16/2/20.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "AllViewController.h"
#import "MainModel.h"
#import "AllCollectionViewCell.h"
#import "ScrollerViewController.h"
static NSString *identify = @"cell";

@interface AllViewController ()

@end

@implementation AllViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setNeedsStatusBarAppearanceUpdate];
    }
    return self;
}- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BreadTrip/poi_bg_placeholder@2x.png"]];
   // self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.title = @"精选故事";
    NSArray *key = @[[UIColor whiteColor], [UIFont fontWithName:@"Trebuchet MS"size:21]];
    NSArray *value = @[NSForegroundColorAttributeName,NSFontAttributeName];
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:key forKeys:value];
    
    self.navigationController.navigationBar.titleTextAttributes = dic;
    UINavigationBar *navigationBar =  self.navigationController.navigationBar;
    self.navigationController.navigationBar.alpha = 1;
   // [navigationBar setBackgroundImage:[UIImage imageNamed:@"CarFilesOutput/car_images_FISWL/root_tab_bg@2x.png"] forBarMetrics:UIBarMetricsDefault];
    //样式设置为黑色
    //navigationBar.barStyle = UIBarStyleDefault;
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"CarFilesOutput/car_images_FISWL/root_tab_bg@2x.png"] forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
  //  self.navigationController.navigationBar.translucent = NO;//nice，摄者导航栏不透明
    [self _ceratCollerction];
    [self _loadData];
    
}
- (void)_ceratCollerction{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing = 8;
    //    flowLayout.itemSize = CGSizeMake(100, 100);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(5, 5, kScreenWidth - 10, kScreenHeight-self.navigationController.navigationBar.frame.size.height) collectionViewLayout:flowLayout];
    NSLog(@"%lf",self.navigationController.navigationBar.frame.size.height);
    
//
    _collectionView.backgroundColor =  [UIColor colorWithPatternImage:[UIImage imageNamed:@"BreadTrip/poi_bg_placeholder@2x.png"]];    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    //    _collectionView.backgroundColor = [UIColor greenColor];
    [_collectionView registerNib:[UINib nibWithNibName:@"AllCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:_collectionView];





}
- (void)_loadData{
    _arr = [[NSMutableArray alloc] init];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://api.breadtrip.com/v2/new_trip/spot/hot/list/?start=0"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDataTask *load = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        NSArray *arr = [[responseObject objectForKey:@"data"] objectForKey:@"hot_spot_list"];
        for (NSDictionary *dic in arr) {
            MainModel *main = [[MainModel alloc] init];
            main.userName = [[dic objectForKey:@"user"]objectForKey:@"name"];//用户名字
            main.index_cover = [dic objectForKey:@"index_cover"];
            main.location_alias = [dic objectForKey:@"location_alias"];
            main.poi = [dic objectForKey:@"poi"];
            main.index_title = [dic objectForKey:@"index_title"];//
            
            main.avatar_s = [[dic objectForKey:@"user"]objectForKey:@"avatar_s"];
            main.spot_id = [dic objectForKey:@"spot_id"];
            
            NSLog(@"%@",main.spot_id);
            
            [_arr addObject:main];
        }
        [_collectionView reloadData];
    }];
    [load resume];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
# pragma Mark collectionCell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _arr.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AllCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.main = _arr[indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{  NSLog(@"%lf", (kScreenWidth- 15)/2 );
    
    return CGSizeMake((kScreenWidth - 15)/2, 200);
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ScrollerViewController *scro = [[ScrollerViewController alloc] init];
    
    scro.main = _arr[indexPath.row];
;

    [self.navigationController pushViewController:scro animated:YES];
    
}

@end
