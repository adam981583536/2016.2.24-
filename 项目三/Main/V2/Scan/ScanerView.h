//
//  ScanerView.h
//  试验品
//
//  Created by huiwen on 16/2/26.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScanerView : UIView

//! 扫描区域边长
@property (nonatomic, assign) CGFloat   scanAreaEdgeLength;

//! 扫描区域，用作修正扫描
@property (nonatomic, assign, readonly) CGRect scanAreaRect;

@end
