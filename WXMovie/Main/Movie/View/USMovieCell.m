//
//  USMovieCell.m
//  WXMovie
//
//  Created by MyMac on 16/8/26.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "USMovieCell.h"
#import "Movie.h"
#import "UIImageView+WebCache.h"
#import "StarView.h"
@implementation USMovieCell


- (void)awakeFromNib {
    //去掉背景颜色
    self.backgroundColor = [UIColor clearColor];
    //去掉选中风格
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    


}

//-(void)layoutSubviews{
//    [super layoutSubviews];
//    //单元格的数据传递
//    titleLabel.text = self.movie.title;
//    
//    yearLabel.text = [NSString stringWithFormat:@"年份:%@",self.movie.year];
//    
//    ratingLabel.text = [NSString stringWithFormat:@"%.1f",[self.movie.average floatValue]];
//    //图片加载
//    NSString *small = [self.movie.images objectForKey:@"small"];
//    
//    //1.将取出的字符串转化成url
//    NSURL *url = [NSURL URLWithString:small];
//    
//    [imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig"]];
//
//    
//}
-(void)setMovie:(Movie *)movie{
    _movie = movie;
    //单元格的数据传递
    titleLabel.text = self.movie.title;
    
    yearLabel.text = [NSString stringWithFormat:@"年份:%@",self.movie.year];
    
    ratingLabel.text = [NSString stringWithFormat:@"%.1f",[self.movie.average floatValue]];
    //图片加载
    NSString *small = [self.movie.images objectForKey:@"small"];
    
    //1.将取出的字符串转化成url
    NSURL *url = [NSURL URLWithString:small];
    
    [imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig"]];
    
    
    starView.rating = [self.movie.average floatValue];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
