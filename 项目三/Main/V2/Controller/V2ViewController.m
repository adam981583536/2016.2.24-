//
//  V2ViewController.m
//  项目三
//
//  Created by 汇文教育 on 16/1/27.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "V2ViewController.h"
#import "AFNetworking.h"
#import "MainModel.h"
#import "ScrollViewTableViewCell.h"
#import "TwoTableViewCell.h"
#import "ThirdTableViewCell.h"
#import "FourthTableViewCell.h"
#import "FifthTableViewCell.h"
#import "AllViewController.h"
#import "ScrollerViewController.h"
#import "Type12ViewController.h"
#import "Type4ViewController.h"
//#import "MJRefresh.h"
#define kCommentCellID @"ScrollView"
@interface V2ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITextField *_field;
    
    UIButton *_nearbyButton;
    
    UITableView *_mainTabe;
}
@end

@implementation V2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  //  [self _loadData];//下载数据

   //  [self _searchData];
   //  self.navigationController.navigationBarHidden = NO;

   // [self _creatTextField];//创建上面的textfield
    
    [self _creatButton];//创建附近button
    
    [self _creatScrollView];//创建scrollview
    [self _newData];
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
     
    
}

- (void)_loadData{
    _arr = [[NSMutableArray alloc] init];

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://api.breadtrip.com/v2/index/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSProgress *progress = nil;
     
     NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:&progress destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
          
          //targetPath表示临时文件保存路径
          NSString *destinationPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/main.json"];
          
          return [NSURL fileURLWithPath:destinationPath];
         
          //block返回值的作用即设定目标路径，AFNetworking已经做好了文件移动的过程。
          
     } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
          
          
        //  NSLog(@"File downloaded to: %@", filePath);
     }];
    
    [downloadTask resume];
    
    


}
- (void)_searchData{

     NSString *filePath =  [NSHomeDirectory() stringByAppendingFormat:@"/Documents/main.json"];
     
     NSData *data = [NSData dataWithContentsOfFile:filePath];
     //有nsdata来获取地址里面的内容
     NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
     
     NSDictionary *dataDic = [jsonDic objectForKey:@"data"];
     //  NSLog(@"%@",dataDic);
     NSArray *elementsArr = [dataDic objectForKey:@"elements"];
     
     for (NSDictionary *mainDic in elementsArr) {
          NSNumber *number = [mainDic objectForKey:@"type"];
          
          NSInteger typeNumber = [number integerValue];
          
          //  NSLog(@"%ld",typeNumber);
          if (typeNumber == 1) {
               
               NSArray *mainUrl = [mainDic objectForKey:@"data"];
               for (NSArray *urlArr in mainUrl) {
                    for (NSDictionary *urlDic in urlArr) {
                         MainModel *main = [[MainModel alloc] init];
                         main.image_url = [urlDic objectForKey:@"image_url"];
                         
                         main.html_url = [urlDic objectForKey:@"html_url"];
                         
                         // NSLog(@"%@",main.image_url );
                         [_arr addObject:main];
                         
                         
                    }
               }
               
          }
          
     }
     [_tableView reloadData];
     

}
- (void)_creatTextField{//创建nav上面detextFiled
    CGFloat height = CGRectGetHeight(self.navigationController.navigationBar.frame);
    
    
    _field = [[UITextField alloc] initWithFrame:CGRectMake(0, 5, kScreenWidth - 80, height - 5)];

    _field.backgroundColor = [UIColor clearColor];
    _field.borderStyle = UITextBorderStyleRoundedRect;
 //   [self.navigationController.navigationItem setTitleView:_field];
    _field.clearsOnInsertion = YES;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView: _field];
}
- (void)_delay{


     [self performSelector:@selector(_newData) withObject:nil afterDelay:2];
}
- (void)_newData{
     _arr = [[NSMutableArray alloc] init];
     _TwoArr = [[NSMutableArray alloc] init];
     _thirdArr = [[NSMutableArray alloc] init];
     _fourthArr = [[NSMutableArray alloc] init];
     _numArr = [[NSMutableArray alloc] init];
     _fifthArr = [[NSMutableArray alloc] init];
     _loadNumArr = [[NSMutableArray alloc] init];
     NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
     AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

     NSURL *URL = [NSURL URLWithString:@"http://api.breadtrip.com/v2/index/"];
     NSURLRequest *request = [NSURLRequest requestWithURL:URL];
     
     NSURLSessionDataTask *loadData = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
         // NSLog(@"%@,%@",response,responseObject);
          NSDictionary *dataDic = [responseObject objectForKey:@"data"];
          //  NSLog(@"%@",dataDic);
          [_loadNumArr addObject:[dataDic objectForKey:@"next_start"]];
          
          NSLog(@"%@",[dataDic objectForKey:@"next_start"]);
          NSArray *elementsArr = [dataDic objectForKey:@"elements"];
          for (NSDictionary *mainDic in elementsArr) {
               NSNumber *number = [mainDic objectForKey:@"type"];
               
               NSInteger typeNumber = [number integerValue];
               
                // NSLog(@"%ld",typeNumber);
               if (typeNumber == 1) {
                    
                    NSArray *mainUrl = [mainDic objectForKey:@"data"];
                    for (NSArray *urlArr in mainUrl) {
                         for (NSDictionary *urlDic in urlArr) {
                              MainModel *main = [[MainModel alloc] init];
                              main.image_url = [urlDic objectForKey:@"image_url"];
                              
                              main.html_url = [urlDic objectForKey:@"html_url"];
                              
                              // NSLog(@"%@",main.html_url);
                              [_arr addObject:main];
                              
                              
                         }
                    }
                    
               }
               if (typeNumber == 11) {
                    
                    NSArray *titleArr = [mainDic objectForKey:@"data"];
                    for (NSDictionary *titleDIc in titleArr) {
                         MainModel *main = [[MainModel alloc] init];
                         main.title = [titleDIc objectForKey:@"title"];
                //         NSLog(@"%@",main.title);
                         [_TwoArr addObject:main];
                         
                    }
               }
               if (typeNumber == 10) {
                    
                    NSArray *OtherTitleArr = [mainDic objectForKey:@"data"];
                    for (NSDictionary *titleDIc in OtherTitleArr) {
                         MainModel *main = [[MainModel alloc] init];
                         main.index_cover = [titleDIc objectForKey:@"index_cover"];//
                               //   NSLog(@"%@",main.cover_image_s);
                         main.name = [[titleDIc objectForKey:@"user"]objectForKey:@"name"];//
                       //  NSLog(@"%@",main.name);
                         main.index_title = [titleDIc objectForKey:@"index_title"];//
                         
                         main.avatar_s = [[titleDIc objectForKey:@"user"]objectForKey:@"avatar_s"];//
                         main.location_alias = [titleDIc objectForKey:@"location_alias"];
                         main.poi = [titleDIc objectForKey:@"poi"];
                         
                         main.spot_id = [titleDIc objectForKey:@"spot_id"];
//                         if (main.poi == NULL || main.poi.count != 0) {
//                              main.poiName = [[titleDIc objectForKey:@"poi"]objectForKey:@"name"];
//                         }
                      //   NSLog(@"%@",main.spot_id);
                         [_thirdArr addObject:main];
                         
                    }
               }
               if (typeNumber == 9) {
                    
                    NSArray *OtherTitleArr = [mainDic objectForKey:@"data"];
                    for (NSDictionary *titleDIc in OtherTitleArr) {
                         MainModel *main = [[MainModel alloc] init];
                         main.title = [titleDIc objectForKey:@"title"];
                           // NSLog(@"%@",main.title);
                         
                         [_fourthArr addObject:main];
                         
                    }
               }
               else if (typeNumber == 4 || typeNumber == 7 || typeNumber == 12 ){
                    
                    NSArray *OtherTitleArr = [mainDic objectForKey:@"data"];
                    for (NSDictionary *titleDIc in OtherTitleArr) {
                         MainModel *main = [[MainModel alloc] init];
                         if (typeNumber == 7) {
                              main.type = [mainDic objectForKey:@"type"];
                              main.type7Title = [titleDIc objectForKey:@"title"];
                              main.sub_title = [titleDIc objectForKey:@"sub_title"];
                              main.cover = [titleDIc objectForKey:@"cover"];
                              main.url = [titleDIc objectForKey:@"url"];
                        //      NSLog(@"%@",number);

                              [_fifthArr addObject:main];

                         }else{
                              main.cover_image = [titleDIc objectForKey:@"cover_image"];
                              //   NSLog(@"%@",main.cover_image);
                              main.type = [mainDic objectForKey:@"type"];
                              // NSLog(@"%@",main.type);
                              
                                                          //  main.cover = [titleDIc objectForKey:@"cover"];
                              main.name = [titleDIc objectForKey:@"name"];
                              main.avatar_m = [[titleDIc objectForKey:@"user"]objectForKey:@"avatar_m"];
                              main.userName = [[titleDIc objectForKey:@"user"]objectForKey:@"name"];
                              main.popular_place_str = [titleDIc objectForKey:@"popular_place_str"];
                              main.index_title = [titleDIc objectForKey:@"index_title"];
                              // NSLog(@"%@",main.cover);
                              main.first_day = [titleDIc objectForKey:@"first_day"];
                              main.last_day = [titleDIc objectForKey:@"last_day"];
                              main.view_count = [titleDIc objectForKey:@"view_count"];
                         //     NSLog(@"%@",number);
                              main.day_count = [titleDIc objectForKey:@"day_count"];
                              main.typeID = [titleDIc objectForKey:@"id"];
                              
                           //   NSLog(@"%@",main.typeID);
                              [_fifthArr addObject:main];
                         
                         }
                         
                    }
               }

               
          }
                         [_tableView reloadData];
          
     }];
     [loadData resume];
    // [_tableView.mj_header endRefreshing];
     
}
- (void)_loadMore{
     //NSLog(@"等一等");
     [self performSelector:@selector(_loadMoreData) withObject:nil afterDelay:2.5];
}
- (void)_loadMoreData{
    NSNumber *num = _loadNumArr[_loadNumArr.count - 1];
     NSString *string = [NSString stringWithFormat:@"http://api.breadtrip.com/v2/index/?next_start=%@",num];
     NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
     AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
     
     NSURL *URL = [NSURL URLWithString:string];
     NSURLRequest *request = [NSURLRequest requestWithURL:URL];
NSURLSessionDataTask *loadData = [manager  dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
     NSDictionary *dataDic = [responseObject objectForKey:@"data"];
     //  NSLog(@"%@",dataDic);
     [_loadNumArr addObject:[dataDic objectForKey:@"next_start"]];
     
    // NSLog(@"1%@",[dataDic objectForKey:@"next_start"]);
     NSArray *elementsArr = [dataDic objectForKey:@"elements"];
     for (NSDictionary *mainDic in elementsArr) {
          NSNumber *number = [mainDic objectForKey:@"type"];
          
          NSInteger typeNumber = [number integerValue];
          if (typeNumber == 4 || typeNumber == 7 || typeNumber == 12 ){
               
               NSArray *OtherTitleArr = [mainDic objectForKey:@"data"];
               for (NSDictionary *titleDIc in OtherTitleArr) {
                    MainModel *main = [[MainModel alloc] init];
                    if (typeNumber == 7) {
                         main.type = [mainDic objectForKey:@"type"];
                         main.type7Title = [titleDIc objectForKey:@"title"];
                         main.sub_title = [titleDIc objectForKey:@"sub_title"];
                         main.cover = [titleDIc objectForKey:@"cover"];
                         main.url = [titleDIc objectForKey:@"url"];
                         //      NSLog(@"%@",number);
                         
                         [_fifthArr addObject:main];
                         
                    }else{
                         main.cover_image = [titleDIc objectForKey:@"cover_image"];
                         //   NSLog(@"%@",main.cover_image);
                         main.type = [mainDic objectForKey:@"type"];
                         // NSLog(@"%@",main.type);
                         
                         //  main.cover = [titleDIc objectForKey:@"cover"];
                         main.name = [titleDIc objectForKey:@"name"];
                         main.avatar_m = [[titleDIc objectForKey:@"user"]objectForKey:@"avatar_m"];
                         main.userName = [[titleDIc objectForKey:@"user"]objectForKey:@"name"];
                         main.popular_place_str = [titleDIc objectForKey:@"popular_place_str"];
                         main.index_title = [titleDIc objectForKey:@"index_title"];
                         // NSLog(@"%@",main.cover);
                         main.first_day = [titleDIc objectForKey:@"first_day"];
                         main.last_day = [titleDIc objectForKey:@"last_day"];
                         main.view_count = [titleDIc objectForKey:@"view_count"];
                         //     NSLog(@"%@",number);
                         main.day_count = [titleDIc objectForKey:@"day_count"];
                         main.typeID = [titleDIc objectForKey:@"id"];
                         
                         //   NSLog(@"%@",main.typeID);
                         [_fifthArr addObject:main];
                         
                    }
                    
               }
          }
                                   [_tableView reloadData];
     }
}];
     [loadData resume];
   //  [_tableView.mj_footer endRefreshing];
     
}
- (void)_creatButton{
    
    UIButton *nearByButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    
    //[nearByButton setTitle:@"附近" forState:UIControlStateNormal];
    
    //[nearByButton setImage:[UIImage imageNamed:@"zh-Hans.lproj/dest_searchbar_btn_nearby_hl@3x.png"] forState:UIControlStateNormal];
  //  NSString *s = @"附近";
   // NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:s] ;
    
    NSDictionary *dic =@{NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                         NSForegroundColorAttributeName : [UIColor whiteColor],
                         
                        // NSBackgroundColorAttributeName : [UIColor lightGrayColor]
                         };
    
    //[attriString addAttributes:dic range:NSMakeRange(0, s.length)];
//    
//    [nearByButton setAttributedTitle:attriString forState:UIControlStateNormal];
//    
//    
//    [nearByButton addTarget:self action:@selector(nearBy:) forControlEvents:UIControlEventTouchUpInside];
//    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView: nearByButton];
    
}
//附近按钮的功能
- (void)nearBy:(UIButton *)sender{

    



}
//scrollView
- (void)_creatScrollView{
//type4是最底下的图，type10是
//     CGFloat height = CGRectGetHeight(self.navigationController.navigationBar.frame);
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth, kScreenHeight - 49-64)];
     //_tableView.rowHeight = 200;
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
     _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//取消tableView点击的线;
     [_tableView registerClass:[ScrollViewTableViewCell class] forCellReuseIdentifier:kCommentCellID];

     [_tableView registerClass:[TwoTableViewCell class] forCellReuseIdentifier:@"two"];
     
     [_tableView registerClass:[ThirdTableViewCell class] forCellReuseIdentifier:@"third"];
     
     [_tableView registerClass:[FourthTableViewCell class] forCellReuseIdentifier:@"fourth"];
     
     [_tableView registerNib:[UINib nibWithNibName:@"FifthTableViewCell" bundle:nil] forCellReuseIdentifier:@"fifth"];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(push) name:@"push" object:nil];
     
    // __weak id weakself = self;
     
