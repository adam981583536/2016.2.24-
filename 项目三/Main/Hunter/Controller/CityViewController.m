//
//  CityViewController.m
//  项目三
//
//  Created by 汇文1 on 16/2/2.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "CityViewController.h"


#import "HunterViewController.h"

@interface CityViewController ()<UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate>
{
    NSMutableArray *CityArr;
    UIImageView *_selectView;
    NSMutableArray *_CityNameArrIn;
    NSMutableArray *_CityNameArrOut;
    CLLocationManager *Lmanager;
    NSString *LStr;
}
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation CityViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        CityArr = [NSMutableArray array];
        _hotCityArr = [NSArray array];
        [self _getData];


        [self _createSearchView];
        [self _creatTableView];
        
    }
    return self;
}
- (void)_createSearchView
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 125, 20, 20)];
    imageView.image = [UIImage imageNamed:@"Feed_SearchBtn@2x"];
    [self.view addSubview:imageView];
    UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(40 , 120, kScreenWidth-50, 30)];
    field.placeholder = @"搜索城市";
    field.textAlignment = NSTextAlignmentLeft;
    field.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, 20)];
    field.tintColor = [UIColor colorWithRed:11/255.0 green:96/255.0 blue:254/255.0 alpha:1];

    [field setBorderStyle:UITextBorderStyleRoundedRect];
    [field setBackgroundColor:[UIColor clearColor]];
    [field setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [field setTextColor:[UIColor colorWithRed:0.95f green:0.95f blue:0.95f alpha:1.00f]];
    [self.view addSubview:field];
    [field addTarget:self action:@selector(fieldAction) forControlEvents:UIControlEventTouchUpInside];
}
- (void)fieldAction
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-30, 125 , 20, 20)];
    [button setTitle:@"搜索" forState:UIControlStateNormal];
}
- (void)_creatHeaderView
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenHeight, 250)];
    self.tableView.tableHeaderView = headerView;
    UILabel *cityLaber = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
    cityLaber.backgroundColor = [UIColor clearColor];
    cityLaber.font = [UIFont systemFontOfSize:15];
    cityLaber.textColor = [UIColor grayColor];
    LStr = @"杭州";
    cityLaber.text = [NSString stringWithFormat:@"%@ GPS定位",LStr];
    [headerView addSubview:cityLaber];
    UILabel *hotLaber = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 100, 30)];
    hotLaber.backgroundColor = [UIColor clearColor];
    hotLaber.text = @"热门城市";
    hotLaber.font = [UIFont systemFontOfSize:15];
    hotLaber.textColor = [UIColor grayColor];
    [headerView addSubview:hotLaber];
    UILabel *allLaber = [[UILabel alloc]initWithFrame:CGRectMake(10, 200, 100, 30)];
    allLaber.backgroundColor = [UIColor clearColor];
    allLaber.text = @"全部城市";
    allLaber.font = [UIFont systemFontOfSize:15];
    allLaber.textColor = [UIColor grayColor];

    [headerView addSubview:allLaber];
#warning ll
    CGFloat width = kScreenWidth/4-30;
    CGFloat heigh = 25;
    NSLog(@"%ld",_hotCityArr.count);
    for (int i = 0; i < _hotCityArr.count ; i++) {
        UIButton *button = [[UIButton alloc]init];
            if (i >=4) {
                button.frame = CGRectMake(15+(width+30)*(i-4), 100+(heigh+10), width, heigh);
            }else
            {
                button.frame = CGRectMake(15+(width+30)*i, 100, width, heigh);
            }
//        [button setImage:[UIImage imageNamed:@""] forState:];
        [button setBackgroundImage:[UIImage imageNamed:@"spot_detail_edit_add_trip@2x.png"] forState:UIControlStateNormal];
//        button.layer.cornerRadius = 13;
        NSString *str = _hotCityArr[i];
        [button setTitle:str forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.tag = 400+i;
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        [button addTarget:self action:@selector(hotCityAction:) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:button];
    }
    
}
- (void)hotCityAction:(UIButton *)sender
{
    HunterViewController *hunter = [[HunterViewController alloc]init];
    hunter.cityName = _hotCityArr[sender.tag-400];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"name" object:self userInfo:@{@"CityName":[NSString stringWithFormat:@"%@",hunter.cityName]}];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)_creatTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 150, kScreenWidth, kScreenHeight-150-90)];
    [self.view addSubview:_tableView];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
