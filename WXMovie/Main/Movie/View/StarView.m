//
//  StarView.m
//  WXMovie
//
//  Created by MyMac on 16/8/26.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "StarView.h"
#import "UIViewExt.h"
@implementation StarView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //创建子视图
        [self _createView];
        
    }
    return self;
}

-(void)awakeFromNib{
    [self _createView];
}
-(void)_createView{
    UIImage *yellowImg = [UIImage imageNamed:@"yellow"];
    UIImage *grayImg = [UIImage imageNamed:@"gray"];
    
    //1.创建灰色星星
    _grayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, grayImg.size.width * 5, grayImg.size.height)];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:grayImg];
    [self addSubview:_grayView];
    //2.创建黄色星星
    _yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, yellowImg.size.width * 5, yellowImg.size.height)];
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImg];
    [self addSubview:_yellowView];
    
    //3.设置当前视图的宽度为5个星星的宽度
    CGFloat star5Width = yellowImg.size.width * 5;
    

    self.width = star5Width;
    
    
    CGFloat scale = self.frame.size.height / yellowImg.size.height;
    NSLog(@"%1f",scale);
    //放大星星(原图星星太小)
    CGAffineTransform t = CGAffineTransformMakeScale(scale, scale);
    _grayView.transform = t;
    _yellowView.transform = t;
    
    
    _grayView.origin = CGPointZero;
    _yellowView.origin = CGPointZero;
    
    //给当前视图一个透明背景，便于观察
    self.backgroundColor = [UIColor clearColor];
    
}
//保证设置星星的时候，rating已经存在
-(void)setRating:(CGFloat)rating{
    _rating = rating;
    
    //1.计算分数的百分比
    CGFloat s = rating / 10.0;
    //2.黄色视图的宽度进行相应的变化
    
    //1)先修改黄色星星的宽度（这边注意，我们要用已经改变了的宽度进行设置）
    CGFloat width = self.frame.size.height / [UIImage imageNamed:@"yellow"].size.height
    *[UIImage imageNamed:@"yellow"].size.width * 5 *s;
    NSLog(@"----%f",width);
    CGFloat width2 = self.frame.size.width * s;
    NSLog(@"------%f",width2);
    //2)设定黄色星星的宽度
    _yellowView.width = width;
    
    
    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
