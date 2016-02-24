//
//  REIBaseModel.m
//  项目三
//
//  Created by fx on 16/2/23.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "REIBaseModel.h"

@implementation REIBaseModel
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if(self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)modelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
