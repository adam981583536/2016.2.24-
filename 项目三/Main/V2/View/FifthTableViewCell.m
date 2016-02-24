//
//  FifthTableViewCell.m
//  项目三
//
//  Created by huiwen on 16/2/19.
//  Copyright © 2016年 李小红和绿小明. All rights reserved.
//

#import "FifthTableViewCell.h"
#import "MainModel.h"
#import <CoreText/CoreText.h>
#import "NSDate+TimeAgo.h"
@implementation FifthTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(MainModel *)model{
    if (_model != model) {
        
        _model = model;
        _Image.layer.cornerRadius = 6;
        _Image.layer.masksToBounds = YES;
        _userImage.layer.cornerRadius = _userImage.frame.size.width/2;
        _userImage.layer.masksToBounds = YES;
        if ([_model.type isEqualToNumber:@7]) {
           // NSLog(@"7");
            _type7SubLabel.hidden = NO;
            _type7Label.hidden = NO;
            [_Image sd_setImageWithURL:[NSURL URLWithString:model.cover]];
            _type7Label.text = model.type7Title;
            _type7SubLabel.text = model.sub_title;
            _type7SubLabel.textColor = [UIColor whiteColor];
            _type7Label.textColor = [UIColor whiteColor];
            
            _type7SubLabel.textAlignment = 1;
            _type7Label.textAlignment = 1;
            _type7Label.font = [UIFont systemFontOfSize:17];
            _type7SubLabel.font = [UIFont systemFontOfSize:13];
            _BigTitle.hidden = YES;
            _userImage.hidden = YES;
            _by.hidden = YES;
            _userName.hidden = YES;
            _label1.hidden = YES;
            _lable2.hidden = YES;
            _blueImage.hidden = YES;
            
        }else{
            _type7SubLabel.hidden = YES;
            _type7Label.hidden = YES;
            _BigTitle.hidden = NO;
            _userImage.hidden = NO;
            _by.hidden = NO;
            _userName.hidden = NO;
            _label1.hidden = NO;
            _lable2.hidden = NO;
            _blueImage.hidden = NO;

    //        NSLog(@"4");
            [_Image sd_setImageWithURL:[NSURL URLWithString:model.cover_image]];
            if ([model.index_title isEqualToString:@""]) {
                _BigTitle.text = model.name;
            }else{
                
                _BigTitle.text = model.index_title;

            }
            _BigTitle.textColor = [UIColor whiteColor];
            _BigTitle.numberOfLines = 0;
            _BigTitle.font = [UIFont systemFontOfSize:18];
            [_userImage sd_setImageWithURL:[NSURL URLWithString:model.avatar_m]];
            _by.text = @"by";
            _by.textColor = [UIColor whiteColor];
            _by.font = [UIFont systemFontOfSize:13];
            _userName.text = model.userName;
            _userName.textColor =[UIColor whiteColor];
            _userName.font = [UIFont systemFontOfSize:13];
            [_blueImage setImage:[UIImage imageNamed:@"geo_ok@2x.png"]];
            //CarFilesOutput/car_images_FISWL/
            _blueImage.layer.cornerRadius = 2;
            _blueImage.layer.masksToBounds = YES;
        //    CGFloat height = self.frame.size.height/2;
         //   _blueImage.frame.size.height = height;
            
            _lable2.text = model.popular_place_str;
       //     NSString *string = _lable2.text;
            _lable2.textColor = [UIColor whiteColor];
          //  _lable2.font = [UIFont systemFontOfSize:10];
//            NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
//             [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:NSMakeRange(0, string.length)];
//            [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Verdana-BoldItalic" size:11] range:NSMakeRange(0, string.length)];
//            
            _lable2.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:11];
         //   day = [model.first_day intValue] - [model.last_day intValue];
            
//            NSArray *first =  [model.first_day componentsSeparatedByString:@"-"];
//            
//            NSArray *last = [model.last_day componentsSeparatedByString:@"-"];
                        //            NSString *str = [model.first_day stringByAppendingString:[NSString stringWithFormat:@"  %d",day]];
//            NSString *s = [str stringByAppendingString:model.view_count];
//            _label1.text = s;
 //           NSTimeInterval  timeZoneOffset=[[NSTimeZone systemTimeZone] secondsFromGMT];
//            NSDateFormatter *df = [[NSDateFormatter alloc]init];
//             [df setDateFormat:@"yyyy-MM-dd"];
//            
//            [df setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
//    //  [df setLocale:[NSLocale currentLocale]];
//            df.timeZone = [NSTimeZone systemTimeZone];
//            NSDate *s = [df dateFromString:model.first_day];
////            NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:@"NSGregorianCalendar"];
////            [calendar setTimeZone:[NSTimeZone timeZoneWithName:@"zh_CN"]];
////            
////            []
//            NSDate *s1 = [df dateFromString:model.last_day];
//            int s2 = [s1 timeIntervalSinceDate:s]/60/60/24;
//            
          //  NSLog(@"天数%1.0f",s2/60/60/24);
                NSString *my = @"";
                NSString *string = [my stringByAppendingString:[NSString stringWithFormat:@"%@",model.first_day]];
                NSString *string1 = [string stringByAppendingString:[NSString stringWithFormat:@" %@",model.day_count]];
                NSString *string2 = [string1 stringByAppendingString:[NSString stringWithFormat:@" %@ 次浏览",model.view_count]];
            _label1.text = string2;
                //  _label1.font = [UIFont systemFontOfSize:11];
                
                _label1.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:11];
                _label1.textColor = [UIColor whiteColor];
            

        }

    }
}
@end
