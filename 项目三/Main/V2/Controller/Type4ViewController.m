//
//  Type4ViewController.m
//  项目三
//
//  Created by huiwen on 16/2/22.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "Type4ViewController.h"
#import "MainModel.h"
#import <ShareSDK/ShareSDK.h>
//#import <ShareSDKUI/ShareSDK+SSUI.h>
#import "ScanerVC.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "Mapmodel.h"
@interface Type4ViewController ()<MKMapViewDelegate,CLLocationManagerDelegate>
{
    MKMapView *mapView;
    CLLocationManager *_locationManager;//位置管理器
}
@end

@implementation Type4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //  NSLog(@"进到4了");
    //
    //    [self.navigationController.navigationBar setBackgroundColor:[UIColor lightGrayColor]];
    
    [self _creatBack];
    
    [self _creatTableView];
}
- (void)_creatTableView{
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setType4Id:(NSNumber *)type4Id{
    
    
    _type4Id = type4Id;
    //  NSLog(@"%@",type4Id);
    [self _loadData:type4Id];
    
    
    
}
- (void)_creatBack{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 25)];
    
    // button.backgroundColor = [UIColor blueColor];
    [button setImage:[UIImage imageNamed:@"tabbar_share_button_image_hl.png"] forState:UIControlStateNormal];
    //一开始图片一直没有后来发现要是直接用图片名字的话，如果后缀不对，需要删除
   // button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_share_button_image_hl"]];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIButton *scaButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 25)];
    [scaButton setTitle:@"扫两扫" forState:UIControlStateNormal];
    
    [scaButton addTarget:self action:@selector(scaPress:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *scaItem = [[UIBarButtonItem alloc] initWithCustomView:scaButton];
    
    UIButton *locaButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 25)];
    [locaButton setTitle:@"定位" forState:UIControlStateNormal];
    
    [locaButton addTarget:self action:@selector(locaPress:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *locaItem = [[UIBarButtonItem alloc] initWithCustomView:locaButton];
    
    NSArray *arr = @[item,scaItem,locaItem];
    self.navigationItem.rightBarButtonItems = arr;
    
    
}
- (void)locaPress:(UIButton *)sender{

    NSLog(@"哈哈骗你的还没有做");
    
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc] init];
        
        
    }
    
    [_locationManager requestWhenInUseAuthorization];
    mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    mapView.showsUserLocation = YES;//开启定位功能
    mapView.delegate = self;
    //地图的显示类型
    //    MKMapTypeStandard = 0, 基础地图类型 就是我们平常用的
    //    MKMapTypeSatellite, 卫星类型
    //    MKMapTypeHybrid, 混合类型
    //    MKMapTypeSatelliteFlyover
    //    MKMapTypeHybridFlyover
    mapView.mapType = MKMapTypeStandard;
    
    //设置地图显示的区域1、定位经纬度 2、定义精度 3、设置显示区域
//    //定位图层有3种显示模式，分别为：
//    
//    MAUserTrackingModeNone：不跟随用户位置，仅在地图上显示。
//    MAUserTrackingModeFollow：跟随用户位置移动，并将定位点设置成地图中心点。
//    MAUserTrackingModeFollowWithHeading：跟随用户的位置和角度移动。
//    //
    _locationManager=[[CLLocationManager alloc]init];
    
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位服务当前可能尚未打开，请设置打开！");
        return;
    }
    
    //如果没有授权则请求用户授权
    if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusNotDetermined){
        [_locationManager requestWhenInUseAuthorization];
    }else if([CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorizedWhenInUse){
        //设置代理
        _locationManager.delegate=self;
        //设置定位精度
        _locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        //定位频率,每隔多少米定位一次
        CLLocationDistance distance=10.0;//十米定位一次
        _locationManager.distanceFilter=distance;
        //启动跟踪定位
        [_locationManager startUpdatingLocation];
    }

    
    
    
    
    [self.view addSubview:mapView];

}
- (void)scaPress:(UIButton *)sender{
    ScanerVC *vc = [[ScanerVC alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)_loadData:(NSNumber *)num{
    _covered_countriesArr = [[NSMutableArray alloc] init];
    NSURLSessionConfiguration   *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSString *string = [NSString stringWithFormat:@"http://api.breadtrip.com/trips/%@/waypoints/",num];
    
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request= [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *download = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        //NSLog(@"%@",response);
        // NSLog(@"%@",responseObject);
        MainModel *main = [[MainModel alloc] init];
        
        main.trackpoints_thumbnail_image = [responseObject objectForKey:@"trackpoints_thumbnail_image"];
        // NSLog(@"%@",main.trackpoints_thumbnail_image);
        
        
    }];
    [download resume];
    
}
- (void)buttonPress:(UIButton *)sender{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"tabbar_share_button_image_hl@2x~ipad" ofType:@"png"];
    
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
                                       defaultContent:@"测试一下"
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"ShareSDK"
                                                  url:@"http://www.mob.com"
                                          description:@"这是一条测试信息"
                                            mediaType:SSPublishContentMediaTypeNews];
    //创建弹出菜单容器
    
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    //弹出分享菜单
    [ShareSDK showShareActionSheet:container
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions:nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                if (state == SSResponseStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%ld,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
}

#pragma - mark mk mapview delegate 相当于tableViewCell
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *indetifier = @"indetifier";
    
    //    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:indetifier];
    //    if (!view) {
    //        view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:indetifier];
    //
    //    //是否显示标注视图
    //    view.canShowCallout = YES;
    //    //显示辅助图片， 比如每个公司的logo 不同类的建筑标记不一样🏦
    ////    view.image = [UIImage imageNamed:<#(nonnull NSString *)#>]
    //    view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoLight];
    //    }
    
    MKPinAnnotationView *Mkview = [mapView dequeueReusableAnnotationViewWithIdentifier:indetifier];
    if (!Mkview) {
        Mkview = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:indetifier];
        
        //是否选择从天而降
        Mkview.animatesDrop = YES;
        
        Mkview.pinTintColor = [UIColor cyanColor];
        
    }
    
    
    return Mkview;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *location=[locations firstObject];//取出第一个位置
    CLLocationCoordinate2D coordinate=location.coordinate;//位置坐标
    NSLog(@"经度：%f,纬度：%f,海拔：%f,航向：%f,行走速度：%f",coordinate.longitude,coordinate.latitude,location.altitude,location.course,location.speed);
    //如果不需要实时定位，使用完即使关闭定位服务
    
   // CLLocationCoordinate2D coor2d = {30, 115};
    MKCoordinateSpan span = {1,1};
    [mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    [mapView setRegion:MKCoordinateRegionMake(coordinate, span) animated:YES];
    

    [_locationManager stopUpdatingLocation];
}

@end
