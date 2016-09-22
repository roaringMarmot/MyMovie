//
//  PhotoScrollView.m
//  WXMovie
//
//  Created by MyMac on 16/8/30.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "PhotoScrollView.h"

@implementation PhotoScrollView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imgView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:_imgView];
        //设置缩放的最大、最小倍数
        self.maximumZoomScale = 4.0;
        self.minimumZoomScale = 1.0;
        
        //隐藏滚动条
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        //设置代理
        self.delegate = self;
        
        //创建单击手势对象
        /*
         UIPanGestureRecognizer 轻扫
         UIPinchGestureRecognizer 捏合
         UILongPressGestureRecognizer 长按
         */
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2:)];
        
        //设置点击次数
        tap2.numberOfTapsRequired = 2;
        
        //设置触摸手指的数量
//        tap1.numberOfTouchesRequired = 2;
        
        //添加手势
        [self addGestureRecognizer:tap2];
        
//        
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap1:)];
        
        //设置点击次数
        tap1.numberOfTapsRequired = 1;
        
        [self addGestureRecognizer:tap1];
        //设置图片填充方式
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        
        //当tap2手势触发时，让tap1失效
        [tap1 requireGestureRecognizerToFail:tap2];
    }
    return self;
    
}
-(void)tap1:(UITapGestureRecognizer *)tap1{
    NSLog(@"成功单击一次");
    
    //发送通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"玉材" object:self];
    
    
}



-(void)tap2:(UITapGestureRecognizer *)tap2{
    NSLog(@"成功双击一次");
    
//    NSLog(@"%@",tap2);
    if (self.zoomScale > 1.0) {
        [self setZoomScale:1.0 animated:YES];
    }else{
        [self setZoomScale:3.0 animated:YES];
    }
    
}
-(void)setUrl:(NSURL *)url{
    if (_url != url) {
        _url = url;
        
        //加载网络图片
        [_imgView sd_setImageWithURL:url];
    }
}
#pragma mark - UIScrollViewDelegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imgView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
