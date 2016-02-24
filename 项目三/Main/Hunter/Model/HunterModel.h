//
//  HunterModel.h
//  项目三
//
//  Created by 汇文1 on 16/2/9.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HunterModel : NSObject
@property(nonatomic,copy)NSString *title_page;
@property(nonatomic,copy)NSString *avatar_l;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *like_count;
@property(nonatomic,copy)NSString *product_id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *myID;
@property(nonatomic,strong)NSMutableArray *myIDArr;
@property(nonatomic,strong)NSArray *themeArr;

@end
