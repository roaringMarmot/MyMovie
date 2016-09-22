//
//  NewsCell.m
//  WXMovie
//
//  Created by MyMac on 16/8/28.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "NewsCell.h"
#import "NewsModel.h"
@implementation NewsCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setNews:(NewsModel *)news{
    if (news != nil) {
        _news = news;
        _summaryLabel.transform = CGAffineTransformIdentity;
        NSString *urlString = self.news.image;
        [_imgView sd_setImageWithURL:[NSURL URLWithString:urlString]];
        _titleLabel.text = self.news.title;
        _summaryLabel.text = self.news.summary;
        
        NSInteger type = [self.news.type integerValue];
        if (type == 0) {//普通新闻
            _iconImg.hidden = YES;
            CGRect frame = _iconImg.frame;
            CGRect frame2 = _summaryLabel.frame;
//            frame2.origin.x = frame.origin.x;
//            NSLog(@"前:_summaryLabel.frame.origin.x = %f",_summaryLabel.frame.origin.x);
//            _summaryLabel.frame = frame2;
            
            //获取偏移的x轴的量
            CGFloat x1 = frame2.origin.x - frame.origin.x;
            
//            NSLog(@"后:_summaryLabel.frame.origin.x = %f",_summaryLabel.frame.origin.x);
            
        _summaryLabel.transform = CGAffineTransformMakeTranslation(-x1, 0);

            
        
        }else if (type == 1){//图片新闻
            _iconImg.hidden = NO;
            _iconImg.image = [UIImage imageNamed:@"sctpxw@2x"];
            
        }else if (type == 2){//视频新闻
            _iconImg.hidden = NO;
            _iconImg.image = [UIImage imageNamed:@"scspxw@2x"];

        }
        
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
