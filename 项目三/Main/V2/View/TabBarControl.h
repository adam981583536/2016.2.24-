//
//  TabBarControl.h
//  项目三
//
//  Created by 汇文教育 on 16/1/28.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarControl : UIControl
- (instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)image withTitle:(NSString *)title;

- (instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)image withTitleName:(NSString *)title;
@end
