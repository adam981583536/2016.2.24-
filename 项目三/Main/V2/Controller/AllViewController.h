//
//  AllViewController.h
//  项目三
//
//  Created by huiwen on 16/2/20.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllViewController : UIViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UINavigationBarDelegate>

@property (nonatomic , strong) NSMutableArray *arr;
@property (nonatomic, strong) UICollectionView *collectionView;
@end
