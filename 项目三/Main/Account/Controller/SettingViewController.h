//
//  SettingViewController.h
//  text1
//
//  Created by mac on 16/2/13.
//  Copyright © 2016年 koala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;


- (IBAction)charactor:(id)sender;

- (IBAction)addFriend:(id)sender;

- (IBAction)fixAccount:(id)sender;
- (IBAction)pushNotifi:(id)sender;
- (IBAction)linkSocial:(id)sender;
- (IBAction)clear:(id)sender;

- (IBAction)about:(id)sender;
- (IBAction)feedback:(id)sender;

@end
