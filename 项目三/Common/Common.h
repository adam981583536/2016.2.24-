//
//  Common.h
//  项目三
//
//  Created by 汇文教育 on 16/1/28.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#ifndef Common_h
#define Common_h
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define CLAZZ_STR NSStringFromClass([self class])
#import "HunterModel.h"
#import "AFNetworking.h"
#import "UIView+ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "UIImageView+WebCache.h"
#import "UIView+QFExt.h"
#import "MJRefresh.h"
#define SKAppkey @"fba06b60e10b"
#define SKAppsecret @"737823192ae92812fe0c0ff741f30c78"

#define  KVersion [[UIDevice currentDevice].systemVersion floatValue]

//主题
#define SUBJECT_URL @"http://chanyouji.com/api/articles.json?page=%d"
/**专题*/
#define THEME_URL @"http://chanyouji.com/api/articles/%d.json"
//全部
#define ALL_URL @"http://api.breadtrip.com/place/pois/nearby/?keyword=&category=0&start=0&count=20&latitude=30.319424&longitude=120.350932&sign=74e6417080a6e50efb0626f6181f438c"

//目的地景点
#define SCENE_URL @"http://api.breadtrip.com/place/pois/nearby/?keyword=&category=11&start=0&count=20&latitude=30.319453&longitude=120.350925&sign=fbe5b0a01e222c3e7e7e726b421f5ef3"
//餐厅
#define RES_URL @"http://api.breadtrip.com/place/pois/nearby/?keyword=&category=5&start=0&count=20&latitude=30.319489&longitude=120.351037&sign=8aa03d75ae0727e50c3c497bd0586778"

//购物
#define SHOP_URL @"http://api.breadtrip.com/place/pois/nearby/?keyword=&category=6&start=0&count=20&latitude=30.319416&longitude=120.350959&sign=597edb40c679112d46dd282eaa282d48"

//hotal 住宿
#define HOTAL_URL @"http://api.breadtrip.com/place/pois/nearby/?keyword=&category=10&start=0&count=20&latitude=30.319409&longitude=120.350915&sign=f9c3ca24dc83a18be8cd36b18d7c408f"

//休闲娱乐
#define ENTER_URL @"http://api.breadtrip.com/place/pois/nearby/?keyword=&category=21&start=0&count=20&latitude=30.319490&longitude=120.351048&sign=3bcb917d7c357dd91c1c690cc7f31ef5"


#define DescFont [UIFont systemFontOfSize:13]

#endif /* Common_h */
