//
//  REIBaseModel.h
//  项目三
//
//  Created by fx on 16/2/23.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface REIBaseModel : NSObject
-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)modelWithDict:(NSDictionary *)dict;
@end
