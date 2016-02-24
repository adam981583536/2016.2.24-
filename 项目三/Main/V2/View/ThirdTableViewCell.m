//
//  ThirdTableViewCell.m
//  项目三
//
//  Created by huiwen on 16/2/18.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "ThirdTableViewCell.h"
#import "MyVIew.h"
#import "MainModel.h"
@implementation ThirdTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setMyArr:(NSMutableArray *)myArr{
    _myArr = myArr;
    
    [self _creatView];
}
- (void)_creatView{
    for (int i = 0; i < _myArr.count; i ++) {
        if (i < 2) {
//            MyVIew *myView = [[MyVIew alloc] initWithFrame:CGRectMake(i * (kScreenWidth - 5)/2 +5, 6, (kScreenWidth -15)/2 , self.frame.size.height/2 - 10)];
            
            MyVIew *myView = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil]lastObject];
            myView.frame = CGRectMake(i * (kScreenWidth - 5)/2 +5, 6, (kScreenWidth -15)/2 , self.frame.size.height/2 - 10);
         //   myView.backgroundColor = [UIColor redColor];
            myView.layer.cornerRadius = 6;
            myView.layer.masksToBounds = YES;//设置成圆角
            myView.tag = 666 + i;
            myView.model = _myArr[i];
            myView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
            [myView addGestureRecognizer:tap];
            
            [self addSubview:myView];

        }
        if (i >= 2) {
//            MyVIew *myView = [[MyVIew alloc] initWithFrame:CGRectMake((i - 2) * (kScreenWidth - 5)/2 +5, self.frame.size.height/2 + 8, (kScreenWidth -15)/2 , self.frame.size.height/2 - 10)];
//            
//            myView.backgroundColor = [UIColor redColor];
           // myView.
            MyVIew *myView = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil]lastObject];
            myView.frame = CGRectMake((i - 2) * (kScreenWidth - 5)/2 +5, self.frame.size.height/2 + 8, (kScreenWidth -15)/2 , self.frame.size.height/2 - 10);
            myView.layer.cornerRadius = 6;
            myView.layer.masksToBounds = YES;
            myView.tag = 666 + i;
            myView.model = _myArr[i];
            [self addSubview:myView];
            myView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
            [myView addGestureRecognizer:tap];

          //  NSLog(@"2");
        }
    }
}
- (void)tapAction:(UITapGestureRecognizer *)tap{

  //  NSLog(@"单击了");
    
 //   NSLog(@"%ld",tap.view.tag);
    MainModel *main = [[MainModel alloc] init];
    main = _myArr[tap.view.tag - 666];
    
    NSString *str = [NSString stringWithFormat:@"%@",main.spot_id];
 //   NSLog(@"%@",str);
    self.returnMyBlock(str);

}
@end
