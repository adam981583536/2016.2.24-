//
//  ScrollerViewController.h
//  项目三
//
//  Created by huiwen on 16/2/22.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainModel;
@interface ScrollerViewController : UIViewController

@property (nonatomic ,copy) NSString *html_url;
@property (nonatomic ,strong)MainModel *main;
@property (nonatomic ,copy) NSString *url;
@property (nonatomic , copy) NSString *cellUrl;

@end
