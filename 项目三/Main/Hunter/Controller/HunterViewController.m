//
//  HunterViewController.m
//  项目三
//
//  Created by 汇文1 on 16/2/1.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "HunterViewController.h"
#import "CityViewController.h"
#import "SequenceTableView.h"
#import "LDCalendarView.h"

#import "ProjectTableViewCell.h"
#import "HostViewController.h"
#import "MainNavigationController.h"

//#define cityName @"杭州"
@interface HunterViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_projectArr;
    NSMutableArray *_personId;
    NSMutableArray *_sequenceArr;
    SequenceTableView *_sequenceTableView;
    UIButton *leftButton;
    LDCalendarView *calenderView;


}
@end

@implementation HunterViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self viewWillAppear:YES];
    [self _createrLeftButton];

    [self _createrTopView];
    [self _createrTableView];
    [self _loadData];
    [self _createrSequenceView];
    [self _createrCalenderView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getName:) name:@"name" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getID:) name:@"id" object:nil];
    
}
- (void)getID:(NSNotification *)noti
{

    _cityID = [noti.userInfo objectForKey:@"myID"];

    [self _loadData];
}
- (void)getName:(NSNotification *)noti;
{
    [leftButton removeFromSuperview];
    _cityName = [noti.userInfo objectForKey:@"CityName"];
    [self _loadData];
    
    [self _createrLeftButton];
}
- (void)_createrSequenceView
{
    _SequenceView = [[UIView alloc]initWithFrame:CGRectMake(0, 150, kScreenWidth, kScreenHeight-200)];

    _SequenceView.hidden = YES;
    _SequenceView.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-50, 0, 50, 50)];
    button.tag = 103;
    [button setImage:[UIImage imageNamed:@"bt_cityhunter_filter_close@2x"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_SequenceView];
    [_SequenceView addSubview:button];
    UILabel *laber = [[UILabel alloc]init];
    laber= [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-30, 0, 60, 50)];
    laber.text = @"排序";
    laber.textColor = [UIColor grayColor];
    [_SequenceView addSubview:laber];
    _sequenceTableView = [[SequenceTableView alloc]initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenHeight-300)];
    [_SequenceView addSubview:_sequenceTableView];
}
- (void)_createrCalenderView
{
    calenderView = [[LDCalendarView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    calenderView.hidden = YES;
    [self.view addSubview:calenderView];
}
- (void)_loadData
{
    _SequenceView.hidden = YES;
    _sequenceArr = [NSMutableArray array];
    _personId = [NSMutableArray array];
    _projectArr = [NSMutableArray array];
//    _cityName = self.model.name;
    if (_cityName == NULL) {
        _cityName = @"杭州";
    }
    if (_cityID == NULL) {
        _cityID = @"1";
    }
    
    NSLog(@"%@",_cityName);
    NSString *str = _cityName;
    NSString *strUTF8 = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    NSString *dataStr = @"http://api.breadtrip.com/hunter/products/v2/?city_name=%E6%9D%AD%E5%B7%9E&lat=30.47399303942807&lng=120.8037097324116&start=0";
    NSString *dataStr = [NSString stringWithFormat:@"http://api.breadtrip.com/hunter/products/v2/?city_name=%@&lat=30.47399303942807&lng=120.8037097324116&sorted_id=%@&start=0",strUTF8,_cityID];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:dataStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        

        
        [self loadDataFinsh:responseObject];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {

    }];
    NSString *dataStr1 = @"http://api.breadtrip.com/hunter/products/v2/metadata/?city_name=%E6%9D%AD%E5%B7%9E&sign=3d10ae46efeb244b4c1a82c0513e7630&with_citydata=true&with_sortdata=true";
    AFHTTPSessionManager *manager1 = [AFHTTPSessionManager manager];
    [manager1 GET:dataStr1 parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {

        [self loadDataFinsh1:responseObject];
    } failure:NULL];
    

}
- (void)loadDataFinsh1:(NSMutableDictionary *)result
{

    NSArray *array = [result objectForKey:@"sort_data"];
    
    for (NSDictionary *dic in array) {
        HunterModel *model = [[HunterModel alloc]init];
        model.name = dic[@"name"];
        model.myID = dic[@"id"];


        [_sequenceArr addObject:model];
        
    }

    _sequenceTableView.arr = _sequenceArr;
    [_sequenceTableView reloadData];
}
- (void)loadDataFinsh:(NSMutableDictionary *)result
{
    NSArray *array = [result objectForKey:@"product_list"];

    for (NSDictionary *dic in array) {
        HunterModel *model = [[HunterModel alloc]init];
        model.title_page = dic[@"title_page"];
        model.like_count = dic[@"like_count"];
        model.price = dic[@"price"];
        model.title = dic[@"title"];
        model.product_id = dic[@"product_id"];
        model.avatar_l = [[dic objectForKey:@"user"]objectForKey:@"avatar_l"];
        model.themeArr = [dic objectForKey:@"tab_list"];
        [_projectArr addObject:model];
        HunterModel *model1 = [[HunterModel alloc]init];
        model1.product_id = dic[@"product_id"];
        
        [_personId addObject:model1];
    }

    [self.tableView reloadData];
}
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewDidLoad];
//    [self _createrLeftButton];
//}
- (void)_createrLeftButton
{
    leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50,40)];
    leftButton.tag = 99;
    NSString *name = [[NSString alloc]init];


    name = _cityName;

    if (_cityName == nil) {
       name = @"杭州";
    
    }
    
    [leftButton setTitle:name forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = item;

}
- (void)_createrTopView
{
    UIView *TopView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 40)];
    TopView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:TopView];
    CGFloat buttonWidth = kScreenWidth/3;
    
    NSArray *arr = @[@"主题",@"日期筛选",@"排序"];

    for (int i = 0; i < 3 ; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(buttonWidth*i, 0, buttonWidth, 40)];
        [button setTitle:arr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        button.tag = 100+i;
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [TopView addSubview:button];
        
        
    }
}

- (void)_createrTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 105  , kScreenWidth, kScreenHeight - 105 - 49) ];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerNib:[UINib nibWithNibName:@"ProjectTableViewCell" bundle:nil] forCellReuseIdentifier:@"ProjectTableViewCell"];
    

}
- (void)buttonAction:(UIButton*)sender
{
    switch (sender.tag) {
        case 99:
        {
            CityViewController *city = [[CityViewController alloc]init];

            [self presentViewController:city animated:YES completion:nil];
        }
            break;
        case 101:
        {
            calenderView.hidden = NO;
        }
            break;
        case 102:
        {

            _SequenceView.hidden = NO;
        }
            break;
         case 103:
        {
            _SequenceView.hidden = YES;
        }
            
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _projectArr.count;
    
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProjectTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = _projectArr[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 318;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     
                     

    HostViewController *host = [[HostViewController alloc]init];
    host.model1 = _personId[indexPath.row];

    MainNavigationController *mainVC = [[MainNavigationController alloc]initWithRootViewController:host];
    
    [self.navigationController presentViewController:mainVC animated:YES completion:nil];
    
}
-(void)dealloc
{
    [[NSNotificationCenter
      defaultCenter]removeObserver:self name:@"name" object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"id" object:nil];
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
