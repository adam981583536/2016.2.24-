//
//  FourthTableViewCell.m
//  项目三
//
//  Created by huiwen on 16/2/19.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "FourthTableViewCell.h"
#import "MainModel.h"
@implementation FourthTableViewCell
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setArr:(NSMutableArray *)arr{
   
    if (_arr != arr) {
        _arr = arr;
        
        [self _creatView];

    }
    
    //NSLog(@"1");
}
- (void)_creatView{

    
    for (int i = 0; i < _arr.count; i++) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 10, self.bounds.size.height - 20)];
       // NSLog(@"2%lf",self.bounds.size.height);
        //view.backgroundColor = [UIColor redColor];
        [view setImage:[UIImage imageNamed:@"dest_title_rect@2x.png"]];
        //CarFilesOutput/car_images_FISWL/dest_title_rect
        [self addSubview:view];
        
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(35, 13, 200, self.bounds.size.height - 14)];
        MainModel *main = [[MainModel alloc] init];
        main = _arr[i] ;
        
        lable.text = main.title;
        lable.font = [UIFont systemFontOfSize:14];
        [self addSubview:lable];

    }
    
}
@end
