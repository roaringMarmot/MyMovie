//
//  WXTabBarItem.m
//  WXMovie
//
//  Created by MyMac on 16/8/25.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "WXTabBarItem.h"

@implementation WXTabBarItem
-(instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imgName title:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self != nil) {
        //图片子视图
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width - 20)/2, 5, 20, 20)];
        imageView.image = [UIImage imageNamed:imgName];
        //设置图片内容模式，默认情况下拉伸填充
        //改为原图填充
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        
        //创建标题视图
        CGFloat maxY = CGRectGetMaxY(imageView.frame);
//        NSLog(@"%.1f",maxY);
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, maxY, frame.size.width, 20)];
        //设置label的内容
        titleLabel.text = title;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:titleLabel];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