//

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cityhunter_bg.png"]];
    [self _creatTopButton];
    if ([CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位已开");
    }
    
    Lmanager = [[CLLocationManager alloc] init];
    Lmanager.delegate = self;
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse) {
        //将定位服务访问设置为当使用的时候定位
        [Lmanager requestWhenInUseAuthorization];
    }
    //精度
    Lmanager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    
    //定位的频率
    Lmanager.distanceFilter = 1000.0;
    //开始定位
    [Lmanager startUpdatingLocation];


    
}
- (void)_creatTopButton
{
    //    UIImage *btnImage = [UIImage imageNamed:@"dest_place_btn_hl@2x.png"];
    //    CGImageRef imageRef = CGImageCreateWithImageInRect(btnImage.CGImage, CGRectMake(0, 0, 200, 60));
    //    UIImageView *btnView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-100, 60, 200, 60)];
    //    [btnView setImage:[UIImage imageWithCGImage:imageRef]];
    //    CGImageRelease(imageRef);
    //
    //    [self.view addSubview:btnView];
    _selectView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 60)];
    _selectView.image = [UIImage imageNamed:@"dest_place_btn.png"];
    [self.view addSubview:_selectView];
    
    NSArray *arr = @[@"国内",@"海外"];
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth/2-80, 40, 80, 60)];
    button1.tag = 200;
    [button1 setTitle:arr[0] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //    button1.titleLabel.textColor = [UIColor blackColor];
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth/2, 40, 80, 60)];
    [button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button2.tag = 201;
    [button2 setTitle:arr[1] forState:UIControlStateNormal];
    //    button2.titleLabel.textColor = [UIColor blackColor];
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    _selectView.center = button1.center;
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth/2-15, kScreenHeight-80, 30,30)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"ch_hunter_close@2x"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
}

- (void)_getData
{
    _CityNameArrIn = [NSMutableArray array];
        NSString *dataStr = @"http://api.breadtrip.com/hunter/products/v2/metadata/?city_name=%E6%9D%AD%E5%B7%9E&sign=3d10ae46efeb244b4c1a82c0513e7630&with_citydata=true&with_sortdata=true";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:dataStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {

       

        [self loadDataFinsh:responseObject];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];


}
- (void)_getData1
{
    _CityNameArrOut = [NSMutableArray array];
    NSString *dataStr = @"http://api.breadtrip.com/hunter/products/v2/metadata/?city_name=%E6%9D%AD%E5%B7%9E&sign=3d10ae46efeb244b4c1a82c0513e7630&with_citydata=true&with_sortdata=true";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:dataStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        

        [self loadDataFinsh1:responseObject];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
}

- (void)loadDataFinsh:(NSMutableDictionary *)result
{
    NSDictionary *city_data = [result objectForKey:@"city_data"];
    
    NSDictionary *domestic_city = [city_data objectForKey:@"domestic_city"];

    NSArray *all_city_listIn = [domestic_city objectForKey:@"all_city_list"];
    NSArray *hotCity = [domestic_city objectForKey:@"hot_city_list"];
    
;
    for (NSDictionary *dic in all_city_listIn) {

        NSString *str = dic[@"name"];

        [_CityNameArrIn addObject:str];
        
        
    }

    self.hotCityArr = hotCity;

    CityArr = _CityNameArrIn;
    [self _creatHeaderView];
    [self.tableView reloadData];
    


}

- (void)loadDataFinsh1:(NSMutableDictionary *)result
{
    NSDictionary *city_data = [result objectForKey:@"city_data"];
    

    NSDictionary *oversea_city = [city_data objectForKey:@"oversea_city"];
;
    NSArray *all_city_listOut = [oversea_city objectForKey:@"all_city_list"];
    NSArray *hotCity = [oversea_city objectForKey:@"hot_city_list"];
    for (NSDictionary*dic in all_city_listOut) {

//        HunterModel *model = [[HunterModel alloc]init];
//        model.name = dic[@"name"];
        NSString *str = dic[@"name"];
        [_CityNameArrOut addObject:str];
    }
    self.hotCityArr = hotCity;
    CityArr = _CityNameArrOut;
    [self _creatHeaderView];
    [self.tableView reloadData];
    
    
    
}

- (void)buttonAction:(UIButton *)sender
{
    [UIView animateWithDuration:0.25 animations:^{
        _selectView.center = sender.center;

    }];
    if (sender.tag == 200) {
        [self _getData];
    }
    if (sender.tag ==201) {
        [self _getData1];
    }
    
}
- (void)backBtnAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return CityArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"identify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = CityArr[indexPath.row];
    return cell;
//    CityNameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityNameTableViewCell" forIndexPath:indexPath];
//    cell.model = CityArr[indexPath.row];
//    
//    cell.backgroundColor = [UIColor clearColor];
//
//    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HunterViewController *name = [[HunterViewController alloc]init];
    name.cityName = CityArr[indexPath.row];
    
    

    


    [[NSNotificationCenter defaultCenter]postNotificationName:@"name" object:self userInfo:@{@"CityName":[NSString stringWithFormat:@"%@",name.cityName]}];

    [name.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:locations[0] completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        for (CLPlacemark *place in placemarks) {
            LStr = (NSString *)place;
        }
    }];
    
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
