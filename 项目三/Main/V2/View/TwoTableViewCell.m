//
//  TwoTableViewCell.m
//  项目三
//
//  Created by huiwen on 16/2/18.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "TwoTableViewCell.h"
#import "MainModel.h"
#import "TabBarControl.h"
#import "AllViewController.h"
@implementation TwoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setTwoArr:(NSMutableArray *)twoArr{
    
    
    
        _twoArr = twoArr;
        
        [self _creatView];

    

}
- (void)_creatView{
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 10, self.bounds.size.height - 20)];
    
    //view.backgroundColor = [UIColor redColor];
   // NSLog(@"1%lf",self.bounds.size.height);

    [view setImage:[UIImage imageNamed:@"dest_title_rect@2x.png"]];
    //CarFilesOutput/car_images_FISWL/
    [self addSubview:view];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(35, 13, 200, self.bounds.size.height - 14)];
    //lable.backgroundColor = [UIColor redColor];
    for (int i = 0; i < _twoArr.count; i++) {
        MainModel *main = [[MainModel alloc] init];
        main = _twoArr[i] ;
        
        lable.text = main.title;
        
    }
    lable.font = [UIFont systemFontOfSize:14];
    [self addSubview:lable];
    
    if (_twoArr.count != 0) {
        TabBarControl *control = [[TabBarControl alloc] initWithFrame:CGRectMake(kScreenWidth - 60, 10 , 40, self.bounds.size.height - 14) withImageName:@"CarFilesOutput/car_images_FISWL/featured_section_arrow@2x.png" withTitleName:@"全部"];
        
        [control addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:control];
    }
    
}
- (void)pressButton:(UIButton *)sender{
   // AllViewController *all = [[AllViewController alloc] init];
    NSLog(@"快跳到全部啊");
  //  all.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"push" object:self];
    
    
}
@end
