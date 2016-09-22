//
//  PhotoScrollView.h
//  WXMovie
//
//  Created by MyMac on 16/8/30.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>
{
    UIImageView *_imgView;//用的图片(放大，缩小)
}
@property(nonatomic,strong)NSURL *url;
@end
