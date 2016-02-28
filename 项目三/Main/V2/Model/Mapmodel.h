//
//  Mapmodel.h
//  试验品
//
//  Created by huiwen on 16/2/28.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface Mapmodel : NSObject<MKAnnotation>
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@end
