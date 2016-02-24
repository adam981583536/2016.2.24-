//
//  MainModel.h
//  项目三
//
//  Created by 汇文教育 on 16/2/3.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModel : NSObject
@property (nonatomic , copy) NSString *html_url;
@property (nonatomic , copy) NSString *image_url;
@property (nonatomic , copy) NSString *title;
@property (nonatomic , copy) NSString *cover_image_1600;//点进去的大图
@property (nonatomic , copy) NSString *cover_image_s;//画面的小图
@property (nonatomic , copy) NSString *index_title;//图下面的标题
@property (nonatomic , copy) NSString *location_alias;//娘家
@property (nonatomic , strong) NSDictionary *user;//用户信息
@property (nonatomic , copy) NSString *name;
@property (nonatomic , copy) NSString *avatar_s;//小头像
@property (nonatomic , copy) NSString *index_cover;//这个才是正确的,点击全部进去的头像
@property (nonatomic , strong) NSDictionary *poi;
@property (nonatomic , copy) NSString *poiName;
@property (nonatomic , copy) NSString *cover_image;//4的图片
@property (nonatomic , strong) NSNumber *type;
@property (nonatomic , copy) NSString *cover;//七的图片地址
@property (nonatomic , copy) NSString *url;//7点进去的url
@property (nonatomic , copy) NSString *sub_title;//辅助信息
@property (nonatomic , copy) NSString *type7Title;//7主题
//@property (nonatomic , copy) NSString *location_alias;
@property (nonatomic , copy) NSString *avatar_m;//type4的用户头像
@property (nonatomic , copy) NSString *view_count;//type4浏览次数
@property (nonatomic , copy) NSString *first_day;//发表日期
@property (nonatomic , copy) NSString *userName;//type4用户名字
@property (nonatomic , copy) NSString *popular_place_str;//地点
@property (nonatomic , copy) NSString *last_day;//最后日期
@property (nonatomic , copy) NSString *day_count;
@property (nonatomic , strong) NSNumber *spot_id;//web的关键字
@property (nonatomic , strong)NSNumber *typeID;
@property (nonatomic , copy) NSString *trackpoints_thumbnail_image;//type4的头部的地图
@property (nonatomic , strong) NSDictionary *covered_countries;//里面的城市
//"name":"icon"这两个key值分别是名字和国旗图标


@end
