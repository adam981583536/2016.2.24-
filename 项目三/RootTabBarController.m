//
//  RootTabBarController.m
//  项目三
//
//  Created by 汇文教育 on 16/1/28.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "RootTabBarController.h"


#import "WXTabBarItem.h"
@interface RootTabBarController ()
{
   
    
    UIImageView *_selectView;
}
@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    [self _creatTabBarView];
    [self _creatSubVC];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //移除系统tabbar自带的item
    [self removeUITabBarButton];
}
-(void)removeUITabBarButton
{
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [view removeFromSuperview];
        }
    }
}

- (void)_creatTabBarView{
    CGFloat width = kScreenWidth/4;
    CGFloat height = CGRectGetHeight(self.tabBar.frame);

    
    
    _selectView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/4, 49)];
    
    _selectView.image = [UIImage imageNamed:@"root_tab_bg_hl"];

    //self.tabBarController.tabBar.frame = CGRectMake(0,0, kScreenWidth, height + 100);
    [self.tabBar addSubview:_selectView];
    self.tabBar.backgroundImage = [UIImage imageNamed:@"root_tab_bg"];
    
    
    
    self.tabBar.contentMode = UIViewContentModeScaleToFill;
    
        NSArray *imgNames = @[@"root_tab_recommand",
                              @"root_tab_play",
                              @"root_tab_dest",
                              @"root_tab_me"];
        
//     CGFloat itemWidth = kScreenWidth/5.0;
    
    NSArray *titleArray = @[@"推荐", @"城市猎人",@"目的地", @"我的"];
    
    
    for (int i = 0 ; i < imgNames.count; i++) {
        
        NSString *name = imgNames[i];
        
        CGRect frame = CGRectMake(i * width, 0, width, height);

            NSString *title = titleArray[i];
        WXTabBarItem *item = [[WXTabBarItem alloc]initWithFrame:frame imageName:name title:title];
            item.tag = 100 + i;
            [item addTarget:self action:@selector(selectTab:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.tabBar addSubview:item];

//        }
    }
    
    
    
    
}
- (void)_creatSubVC{
    NSArray *NameArr = @[@"Main",@"Hunter",@"Destination",@"Account"];
    //  NSMutableArray *navArr = [[NSMutableArray alloc] init];
    
    for (NSString *name in NameArr) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:name bundle:nil];
        
        UINavigationController *nav = [story instantiateInitialViewController];
        
        [self addChildViewController:nav];
    }
    
    //    self.childViewControllers = navArr;
    UIViewController *firstVC = self.childViewControllers[0];
    
    [self.view insertSubview:firstVC.view belowSubview:self.tabBar];
    
}

//
//- (void)setSelectIndex:(NSInteger)selectIndex{
//    //刚开始的时候我这个不调用是因为在选择我在切换页面的时候没有使用这个方法
//    if (_selectIndex != selectIndex) {
//        UIViewController *lastVC = self.childViewControllers[_selectIndex];
//        
//        UIViewController *currentVC = self.childViewControllers[selectIndex];
//        
//        
//        [lastVC.view removeFromSuperview];
//        
//        [self.view insertSubview:currentVC.view belowSubview:self.tabBar];
//        
//        _selectIndex = selectIndex;
//    }
//    
//    
//    
//}
- (void)selectTab:(UIButton *)sender{

    self.selectedIndex = sender.tag - 100;
    [UIView animateWithDuration:0.2 animations:^{
        _selectView.center = sender.center;
    }];
    
    
}- (void)didReceiveMemoryWarning {
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