//     _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//          [weakself _delay];
//     }];
//    // _tableView.mj_header.
//     _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//          [weakself _loadMore];
//     }];
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - Mark 创建tabview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 4 + _fifthArr.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

     if (indexPath.row == 0) {
          ScrollViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCommentCellID];
          // cell.backgroundColor = [UIColor blackColor];
          cell.arr = _arr;
          cell.returnBlock = ^(NSString *htmlUrl){
          
               [self selectView:htmlUrl];
          };
          return cell;
     }else if (indexPath.row == 1){
          TwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"two"];
          cell.selectionStyle = UITableViewCellSelectionStyleNone;
          
          
          cell.twoArr = _TwoArr;
          return cell;
     
     }else if (indexPath.row == 2){
          ThirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"third"];
          cell.myArr = _thirdArr;
          cell.selectionStyle = UITableViewCellSelectionStyleNone;
          cell.returnMyBlock = ^(NSString *str){
               NSLog(@"%@",str);
               [self selectMyView:str];
          };
          return cell;
     }else if(indexPath.row == 3){
          FourthTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fourth"];
          cell.selectionStyle = UITableViewCellSelectionStyleNone;
          
          cell.arr = _fourthArr;
          return cell;
     }else {
          FifthTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fifth"];
          cell.selectionStyle = UITableViewCellSelectionStyleNone;
          
       //   cell.arr = _numArr[indexPath.row - 4];
          cell.model = _fifthArr[indexPath.row - 4];
          return cell;
     }
 
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     if (indexPath.row == 0) {
          return 200;
     }else if (indexPath.row == 1 ){
     
          return 35;
     }else if (indexPath.row == 2){
     
          return 400;
     }
     else if (indexPath.row == 3){
     
          return 35;
     }
     
     else{
     
          return 200;
     }
     
}
//点击全部调用通知
- (void)push{
     //NSLog(@"收到");
     AllViewController *all = [[AllViewController alloc] init];
     
     [self.navigationController pushViewController:all animated:YES];

}
//移除通知
- (void)dealloc{
     [[NSNotificationCenter defaultCenter]removeObserver:self name:@"push" object:nil];
     

}
- (void)selectView:(NSString *)htmlUrl{
     ScrollerViewController *scroller = [[ScrollerViewController alloc] init];
     scroller.html_url = htmlUrl;
     
     [self.navigationController pushViewController:scroller animated:YES];
     
     

     
}
- (void)selectMyView:(NSString *)url{

     ScrollerViewController *scr = [[ScrollerViewController alloc] init];
     scr.url = url;
     [self.navigationController pushViewController:scr animated:YES];

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

     
    // NSLog(@"你按了几%ld",indexPath.row);
    if (indexPath.row >= 4) {
        
        MainModel *main = _fifthArr[indexPath.row - 4];
        NSInteger num = [main.type integerValue];
        //  NSLog(@"%@",main.type);
        if (num == 7) {
            ScrollerViewController *sc = [[ScrollerViewController alloc] init];
            sc.cellUrl = main.url;
            //NSLog(@"%@",main.url);
            [self.navigationController pushViewController:sc animated:YES];
            
        }else if (num == 12){
            Type12ViewController *type12 = [[Type12ViewController alloc] init];
            
            //          [self presentViewController:type12 animated:YES completion:^{
            //               NSLog(@"我有点小无敌");
            //          }];
            [self.navigationController pushViewController:type12 animated:YES];
            
        }else{
            
            
            
        }

    }
     
}

@end
